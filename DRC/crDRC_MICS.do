	
	global user "/Users/catherine.arsenault/Dropbox/BMGF RISP Project/Quant analysis/"

 * DRC MICS 2017-18
 import spss using "$user/RAW DATA/DRC/MICS 2017-18/DRCongo MICS6 SPSS Datafiles/ch.sav", clear
 
	gen weight=chweight/1000000
	g province=HH7
	lab val province labels431
	recode province (4 9 10 14 18 26 =1) (1/3 5/8 11/13 15/17 19/25=0), g(orig6nokin)
			// Kwilu, Mongala, Tshuapa, Haut Katanga, Ituri, Kasaï
			
	recode province (1=1) (20=2) (21=3) (19=4) (4 9 10 14 18 26 =5) (2/3 5/8 11/13 15/17 22/25=.), g(provcat)
	
	lab def provcat 1"Kinshasa" 2"Haut Lomami" 3"Tanganyika" 4 "Lualaba" 5"Other 6 initial Mashako plan provinces"
	
	lab val provcat provcat 
	decode provcat, g(provs)
	replace windex10 = windex10u if provcat==1

*-------------------------------------------------------------------------------	
* Penta3
	* By card
		recode IM2 4/9=0 2/3=1, gen(card) // can I see the card?
		
		recode IM6PENTA3D 1/66=1 99=0, gen(penta3day)
		recode IM6PENTA3M 1/44=1 99=0, gen(penta3month)
		recode IM6PENTA3Y 2015/4444=1 9999=0, g(penta3yr)
		
		egen penta3_card = rowmax(penta3day penta3month penta3yr) // 1 if there's a date 
			
		replace penta3_card =0 if card==0 // kids with no card
	
	* By recall	
		recode  IM11 2/9=0,  g(recall) // did the kid get any vaccines?
		recode IM21 3/7=1 1/2=0 8/9=0, g(penta3_recall) // number of penta doses
			
			replace penta3_recall= 0 if recall==0 // no vaccines 
		
	* Combining card and recall
		egen penta3 =rowmax(penta3_card penta3_recall) // if either one is true 
		
		ta penta3 if UB2==1 [aw=weight] // 47.7% among kids aged 1 yrs old, UB2 is in years (12-23 months)
*-------------------------------------------------------------------------------		
* MCV
		* By card
		recode IM6MD 1/66=1 99=0, g(mcvday)
		recode IM6MM 1/66=1 99=0, g(mcvmonth)
		recode IM6MY 2015/6666=1 9999=0, g(mcvyr)
		
		egen mcv_card = rowmax(mcvday mcvmonth mcvyr) 
		replace mcv_card=0 if card==0
		* By recall 
		recode IM26 2=0 8/9=0, g(mcv_recall)
		replace mcv_recall = 0 if recall==0
		
		egen mcv=rowmax(mcv_card mcv_recall)
		
		ta mcv if UB2==1 [aw=weight] 
*-------------------------------------------------------------------------------				
* BCG 
		* By card
		recode IM6BD 1/66=1 99=0, g(bcgday)
		recode IM6BM 1/66=1 99=0, g(bcgmonth)
		recode IM6BY 2015/6666=1 9999=0, g(bcgyr)
		
		egen bcg_card = rowmax(bcgday bcgmonth bcgyr) 
		replace bcg_card=0 if card==0
		* By recall 
		recode IM14 2=0 8/9=0, g(bcg_recall)
		replace bcg_recall = 0 if recall==0
		
		egen bcg=rowmax(bcg_card bcg_recall)
		
		ta bcg if UB2==1 [aw=weight] 
 *-------------------------------------------------------------------------------				
* OPV1   
		* By card
		recode IM6P1D 1/66=1 97/99=0, g(opv1day)
		recode IM6P1M 1/66=1 97/99=0, g(opv1month)
		recode IM6P1Y 2015/6666=1 9997/9999=0, g(opv1yr)
		
		egen opv1_card = rowmax(opv1day opv1month opv1yr) 
		replace opv1_card=0 if card==0
		
		
		recode IM18 1/7=1  8/9=0, g(opv1_recall)
		
		replace opv1_recall= 0 if recall==0 // no vaccines recalled by mother
		
		egen opv1=rowmax(opv1_card opv1_recall)

		ta opv1 if UB2==1 [aw=weight]
*-------------------------------------------------------------------------------				
* OPV3   
		* By card
		recode IM6P3D 1/66=1 99=0, g(opv3day)
		recode IM6P3M 1/44=1 99=0, g(opv3month)
		recode IM6P3Y 2015/4444=1 9999=0, g(opv3yr)
		
		egen opv3_card = rowmax(opv3day opv3month opv3yr) 
		replace opv3_card=0 if card==0
		
		/* By recall 
		recode IM18 1/2=0 3/7=1  8/9=0, g(polio3_rec)  
		recode IM18 1/3=0 4/7=1 8/9=0, g(polio4_rec)
		
		recode IM17 2=0 8/9=. 
		
		g opv3_recall = polio3_rec if IM17==0
		replace opv3_recall = polio4 if IM17==1 */
		
		recode IM18 1/2=0 3/7=1  8/9=0, g(opv3_recall)
		
		replace opv3_recall= 0 if recall==0 // no vaccines recalled by mother
		
		egen opv3=rowmax(opv3_card opv3_recall)

*-------------------------------------------------------------------------------				
* Fully vaccinated
	egen covbase_comb = rowtotal(bcg penta3 mcv opv3)
	recode covbase_comb 0/3=0 4=1
	

	global vaccines bcg opv3 penta3 mcv covbase_comb 
	
	* Vaccination coverage (12-23 months)
	tabstat $vaccines [aw=weight] if UB2==1 , stat (mean) col(stat)
	tabstat $vaccines [aw=weight] if UB2==1 , by(province) stat (mean) 
	tabstat $vaccines [aw=weight] if UB2==1, by(HH6) stat (mean) 
	tabstat $vaccines [aw=weight] if UB2==1, by(HL4) stat (mean) 
*-------------------------------------------------------------------------------				
* ZDC (no penta1)

* By card
		recode IM6PENTA1D 1/66=1 99=0, gen(penta1day)
		recode IM6PENTA1M 1/66=1 99=0, gen(penta1month)
		recode IM6PENTA1Y 2015/6666=1 9999=0, g(penta1yr)
		
		egen penta1_card = rowmax(penta1day penta1month penta1yr) // 1 if there's a date 
			
		replace penta1_card =0 if card==0 // kids with no card
	
	* By recall	
		recode IM21 1/7=1  8/9=0, g(penta1_recall) // number of penta doses
			
			replace penta1_recall= 0 if recall==0 // no vaccines 
		
	* Combining card and recall
		egen penta1 =rowmax(penta1_card penta1_recall) // if either one is true 
		
		ta penta1 if UB2==1 [aw=weight] 
		recode penta1 1=0 0=1, g(zdc)
		ta zdc if UB2==1 [aw=weight] 

save "$user/Data for analysis/DRC_2017_18_MICS.dta", replace

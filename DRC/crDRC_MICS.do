	
	global user "/Users/catherine.arsenault/Dropbox/BMGF RISP Project/Quant analysis/RAW DATA/DRC"

 * DRC MICS 2017-18
 import spss using "$user/MICS 2017-18/DRCongo MICS6 SPSS Datafiles/ch.sav", clear
 
	gen weight=chweight/1000000
	recode  melevel 0/1=0 2/4=1 9=., g(educ2)
	lab def educ2 0"No educ or primary only" 1"Secondary or higher"
	lab val educ2 educ2 
	g province=HH7
	lab val province labels431
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

	global vaccines penta3 mcv bcg opv3 covbase_comb
	
	* Vaccination coverage (12-23 months)
	tabstat $vaccines [aw=weight] if UB2==1 , by(province) stat (mean) 

/* INEQUALITIES BY WEALTH 
	cd "/Users/catherine.arsenault/Dropbox/9 PAPERS & PROJECTS/BMGF RISP Project/Quant analysis/Archive"
	
	putexcel set "DRC inequalities MICS2018.xlsx", sheet("Penta3") modify
	
	* By wealth 
		recode windex10 0=.
		replace windex10 = windex10u if HH7==1 // urban wealth quintiles in Kinshasa
		wridit windex10 [aw=weight] , gen(wealth_rank)
		
		levelsof HH7, local(province)
		
		local row = 2
		
		foreach p of local province {
			
				logit penta3 wealth_rank [pw=weight]  if UB2==1 & HH7==`p', nolog
				margins, at(wealth_rank=(0 1)) post
				
				nlcom (RII: (_b[2._at] / _b[1._at])), post
		
				putexcel A`row'= ("`p'")
				putexcel B`row'=(r(N))
				
				putexcel C`row'=(_b[RII])
				putexcel D`row'= (_b[RII]-invnormal(1-.05/2)*_se[RII])
				putexcel E`row'= (_b[RII]+invnormal(1-.05/2)*_se[RII])
				local row = `row' + 1
			}
			
* INEQUALITIES BY EDUCATION
		recode melevel 9=. 4=3, g(educ4)
		wridit educ4 [aw=weight] , gen(educ_rank)
		
		levelsof HH7, local(province)
		
		local row = 40
		
		foreach p of local province {
			
				logit penta3 educ_rank [pw=weight]  if UB2==1 & HH7==`p', nolog
				margins, at(educ_rank=(0 1)) post
				
				nlcom (RII: (_b[2._at] / _b[1._at])), post
		
				putexcel A`row'= ("`p'")
				putexcel B`row'=(r(N))
				
				putexcel C`row'=(_b[RII])
				putexcel D`row'= (_b[RII]-invnormal(1-.05/2)*_se[RII])
				putexcel E`row'= (_b[RII]+invnormal(1-.05/2)*_se[RII])
				local row = `row' + 1
			}

* EDUC ANALYSES
	tabstat penta3 [aw=weight] if UB2==1, by(educ2)
	tabstat penta3 [aw=weight] if UB2==1 & HH7==20, by(educ2)		
	tabstat penta3 [aw=weight] if UB2==1 & HH7==21, by(educ2)	
	
	
* Pakistan DHS 2017-18
import spss using "/Users/catherine.arsenault/Dropbox/9 PAPERS & PROJECTS/BMGF RISP Project/Quant analysis/RAW DATA/Pakistan/DHS Pakistan 2017-18 All Datasets/PKKR71SV/PKKR71FL.SAV", clear

	g weight = V005/1000000
	
	recode H2 1/3=1 8=., gen(bcg) 
	
	tab bcg [aw=weight] if B19>=12 & B19<=23

	
* Niger DHS 2012

	g weight = v005/1000000
	
	recode h2 
	recode h8 1/3=1 8/9=., g(polio3) 
	recode h4 1/3=1 8/9=., g(polio1) 
	
	ta polio3 [aw=weight] if hw1>=12 & hw1<=23
	ta polio1 [aw=weight] if hw1>=12 & hw1<=23
	
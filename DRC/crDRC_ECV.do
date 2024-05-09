	
	global user "/Users/catherine.arsenault/Dropbox/BMGF RISP Project/Quant analysis/RAW DATA/DRC"
*-------------------------------------------------------------------------------
* ECV 2021

u "$user/ECV/ECV_2021_Datasets/ECV_2021_Enfants.dta", clear

	g weight= ponderation
	drop province
	encode q101, g(province)
	recode province (3 6 10 11 13 17 26 =1) (1/2 4/5 7/9 12 14/16 18/25=0), g(orig7)
		// Mongala, Tshuapa, Haut Katanga, Ituri, Kinsha, Kwilu, Kasaï
	recode province (3 6 10 13 17 26 =1) (1/2 4/5 7/9 11 12 14/16 18/25=0), g(orig6nokin)

	recode qa104 (8/9=.), g(educ)
	lab val educ qa104
	recode educ 0/1=0 2/3=1, g(educ2)
	lab def educ2 0"No educ or primary only" 1"Secondary or higher"
	lab val educ2 educ2 
	
	recode dose0penta 1=0 2=1
	lab drop dose0penta
	
	global vaccines bcg_merg  vpo0_card vpo1_merg vpo3_merg penta1_merg penta3_merg ///
				 pcv1_merg pcv3_merg vpi_merg rota1_merg rota3_merg var_merg ///
				 vaa_merg covcom_comb  covbase_comb dose0penta dose0
				 
	foreach v of global vaccines {
		recode `v' 2=0
	}
	
	* Vaccination coverage (12-23 months)
	tabstat $vaccines [aw=weight] if agecat==2 , by(province) stat (mean) 
	tabstat $vaccines [aw=weight] if agecat==2 & orig6nokin==1 , stat (mean) col(stat)
	tabstat $vaccines [aw=weight] if agecat==2 , by(province) stat(count) 
	
	
*-------------------------------------------------------------------------------
* ECV 2022		
u "$user/ECV/ECV_2022_VAC_Ménages_Mere_Enfants_VT_28052023", clear	

	g weight= ponderation
	drop province
	encode q101, g(province)

	recode province (3 6 10 11 13 17 26 =1) (1/2 4/5 7/9 12 14/16 18/25=0), g(orig7)
		// Mongala, Tshuapa, Haut Katanga, Ituri, Kinsha, Kwilu, Kasaï
	recode province (3 6 10 13 17 26 =1) (1/2 4/5 7/9 11 12 14/16 18/25=0), g(orig6nokin)

	
	recode qa104 (8/9=.), g(educ)
	lab val educ qa104
	rename dose0_1 dose0
	recode dose0penta 1=0 2=1
	lab drop dose0penta
				 
	foreach v of global vaccines {
		recode `v' 2=0
	}
	
	egen vpo3vpi=rowtotal(vpo3_merg vpi_merg)
	recode vpo3vpi 1=0 2=1
	
	* Vaccination coverage (12-23 months)
	tabstat $vaccines [aw=weight] if agecat==2 , by(province) stat (mean) 
	tabstat $vaccines [aw=weight] if agecat==2 & orig6nokin==1 , stat (mean) col(stat)
	tabstat $vaccines [aw=weight] if agecat==2 , by(province) stat(count) 
	
	* Polio vaccination by aire de santé
preserve 
	collapse (mean) vpo3_merg vpi_merg vpo3vpi (count) n_vpo3_merg=vpo3_merg n_vpi_merg=vpi_merg ///
		n_vpo3vpi= vpo3vpi [aw=weight] if  (province==4 | province==14 | province==24) , by(province q103 q105) 
	order province, before(q103)
	export excel using "/Users/catherine.arsenault/Dropbox/BMGF RISP Project/Quant analysis/Results/DRC/polio_aire", firstrow(var) replace
restore
*-------------------------------------------------------------------------------
* ECV 2020	
u "$user/ECV/Base ECV 2020 Finale.dta", clear
	
	g dose0penta= penta1combinew==0
	g dose0= aucun8 ==0
	recode prov (1 3 4 10 13 18 =1) (2 5/9 11 12 14/17 =0), g(orig6nokin)
	
	global vaccines bcgcombinew polyo0combinew polyo1combinew polyo3combinew ///
			penta1combinew penta3combinew pneumo1combinew pneumo3combinew ///
			VPIcombinew rota1combinew rota3combinew varcombinew vaacombinew ///
			couvecomb13 couvebasecomb dose0penta dose0
			
	* Vaccination coverage (12-23 months)
	tabstat $vaccines [aw=weight] if agecat==2 , by(province) stat (mean) 
	tabstat $vaccines [aw=weight] if agecat==2 & orig6nokin==1 , stat (mean) col(stat)
	


	


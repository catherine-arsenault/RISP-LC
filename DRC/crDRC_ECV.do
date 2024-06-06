	
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
	gen provcat = 1 if province== 11 
	replace provcat = 2 if province==4  
	replace provcat = 3 if province == 24
	replace provcat = 4 if province == 14
	replace provcat = 5 if province == 3 |  province== 6  | province == 10  |  province == 13  |  province == 17  |  province == 26
	lab def provcat 1"Kinshasa" 2"Haut Lomami" 3"Tanganyika" 4 "Lualaba" 5"Other 6 initial Mashako plan provinces"
	lab val provcat provcat 
	
	
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
	egen vpo3vpi=rowtotal(vpo3_merg vpi_merg)
	recode vpo3vpi 1=0 2=1
	
	* Vaccination coverage (12-23 months)
	tabstat $vaccines [aw=weight] if agecat==2 , by(provcat) stat (mean) 
preserve 
	collapse (mean) vpo3_merg vpi_merg vpo3vpi (count) n_vpo3_merg=vpo3_merg n_vpi_merg=vpi_merg ///
		n_vpo3vpi= vpo3vpi [aw=weight] if  (province==4 | province==14 | province==24) , by(province q103 q105) 
	order province, before(q103)
	export excel using "/Users/catherine.arsenault/Dropbox/BMGF RISP Project/Quant analysis/Results/DRC/polio_aire_Jun2024", sheet("ECV21", replace) firstrow(var) 
restore 


/* keep if agecat==2 
	keep weight provcat penta3_merg covbase_comb vpo3_merg
	gen post=1
	rename penta3_merg penta3 
	rename covbase_comb fullvax
	rename vpo3_merg opv3

	save "/Users/catherine.arsenault/Dropbox/BMGF RISP Project/Quant analysis/Data for analysis/DRC4tmp.dta", replace
	*/

*-------------------------------------------------------------------------------
* ECV 2022		
u "$user/ECV/ECV_2022_VAC_Ménages_Mere_Enfants_VT_28052023", clear	

	g weight= ponderation
	drop province
	encode q101, g(province)
	gen provcat = 1 if province== 11 
	replace provcat = 2 if province==4  
	replace provcat = 3 if province == 24
	replace provcat = 4 if province == 14
	replace provcat = 5 if province == 3 | province == 6  |  province == 10  |  province== 13  |  province == 17  | province == 26
	lab def provcat 1"Kinshasa" 2"Haut Lomami" 3"Tanganyika" 4 "Lualaba" 5"Other 6 initial Mashako plan provinces"
	lab val provcat provcat 
	
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
	tabstat $vaccines [aw=weight] if agecat==2 , by(provcat) stat (mean) 
	
	* Polio vaccination by aire de santé
preserve 
	collapse (mean) vpo3_merg vpi_merg vpo3vpi (count) n_vpo3_merg=vpo3_merg n_vpi_merg=vpi_merg ///
		n_vpo3vpi= vpo3vpi [aw=weight] if  (province==4 | province==14 | province==24) , by(province q103 q105) 
	order province, before(q103)
	export excel using "/Users/catherine.arsenault/Dropbox/BMGF RISP Project/Quant analysis/Results/DRC/polio_aire_Jun2024", sheet("ECV22")firstrow(var) modify
restore 

/* keep if agecat==2 
	keep weight provcat penta3_merg covbase_comb vpo3_merg provi
	gen post=1
	rename penta3_merg penta3 
	rename covbase_comb fullvax
	rename vpo3_merg opv3
	save "/Users/catherine.arsenault/Dropbox/BMGF RISP Project/Quant analysis/Data for analysis/DRC5tmp.dta", replace 
	*/


*-------------------------------------------------------------------------------
* ECV 2020	
u "$user/ECV/Base ECV 2020 Finale.dta", clear
	
	g dose0penta= penta1combinew==0
	g dose0= aucun8 ==0
	gen provcat = 1 if prov== 7
	replace provcat = 2 if prov==2 
	replace provcat = 3 if prov == 16
	replace provcat = 5 if prov ==13  |  prov == 18  |  prov==1   |  prov==3  |  prov== 10  |  prov ==4
	// Mongala, Tshuapa, Haut Katanga, Ituri, Kinsha, Kwilu, Kasaï
	lab def provcat 1"Kinshasa" 2"Haut Lomami" 3"Tanganyika" 4 "Lualaba" 5"Other 6 initial Mashako plan provinces"
	lab val provcat provcat 	
	global vaccines bcgcombinew polyo0combinew polyo1combinew polyo3combinew ///
			penta1combinew penta3combinew pneumo1combinew pneumo3combinew ///
			VPIcombinew rota1combinew rota3combinew varcombinew vaacombinew ///
			couvecomb13 couvebasecomb dose0penta dose0
			
	* Vaccination coverage (12-23 months)
	tabstat $vaccines [aw=weight] if agecat==2 , by(provcat) stat (mean) 
	egen vpo3vpi=rowtotal(polyo3combinew VPIcombinew)
	recode vpo3vpi 1=0 2=1
	
preserve 
	collapse (mean) polyo3combinew  VPIcombinew vpo3vpi (count) n_vpo3_merg=polyo3combinew n_vpi_merg=VPIcombinew ///
		n_vpo3vpi= vpo3vpi [aw=weight] if  (prov==2 | prov==16) , by(prov zs as) 
	order prov, before(zs)
	export excel using "/Users/catherine.arsenault/Dropbox/BMGF RISP Project/Quant analysis/Results/DRC/polio_aire_Jun2024", sheet("ECV20", replace) firstrow(var) 
restore 

/*	keep if agecat==2 
	keep weight provcat penta3combinew couvebasecomb  polyo3combinew 
	gen post=1
	rename penta3combine penta3
	rename couvebasecomb fullvax
	rename polyo3combinew opv3

save "/Users/catherine.arsenault/Dropbox/BMGF RISP Project/Quant analysis/Data for analysis/DRC3tmp.dta", replace
*/



	


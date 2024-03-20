	
	global user "/Users/catherine.arsenault/Dropbox/9 PAPERS & PROJECTS/BMGF RISP Project/Quant analysis/RAW DATA/DRC"
	cd "/Users/catherine.arsenault/Dropbox/9 PAPERS & PROJECTS/BMGF RISP Project/Quant analysis/"
*-------------------------------------------------------------------------------
* ECV 2021

u "$user/ECV/ECV_2021_Datasets/ECV_2021_Enfants.dta", clear

	g weight= ponderation
	drop province
	encode q101, g(province)
	
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
	tabstat $vaccines [aw=weight] if agecat==2 , by(province) stat(count) 
	
*-------------------------------------------------------------------------------
* ECV 2022		

u "$user/ECV/ECV_2022_VAC_Ménages_Mere_Enfants_VT_28052023", clear	

	g weight= ponderation
	drop province
	encode q101, g(province)
	
	recode qa104 (8/9=.), g(educ)
	lab val educ qa104
	rename dose0_1 dose0
	recode dose0penta 1=0 2=1
	lab drop dose0penta
				 
	foreach v of global vaccines {
		recode `v' 2=0
	}
	
	* Vaccination coverage (12-23 months)
	tabstat $vaccines [aw=weight] if agecat==2 , by(province) stat (mean) 
	tabstat $vaccines [aw=weight] if agecat==2 , by(province) stat(count) 
*-------------------------------------------------------------------------------
* ECV 2020	

u "$user/ECV/Base ECV 2020 Finale.dta", clear
	
	g dose0penta= penta1combinew==0
	g dose0= aucun8 ==0
	
	global vaccines bcgcombinew polyo0combinew polyo1combinew polyo3combinew ///
			penta1combinew penta3combinew pneumo1combinew pneumo3combinew ///
			VPIcombinew rota1combinew rota3combinew varcombinew vaacombinew ///
			couvecomb13 couvebasecomb dose0penta dose0
			
	* Vaccination coverage (12-23 months)
	tabstat $vaccines [aw=weight] if agecat==2 , by(province) stat (mean) 
	

	

/* INEQUALITIES BY EDUCATION
	cd "/Users/catherine.arsenault/Dropbox/9 PAPERS & PROJECTS/BMGF RISP Project/Quant analysis/Archive"
	
	putexcel set "DRC inequalities MICS2018.xlsx", sheet("Penta3 RII educ 2021") modify
	
		wridit educ [aw=weight] , gen(educ_rank)
		
		levelsof province, local(province)
		
		local row = 2
		
		foreach p of local province {
			
				logit penta3_merg educ_rank [pw=weight]  if agecat==2 & province==`p', nolog
				margins, at(educ_rank=(0 1)) post
				
				nlcom (RII: (_b[2._at] / _b[1._at])), post
		
				putexcel A`row'= ("`p'")
				putexcel B`row'=(r(N))
				
				putexcel C`row'=(_b[RII])
				putexcel D`row'= (_b[RII]-invnormal(1-.05/2)*_se[RII])
				putexcel E`row'= (_b[RII]+invnormal(1-.05/2)*_se[RII])
				local row = `row' + 1
			}
	
	


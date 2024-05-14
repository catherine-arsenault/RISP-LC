
global user "/Users/catherine.arsenault/Dropbox/BMGF RISP Project/Quant analysis/Data for analysis"

		u "$user/DRC1tmp.dta", clear
			drop if provcat==. // 1270
		append using "$user/DRC2tmp.dta"
			drop if provcat==. // 2887
		append using "$user/DRC3tmp.dta"
			drop if provcat==. // 24697
		append using "$user/DRC4tmp.dta"
			drop if provcat==. // 44963
		append using "$user/DRC5tmp.dta"
			drop if provcat==. // 63074
			
		recode provcat 5=1 
		lab def provcat 1"Other7" , modify
		
		
		
			logistic penta3 i.provcat i.post i.provcat#i.post [pw=weight], vce(robust)
			
			
			logistic fullvax i.provcat i.post i.provcat#i.post [pw=weight], vce(robust)
			
				
			logistic opv3 i.provcat i.post i.provcat#i.post [pw=weight], vce(robust)
		

	



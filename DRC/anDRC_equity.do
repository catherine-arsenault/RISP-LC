		
* EQUITY ANALYSES
	cd "/Users/catherine.arsenault/Dropbox/BMGF RISP Project/Quant analysis/Equity"
	
* DRC 2017-18
	u "$user/Data for analysis/DRC_2017_18_MICS.dta", clear 
	
	* BY WEALTH
	putexcel set "DRC.xlsx", sheet("2017-18_wealth") modify
	
	putexcel B1="N" C1="RII" D1="LCL" E1="UCL"
	
		recode windex10 0=.
		replace windex10= windex10u if province==1
		wridit windex10 [aw=weight] , gen(wealth_rank)
		
		levelsof provs, local(prov)
		
		local row = 2
		
		foreach vax in penta3 mcv covbase_comb zdc {
			putexcel A`row'="`vax'"
			local row = `row'+1
				foreach p of local prov {			
						logit `vax' wealth_rank [pw=weight]  if UB2==1 & provs=="`p'", nolog
						
						margins, at(wealth_rank=(0 1)) post
						nlcom (RII: (_b[2._at] / _b[1._at])), post
				
						putexcel A`row'= ("`p'")
						putexcel B`row'=(r(N))
						
						putexcel C`row'=(_b[RII])
						putexcel D`row'= (_b[RII]-invnormal(1-.05/2)*_se[RII])
						putexcel E`row'= (_b[RII]+invnormal(1-.05/2)*_se[RII])
						local row = `row' + 1
				}
		}
			
	* BY EDUC
		putexcel set "DRC.xlsx", sheet("2017-18_educ") modify
		
		putexcel B1="N" C1="RII" D1="LCL" E1="UCL"
		
			recode melevel 9=.
			wridit melevel [aw=weight] , gen(educ_rank)
			
			levelsof provs, local(prov)
			
			local row = 2
			
			foreach vax in penta3 mcv covbase_comb zdc {
				putexcel A`row'="`vax'"
				local row = `row'+1
					foreach p of local prov {			
							logit `vax' educ_rank [pw=weight]  if UB2==1 & provs=="`p'", nolog
							
							margins, at(educ_rank=(0 1)) post
							nlcom (RII: (_b[2._at] / _b[1._at])), post
					
							putexcel A`row'= ("`p'")
							putexcel B`row'=(r(N))
							
							putexcel C`row'=(_b[RII])
							putexcel D`row'= (_b[RII]-invnormal(1-.05/2)*_se[RII])
							putexcel E`row'= (_b[RII]+invnormal(1-.05/2)*_se[RII])
							local row = `row' + 1
					}
			}

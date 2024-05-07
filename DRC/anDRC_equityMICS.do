

* DRC MICS 2017-18 Equity analyses

global user "/Users/catherine.arsenault/Dropbox/BMGF RISP Project/Quant analysis/"
use "$user/Data for analysis/DRC_2017_18_MICS.dta", clear


*-------------------------------------------------------------------------------
* INEQUALITIES AT NATIONAL LEVEL
*-------------------------------------------------------------------------------
* BY WEALTH
*-------------------------------------------------------------------------------
	cd "/Users/catherine.arsenault/Dropbox/BMGF RISP Project/Quant analysis/Equity"
	
	putexcel set "DRC.xlsx", sheet("MICS_wealth") modify
	
	* RII
	putexcel A1="MICS 2017-18" B1="N" C1="RII" D1="LCL" E1="UCL"
	
		recode windex10 0=.
		wridit windex10 [aw=chweight] , gen(wealth_rank)
		
		local row = 2
		
		foreach vax in penta3 opv3 mcv covbase_comb zdc {
			putexcel A`row'="`vax'"		
						logit `vax' wealth_rank [pw=chweight]  if UB2==1 , nolog
						
						margins, at(wealth_rank=(0 1)) post
						nlcom (RII: (_b[2._at] / _b[1._at])), post
						putexcel B`row'=(r(N))
						
						putexcel C`row'=(_b[RII])
						putexcel D`row'= (_b[RII]-invnormal(1-.05/2)*_se[RII])
						putexcel E`row'= (_b[RII]+invnormal(1-.05/2)*_se[RII])
						local row = `row' + 1
		}
		
		* SII
		putexcel G1="SII" H1="LCL" I1="UCL"
		
		local row = 2
		
		foreach vax in penta3 opv3 mcv covbase_comb zdc {
			putexcel F`row'="`vax'"			
						logit `vax' wealth_rank [pw=chweight]  if UB2==1 , nolog
						
						margins, at(wealth_rank=(0 1)) post
						lincom (_b[2._at] - _b[1._at])

						putexcel G`row'=(r(estimate))
						putexcel H`row'= ((r(estimate)) - (r(se)*1.96)) 
						putexcel I`row'= ((r(estimate)) + (r(se)*1.96))
						local row = `row' + 1
		}		
*-------------------------------------------------------------------------------
* NATIONAL LEVEL
*-------------------------------------------------------------------------------
* BY EDUCATION
*-------------------------------------------------------------------------------
	
	putexcel set "DRC.xlsx", sheet("MICS_educ") modify
	
	* RII
	putexcel A1="MICS 2017-18" B1="N" C1="RII" D1="LCL" E1="UCL"
	
		recode melevel 9=.
		wridit melevel [aw=chweight] , gen(educ_rank)
		
		local row = 2
		
		foreach vax in penta3 opv3 mcv covbase_comb zdc {
			putexcel A`row'="`vax'"		
						logit `vax' educ_rank [pw=chweight]  if UB2==1 , nolog
						
						margins, at(educ_rank=(0 1)) post
						nlcom (RII: (_b[2._at] / _b[1._at])), post
						putexcel B`row'=(r(N))
						
						putexcel C`row'=(_b[RII])
						putexcel D`row'= (_b[RII]-invnormal(1-.05/2)*_se[RII])
						putexcel E`row'= (_b[RII]+invnormal(1-.05/2)*_se[RII])
						local row = `row' + 1
		}
		
		* SII
		putexcel G1="SII" H1="LCL" I1="UCL"
		
		local row = 2
		
		foreach vax in penta3 opv3 mcv covbase_comb zdc {
			putexcel F`row'="`vax'"		
						logit `vax' educ_rank [pw=chweight]  if UB2==1 , nolog
						
						margins, at(educ_rank=(0 1)) post
						lincom (_b[2._at] - _b[1._at])

						putexcel G`row'=(r(estimate))
						putexcel H`row'= ((r(estimate)) - (r(se)*1.96)) 
						putexcel I`row'= ((r(estimate)) + (r(se)*1.96))
						local row = `row' + 1
		}

*-------------------------------------------------------------------------------
* INEQUALITIES BY PROVINCE GROUP
*-------------------------------------------------------------------------------
* BY WEALTH
*-------------------------------------------------------------------------------
* RII
	putexcel set "DRC.xlsx", sheet("MICS_wealth") modify

	putexcel A13="By province group" B13="N" C13="RII" D13="LCL" E13="UCL"
	
		levelsof provs, local(prov)
		
		local row = 14
		
		foreach vax in penta3 opv3 mcv covbase_comb zdc {
			putexcel A`row'="`vax'"
			local row = `row'+1
				foreach p of local prov {			
						logit `vax' wealth_rank [pw=chweight]  if UB2==1 & provs=="`p'", nolog
						
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

* SII
	putexcel set "DRC.xlsx", sheet("MICS_wealth") modify
	
	putexcel  G13="SII" H13="LCL" I13="UCL"
	
		levelsof provs, local(prov)
		
		local row = 14
		
		foreach vax in penta3 opv3 mcv covbase_comb zdc {
			putexcel F`row'="`vax'"
			local row = `row'+1
				foreach p of local prov {			
						logit `vax' wealth_rank [pw=chweight]  if UB2==1 & provs=="`p'", nolog
						
						margins, at(wealth_rank=(0 1)) post
						putexcel F`row'= ("`p'")
						lincom (_b[2._at] - _b[1._at])

						putexcel G`row'=(r(estimate))
						putexcel H`row'= ((r(estimate)) - (r(se)*1.96)) 
						putexcel I`row'= ((r(estimate)) + (r(se)*1.96))
		
						local row = `row' + 1
				}
		}
*-------------------------------------------------------------------------------
* INEQUALITIES BY PROVINCE GROUP
*-------------------------------------------------------------------------------
* BY EDUCATION
*-------------------------------------------------------------------------------
* RII
	putexcel set "DRC.xlsx", sheet("MICS_educ") modify

	putexcel A13="By province group" B13="N" C13="RII" D13="LCL" E13="UCL"
	
		levelsof provs, local(prov)
		
		local row = 14
		
		foreach vax in penta3 opv3 mcv covbase_comb zdc {
			putexcel A`row'="`vax'"
			local row = `row'+1
				foreach p of local prov {			
						logit `vax' educ_rank [pw=chweight]  if UB2==1 & provs=="`p'", nolog
						
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

* SII
	putexcel set "DRC.xlsx", sheet("MICS_educ") modify

	putexcel  G13="SII" H13="LCL" I13="UCL"
	
		levelsof provs, local(prov)
		
		local row = 14
		
		foreach vax in penta3 opv3 mcv covbase_comb zdc {
			putexcel F`row'="`vax'"
			local row = `row'+1
				foreach p of local prov {			
						logit `vax' educ_rank [pw=chweight]  if UB2==1 & provs=="`p'", nolog
						
						margins, at(educ_rank=(0 1)) post
						putexcel F`row'= ("`p'")
						lincom (_b[2._at] - _b[1._at])

						putexcel G`row'=(r(estimate))
						putexcel H`row'= ((r(estimate)) - (r(se)*1.96)) 
						putexcel I`row'= ((r(estimate)) + (r(se)*1.96))
		
						local row = `row' + 1
				}
		}



		
		




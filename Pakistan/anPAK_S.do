
* RISP LC, Created by C. Arsenault
* PAKISTAN 
* SINDH 2014

global user "/Users/catherine.arsenault/Dropbox/BMGF RISP Project/Quant analysis/"
	
	import spss using "$user/Data for analysis/PK_S_2014_MICS.sav", clear
		egen uniqueid=concat(UF1 UF2 UF4 UF6 UF7 UF8D UF8M UF12H UF12M)
		keep bcg polio3 penta1 penta3 pcv3 mcv1 uniqueid
		save "$user/Data for analysis/PK_S_2014_MICS.dta", replace
	
import spss using "$user/RAW DATA/Pakistan/Pakistan (Sindh) 2014MICS5_Datasets/Pakistan (Sindh)_MICS5_Datasets/Pakistan (Sindh) MICS 2014 SPSS Datasets/ch.sav", clear
		egen uniqueid=concat(UF1 UF2 UF4 UF6 UF7 UF8D UF8M UF12H UF12M)
		merge 1:1 uniqueid using "$user/Data for analysis/PK_S_2014_MICS.dta"
		drop _merge
		
*-------------------------------------------------------------------------------
* Adding missing variables
	decode division, g(divs)
	
	egen covbase_comb=rowtotal(bcg penta3 polio3 mcv1)
	recode covbase_comb 0/3=0 4=1
	
	recode penta1 0=1 1=0, gen(zdc)
	
	tabstat bcg 

*-------------------------------------------------------------------------------
* INEQUALITIES AT NATIONAL LEVEL
*-------------------------------------------------------------------------------
* BY WEALTH
*-------------------------------------------------------------------------------
	cd "/Users/catherine.arsenault/Dropbox/BMGF RISP Project/Quant analysis/Equity"
	putexcel set "PAK_S.xlsx", sheet("2014_wealth") modify
	
	* RII
	putexcel A1="Sindh" B1="N" C1="RII" D1="LCL" E1="UCL"
	
		recode windex5 0=.
		wridit windex5 [aw=chweight] , gen(wealth_rank)
		
		local row = 2
		
		foreach vax in penta3 polio3 mcv1 covbase_comb zdc {
			putexcel A`row'="`vax'"
			local row = `row'+1			
						logit `vax' wealth_rank [pw=chweight]  if AG2==1 , nolog
						
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
		
		foreach vax in penta3 polio3 mcv1 covbase_comb zdc {
			putexcel F`row'="`vax'"
			local row = `row'+1			
						logit `vax' wealth_rank [pw=chweight]  if AG2==1 , nolog
						
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
	cd "/Users/catherine.arsenault/Dropbox/BMGF RISP Project/Quant analysis/Equity"
	
	putexcel set "PAK_S.xlsx", sheet("2014_educ") modify
	
	* RII
	putexcel A1="Sindh" B1="N" C1="RII" D1="LCL" E1="UCL"
	
		recode melevel 9=.
		wridit melevel [aw=chweight] , gen(educ_rank)
		
		local row = 2
		
		foreach vax in penta3 polio3 mcv1 covbase_comb zdc {
			putexcel A`row'="`vax'"
			local row = `row'+1			
						logit `vax' educ_rank [pw=chweight]  if AG2==1 , nolog
						
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
		
		foreach vax in penta3 polio3 mcv1 covbase_comb zdc {
			putexcel F`row'="`vax'"
			local row = `row'+1			
						logit `vax' educ_rank [pw=chweight]  if AG2==1 , nolog
						
						margins, at(educ_rank=(0 1)) post
						lincom (_b[2._at] - _b[1._at])

						putexcel G`row'=(r(estimate))
						putexcel H`row'= ((r(estimate)) - (r(se)*1.96)) 
						putexcel I`row'= ((r(estimate)) + (r(se)*1.96))
						local row = `row' + 1
		}

*-------------------------------------------------------------------------------
* DIVISION LEVEL
*-------------------------------------------------------------------------------
* BY WEALTH
*-------------------------------------------------------------------------------
* RII
	putexcel set "PAK_S.xlsx", sheet("2014_wealth") modify

	putexcel A13="By division" B13="N" C13="RII" D13="LCL" E13="UCL"
	
		levelsof divs, local(div)
		
		local row = 14
		
		foreach vax in penta3 polio3 mcv covbase_comb zdc {
			putexcel A`row'="`vax'"
			local row = `row'+1
				foreach d of local div {			
						logit `vax' wealth_rank [pw=chweight]  if AG2==1 & divs=="`d'", nolog
						
						margins, at(wealth_rank=(0 1)) post
						nlcom (RII: (_b[2._at] / _b[1._at])), post
				
						putexcel A`row'= ("`d'")
						putexcel B`row'=(r(N))
						
						putexcel C`row'=(_b[RII])
						putexcel D`row'= (_b[RII]-invnormal(1-.05/2)*_se[RII])
						putexcel E`row'= (_b[RII]+invnormal(1-.05/2)*_se[RII])
						local row = `row' + 1
				}
		}

* SII
	putexcel set "PAK_S.xlsx", sheet("2014_wealth") modify

	putexcel  G13="SII" H13="LCL" I13="UCL"
	
		levelsof divs, local(div)
		
		local row = 14
		
		foreach vax in penta3 polio3 mcv covbase_comb zdc {
			putexcel F`row'="`vax'"
			local row = `row'+1
				foreach d of local div {			
						logit `vax' wealth_rank [pw=chweight]  if AG2==1 & divs=="`d'", nolog
						
						margins, at(wealth_rank=(0 1)) post
						putexcel F`row'= ("`d'")
						lincom (_b[2._at] - _b[1._at])

						putexcel G`row'=(r(estimate))
						putexcel H`row'= ((r(estimate)) - (r(se)*1.96)) 
						putexcel I`row'= ((r(estimate)) + (r(se)*1.96))
		
						local row = `row' + 1
				}
		}
*-------------------------------------------------------------------------------
* DIVISION LEVEL
*-------------------------------------------------------------------------------
* BY EDUCATION
*-------------------------------------------------------------------------------
* RII
	putexcel set "PAK_S.xlsx", sheet("2014_educ") modify

	putexcel A13="By division" B13="N" C13="RII" D13="LCL" E13="UCL"
	
		levelsof divs, local(div)
		
		local row = 14
		
		foreach vax in penta3 polio3 mcv covbase_comb zdc {
			putexcel A`row'="`vax'"
			local row = `row'+1
				foreach d of local div {			
						logit `vax' educ_rank [pw=chweight]  if AG2==1 & divs=="`d'", nolog
						
						margins, at(educ_rank=(0 1)) post
						nlcom (RII: (_b[2._at] / _b[1._at])), post
				
						putexcel A`row'= ("`d'")
						putexcel B`row'=(r(N))
						
						putexcel C`row'=(_b[RII])
						putexcel D`row'= (_b[RII]-invnormal(1-.05/2)*_se[RII])
						putexcel E`row'= (_b[RII]+invnormal(1-.05/2)*_se[RII])
						local row = `row' + 1
				}
		}

* SII
	putexcel set "PAK_S.xlsx", sheet("2014_educ") modify

	putexcel  G13="SII" H13="LCL" I13="UCL"
	
		levelsof divs, local(div)
		
		local row = 14
		
		foreach vax in penta3 polio3 mcv covbase_comb zdc {
			putexcel F`row'="`vax'"
			local row = `row'+1
				foreach d of local div {			
						logit `vax' educ_rank [pw=chweight]  if AG2==1 & divs=="`d'", nolog
						
						margins, at(educ_rank=(0 1)) post
						putexcel F`row'= ("`d'")
						lincom (_b[2._at] - _b[1._at])

						putexcel G`row'=(r(estimate))
						putexcel H`row'= ((r(estimate)) - (r(se)*1.96)) 
						putexcel I`row'= ((r(estimate)) + (r(se)*1.96))
		
						local row = `row' + 1
				}
		}









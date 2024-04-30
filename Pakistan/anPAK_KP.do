* RISP LC, Created by C. Arsenault
* PAKISTAN 
* Khyber Pakhtunkhwa MICS 2019


global user "/Users/catherine.arsenault/Dropbox/BMGF RISP Project/Quant analysis"
	
	import spss using "$user/Data for analysis/PK_KP_2019_MICS.sav", clear
		egen uniqueid=concat(UF1 UF2 UF3 UF4 UF5 UF7D UF7M UF8H UF8M)
		keep uniqueid card-mcv2_sampled
		save "$user/Data for analysis/PK_KP_2019_MICS.dta", replace
	
import spss using "$user/RAW DATA/Pakistan/Pakistan Khyber Pakhtunkhwa 2019 MICS6 Datasets/Pakistan Khyber Pakhtunkhwa MICS6 SPSS Datasets/ch.sav", clear
		egen uniqueid=concat(UF1 UF2 UF3 UF4 UF5 UF7D UF7M UF8H UF8M)
		merge 1:1 uniqueid using "$user/Data for analysis/PK_KP_2019_MICS.dta"
		drop _merge

*-------------------------------------------------------------------------------
* Adding missing variables
* Divisions
	decode division, g(divs)
* Polio full (IPV + polio3 )
		egen polio_full=rowtotal(ipv polio3)
		recode polio_ful 1=0 2=1
*Fully vaccinated (basic)	
		egen covbase_comb=rowtotal(bcg penta3 polio3 mcv1)
		recode covbase_comb 0/3=0 4=1
* ZDC
		recode penta1 0=1 1=0, g(zdc)
		
tabstat bcg polio0 polio1 polio3 penta1 penta3 pcv1 pcv3 ipv polio_full mcv1 ///
		covbase_comb zdc if UB2==1 [aw=chweigh], stat(mean) col(stat)
		
tabstat bcg polio0 polio1 polio3 penta1 penta3 pcv1 pcv3 ipv polio_full mcv1 ///
		covbase_comb zdc if UB2==1 [aw=chweigh], by(division) stat(mean) 

tabstat bcg polio0 polio1 polio3 penta1 penta3 pcv1 pcv3 ipv polio_full mcv1 ///
		covbase_comb zdc if UB2==1 [aw=chweigh], by(HH6) stat(mean) 
		
tabstat bcg polio0 polio1 polio3 penta1 penta3 pcv1 pcv3 ipv polio_full mcv1 ///
		covbase_comb zdc if UB2==1 [aw=chweigh], by(HL4) stat(mean) 
*-------------------------------------------------------------------------------
* INEQUALITIES AT NATIONAL LEVEL
*-------------------------------------------------------------------------------
* BY WEALTH
*-------------------------------------------------------------------------------
	cd "/Users/catherine.arsenault/Dropbox/BMGF RISP Project/Quant analysis/Equity"
	
	putexcel set "PAK_KP.xlsx", sheet("2019_wealth") modify
	
	* RII
	putexcel A1="Khyber Pakhtunkhwa" B1="N" C1="RII" D1="LCL" E1="UCL"
	
		recode windex10 0=.
		wridit windex10 [aw=chweight] , gen(wealth_rank)
		
		local row = 2
		
		foreach vax in penta3 polio3 mcv1 covbase_comb zdc {
			putexcel A`row'="`vax'"
			local row = `row'+1			
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
		
		foreach vax in penta3 polio3 mcv1 covbase_comb zdc {
			putexcel F`row'="`vax'"
			local row = `row'+1			
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
	
	putexcel set "PAK_KP.xlsx", sheet("2019_educ") modify
	
	* RII
	putexcel A1="Balochistan" B1="N" C1="RII" D1="LCL" E1="UCL"
	
		recode melevel 9=.
		wridit melevel [aw=chweight] , gen(educ_rank)
		
		local row = 2
		
		foreach vax in penta3 polio3 mcv1 covbase_comb zdc {
			putexcel A`row'="`vax'"
			local row = `row'+1			
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
		
		foreach vax in penta3 polio3 mcv1 covbase_comb zdc {
			putexcel F`row'="`vax'"
			local row = `row'+1			
						logit `vax' educ_rank [pw=chweight]  if UB2==1 , nolog
						
						margins, at(educ_rank=(0 1)) post
						lincom (_b[2._at] - _b[1._at])

						putexcel G`row'=(r(estimate))
						putexcel H`row'= ((r(estimate)) - (r(se)*1.96)) 
						putexcel I`row'= ((r(estimate)) + (r(se)*1.96))
						local row = `row' + 1
		}

*-------------------------------------------------------------------------------
* INEQUALITIES BY DIVISION 
*-------------------------------------------------------------------------------
* BY WEALTH
*-------------------------------------------------------------------------------
* RII
	putexcel set "PAK_KP.xlsx", sheet("2019_wealth") modify

	putexcel A13="By division" B13="N" C13="RII" D13="LCL" E13="UCL"
	
		levelsof divs, local(div)
		
		local row = 14
		
		foreach vax in penta3 polio3 mcv1 covbase_comb zdc {
			putexcel A`row'="`vax'"
			local row = `row'+1
				foreach d of local div {			
						logit `vax' wealth_rank [pw=chweight]  if UB2==1 & divs=="`d'", nolog
						
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
	putexcel set "PAK_KP.xlsx", sheet("2019_wealth") modify
	
	putexcel  G13="SII" H13="LCL" I13="UCL"
	
		levelsof divs, local(div)
		
		local row = 14
		
		foreach vax in penta3 polio3 mcv1 covbase_comb zdc {
			putexcel F`row'="`vax'"
			local row = `row'+1
				foreach d of local div {			
						logit `vax' wealth_rank [pw=chweight]  if UB2==1 & divs=="`d'", nolog
						
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
* INEQUALITIES BY DIVISION 
*-------------------------------------------------------------------------------
* BY EDUCATION
*-------------------------------------------------------------------------------
* RII
	putexcel set "PAK_KP.xlsx", sheet("2019_educ") modify

	putexcel A13="By division" B13="N" C13="RII" D13="LCL" E13="UCL"
	
		levelsof divs, local(div)
		
		local row = 14
		
		foreach vax in penta3 polio3 mcv1 covbase_comb zdc {
			putexcel A`row'="`vax'"
			local row = `row'+1
				foreach d of local div {			
						logit `vax' educ_rank [pw=chweight]  if UB2==1 & divs=="`d'", nolog
						
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
	putexcel set "PAK_KP.xlsx", sheet("2019_educ") modify

	putexcel  G13="SII" H13="LCL" I13="UCL"
	
		levelsof divs, local(div)
		
		local row = 14
		
		foreach vax in penta3 polio3 mcv1 covbase_comb zdc {
			putexcel F`row'="`vax'"
			local row = `row'+1
				foreach d of local div {			
						logit `vax' educ_rank [pw=chweight]  if UB2==1 & divs=="`d'", nolog
						
						margins, at(educ_rank=(0 1)) post
						putexcel F`row'= ("`d'")
						lincom (_b[2._at] - _b[1._at])

						putexcel G`row'=(r(estimate))
						putexcel H`row'= ((r(estimate)) - (r(se)*1.96)) 
						putexcel I`row'= ((r(estimate)) + (r(se)*1.96))
		
						local row = `row' + 1
				}
		}



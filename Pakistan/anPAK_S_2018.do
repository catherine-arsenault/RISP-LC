* RISP LC, Created by C. Arsenault
* PAKISTAN 
* Sindh MICS 2018

global user "/Users/catherine.arsenault/Dropbox/BMGF RISP Project/Quant analysis"
	
	import spss using "$user/Data for analysis/PK_S_2018-19_MICS.sav", clear
		egen uniqueid=concat(UF1 UF2 UF3 UF4 UF5 UF7D UF7M UF8H UF8M)
		keep uniqueid card-ipv_sampled
		save "$user/Data for analysis/PK_S_2018_MICS.dta", replace
	
	import spss using "$user/RAW DATA/Pakistan/Pakistan Sindh 2018-19 MICS6 Datasets/Pakistan Sindh MICS6 SPSS Datasets/ch.sav", clear
		egen uniqueid=concat(UF1 UF2 UF3 UF4 UF5 UF7D UF7M UF8H UF8M)
		merge 1:1 uniqueid using "$user/Data for analysis/PK_S_2018_MICS.dta"
		drop _merge
*-------------------------------------------------------------------------------

*-------------------------------------------------------------------------------
* Adding missing variables
gen province="Sindh 2018-19"
drop ipv*
		recode IM6ID 1/66=1 97/99=0, g(ipvday)
		recode IM6IM 1/66=1 97/99=0, g(ipvmonth)
		recode IM6IY 2015/6666=1 9998/9999=0, g(ipvyr)
		
		egen ipv_card = rowmax(ipvday ipvmonth ipvyr) 
		replace ipv_card=0 if card==0
		* By recall 
		recode IM19 2=0 8/9=0, g(ipv_recall)
		replace ipv_recall = 0 if recall==0
		
		egen ipv=rowmax(ipv_card ipv_recall) 		
* Divisions
	decode division, g(divs)
* Polio full (IPV + polio3 )
		egen polio_full=rowtotal(ipv polio3)
		recode polio_full 1=0 2=1
*Fully vaccinated (basic)	
		egen covbase_comb=rowtotal(bcg penta3 polio3 mcv1)
		recode covbase_comb 0/3=0 4=1
* ZDC
		recode penta1 0=1 1=0, g(zdc)
		
tabstat bcg polio0 polio1 polio3 penta1 penta3 pcv1 pcv3 ipv polio_full mcv1 ///
		covbase_comb zdc if CAGE>=12 & CAGE<=23 [aw=chweigh], stat(mean) col(stat)
		
tabstat bcg polio0 polio1 polio3 penta1 penta3 pcv1 pcv3 ipv polio_full mcv1 ///
		covbase_comb zdc if CAGE>=12 & CAGE<=23 [aw=chweigh], by(division) stat(mean) 

tabstat bcg polio0 polio1 polio3 penta1 penta3 pcv1 pcv3 ipv polio_full mcv1 ///
		covbase_comb zdc if CAGE>=12 & CAGE<=23 [aw=chweigh], by(HH6) stat(mean) col(stat)
		
tabstat bcg polio0 polio1 polio3 penta1 penta3 pcv1 pcv3 ipv polio_full mcv1 ///
		covbase_comb zdc if CAGE>=12 & CAGE<=23 [aw=chweigh], by(HL4) stat(mean) 
		
preserve 
	collapse (mean) bcg polio0 polio1 polio3 penta1 penta3 pcv1 pcv3 ipv polio_full ///
		mcv1 covbase_comb zdc (first) province if UB2==1 [aw=chweigh]
	export excel using "$user/Results/pakistan", sheet("pak_s_2018_overall", modify) firstrow(var) 
restore
preserve 
	collapse (mean) bcg polio0 polio1 polio3 penta1 penta3 pcv1 pcv3 ipv polio_full ///
	mcv1 covbase_comb zdc (first) province if UB2==1 [aw=chweigh], by(division)
	export excel using "$user/Results/pakistan", sheet("pak_s_2018_div", modify) firstrow(var) 
restore
*-------------------------------------------------------------------------------
* INEQUALITIES AT PROVINCIAL LEVEL
*-------------------------------------------------------------------------------
* BY WEALTH
*-------------------------------------------------------------------------------
	cd "/Users/catherine.arsenault/Dropbox/BMGF RISP Project/Quant analysis/Equity"
	
	putexcel set "PAK_S.xlsx", sheet("2018_wealth") modify
	
	* RII
	putexcel A1="Sindh" B1="N" C1="RII" D1="LCL" E1="UCL"
	
		recode windex10 0=.
		wridit windex10 [aw=chweight] , gen(wealth_rank)
		
		local row = 2
		
		foreach vax in penta3 polio3 mcv1 covbase_comb zdc {
			putexcel A`row'="`vax'"
			local row = `row'+1			
						logit `vax' wealth_rank [pw=chweight]  if CAGE>=12 & CAGE<=23 , nolog
						
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
						logit `vax' wealth_rank [pw=chweight]  if CAGE>=12 & CAGE<=23 , nolog
						
						margins, at(wealth_rank=(0 1)) post
						lincom (_b[2._at] - _b[1._at])

						putexcel G`row'=(r(estimate))
						putexcel H`row'= ((r(estimate)) - (r(se)*1.96)) 
						putexcel I`row'= ((r(estimate)) + (r(se)*1.96))
						local row = `row' + 1
		}		
*-------------------------------------------------------------------------------
* PROVINCIAL LEVEL
*-------------------------------------------------------------------------------
* BY EDUCATION
*-------------------------------------------------------------------------------
	
	putexcel set "PAK_S.xlsx", sheet("2018_educ") modify
	
	* RII
	putexcel A1="Sindh" B1="N" C1="RII" D1="LCL" E1="UCL"
	
		recode melevel 9=.
		wridit melevel [aw=chweight] , gen(educ_rank)
		
		local row = 2
		
		foreach vax in penta3 polio3 mcv1 covbase_comb zdc {
			putexcel A`row'="`vax'"
			local row = `row'+1			
						logit `vax' educ_rank [pw=chweight]  if CAGE>=12 & CAGE<=23 , nolog
						
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
						logit `vax' educ_rank [pw=chweight]  if CAGE>=12 & CAGE<=23 , nolog
						
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
	putexcel set "PAK_S.xlsx", sheet("2018_wealth") modify

	putexcel A13="By division" B13="N" C13="RII" D13="LCL" E13="UCL"
	
		levelsof divs, local(div)
		
		local row = 14
		
		foreach vax in penta3 polio3 mcv1 covbase_comb zdc {
			putexcel A`row'="`vax'"
			local row = `row'+1
				foreach d of local div {			
						logit `vax' wealth_rank [pw=chweight]  if CAGE>=12 & CAGE<=23 & divs=="`d'", nolog
						
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
	putexcel set "PAK_S.xlsx", sheet("2018_wealth") modify
	
	putexcel  G13="SII" H13="LCL" I13="UCL"
	
		levelsof divs, local(div)
		
		local row = 14
		
		foreach vax in penta3 polio3 mcv1 covbase_comb zdc {
			putexcel F`row'="`vax'"
			local row = `row'+1
				foreach d of local div {			
						logit `vax' wealth_rank [pw=chweight]  if CAGE>=12 & CAGE<=23 & divs=="`d'", nolog
						
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
	putexcel set "PAK_S.xlsx", sheet("2018_educ") modify

	putexcel A13="By division" B13="N" C13="RII" D13="LCL" E13="UCL"
	
		levelsof divs, local(div)
		
		local row = 14
		
		foreach vax in penta3 polio3 mcv1 covbase_comb zdc {
			putexcel A`row'="`vax'"
			local row = `row'+1
				foreach d of local div {			
						logit `vax' educ_rank [pw=chweight]  if CAGE>=12 & CAGE<=23 & divs=="`d'", nolog
						
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
	putexcel set "PAK_S.xlsx", sheet("2018_educ") modify

	putexcel  G13="SII" H13="LCL" I13="UCL"
	
		levelsof divs, local(div)
		
		local row = 14
		
		foreach vax in penta3 polio3 mcv1 covbase_comb zdc {
			putexcel F`row'="`vax'"
			local row = `row'+1
				foreach d of local div {			
						logit `vax' educ_rank [pw=chweight]  if CAGE>=12 & CAGE<=23 & divs=="`d'", nolog
						
						margins, at(educ_rank=(0 1)) post
						putexcel F`row'= ("`d'")
						lincom (_b[2._at] - _b[1._at])

						putexcel G`row'=(r(estimate))
						putexcel H`row'= ((r(estimate)) - (r(se)*1.96)) 
						putexcel I`row'= ((r(estimate)) + (r(se)*1.96))
		
						local row = `row' + 1
				}
		}



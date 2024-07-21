*cd "/Users/eliselankiewicz/Dropbox/Elise DRC analyses/Preliminary analyses/R Code/cleaned_data"
cd "C:\Users\elisel\Dropbox\Elise DRC analyses\Preliminary analyses\R Code\cleaned_data"

*no urban/rural indicator included in ECV2020
*dropping BCG because the unvaccinated is so small I'm running into issues with perfection prediction

*** 2021

import delimited "wealthECV21.csv", clear

		putexcel set "urb.xlsx", sheet(urb21_nat) modify
		
replace urb = 0 if urb == 2
*urban = 1 , rural = 0

** NATIONAL

* Risk Difference
	putexcel A1="National" B1="n" C1="rd" D1="lcl" E1="ucl" F1 = "se" G1 = "year"
			
		local row = 2
		
		foreach vax in penta3combinew polyo3combinew varcombinew couvebasecomb dose0penta {
			putexcel A`row'="`vax'"		
						logit `vax' urb [pw=weight] if age==1 , nolog
						
						margins, at(urb =(0 1)) post
						nlcom (RD: (_b[2._at] - _b[1._at])), post
						putexcel B`row'=(r(N))
						
						putexcel C`row'=(_b[RD])
						putexcel D`row'= (_b[RD]-invnormal(1-.05/2)*_se[RD])
						putexcel E`row'= (_b[RD]+invnormal(1-.05/2)*_se[RD])
						putexcel F`row' = (_se[RD])
						putexcel G`row' = "2021"
						local row = `row' + 1
		}
		
** Provincial

keep if mashako != "Other" 
*Note - dropping 'Other' provinces because some have so few urban children urb is a perfect predictor of vaccination. doesn't look like its a problem for any of the mashako provinces.
		
* Risk Difference
	putexcel set "urb.xlsx", sheet("urb21prov") modify

	putexcel A1="province" B1 = "vax" C1="n" D1="rd" E1="lci" F1="uci" G1="se" H1 = "year"
	
		levelsof prov, local(prov)
		
		
		local row = 1
		
		foreach vax in penta3combinew polyo3combinew varcombinew couvebasecomb dose0penta {
				local row = `row'+1
				foreach p of local prov {			
						logit `vax' urb [pw=weight]  if prov== "`p'" & age==1, nolog
						
						margins, at(urb=(0 1)) post
						nlcom (RD: (_b[2._at] - _b[1._at])), post
				
        putexcel A`row' = "`p'"
		putexcel B`row' = "`vax'"
		putexcel C`row'=(r(N))
        putexcel D`row' = (_b[RD])
        putexcel E`row' = (_b[RD]-invnormal(1-.05/2)*_se[RD])
        putexcel F`row' = (_b[RD]+invnormal(1-.05/2)*_se[RD])
        putexcel G`row' = (_se[RD])
		putexcel H`row' = "2021"
        local row = `row' + 1
				}
		}		
		
*** 2022

import delimited "wealthECV22.csv", clear

* checking out some issues with perfect prediction

bysort prov: tabulate penta3combinew urb if age == 1

replace urb = 0 if urb == 2
*urban = 1 , rural = 0

		putexcel set "urb.xlsx", sheet(urb22_nat) modify
		
** NATIONAL

* Risk Difference
	putexcel A1="National" B1="n" C1="rd" D1="lcl" E1="ucl" F1 = "se" G1 = "year"
			
		local row = 2
		
		foreach vax in penta3combinew polyo3combinew varcombinew couvebasecomb dose0penta {
			putexcel A`row'="`vax'"		
						logit `vax' urb [pw=weight] if age==1 , nolog
						
						margins, at(urb =(0 1)) post
						nlcom (RD: (_b[2._at] - _b[1._at])), post
						putexcel B`row'=(r(N))
						
						putexcel C`row'=(_b[RD])
						putexcel D`row'= (_b[RD]-invnormal(1-.05/2)*_se[RD])
						putexcel E`row'= (_b[RD]+invnormal(1-.05/2)*_se[RD])
						putexcel F`row' = (_se[RD])
						putexcel G`row' = "2022"
						local row = `row' + 1
		}
		
** Provincial

*Note - dropping 'Other' provinces because some have so few urban children urb is a perfect predictor of vaccination. doesn't look like its a problem for any of the mashako provinces. 
*Have to drop Tshuapa too - tiny urban sample

keep if mashako != "Other" & prov != "Tshuapa"
		
* Risk Difference
	putexcel set "urb.xlsx", sheet("urb22prov") modify

	putexcel A1="province" B1 = "vax" C1="n" D1="rd" E1="lci" F1="uci" G1="se" H1 = "year"
	
		levelsof prov, local(prov)
		
		local row = 1
		
		foreach vax in penta3combinew polyo3combinew varcombinew couvebasecomb dose0penta {
				local row = `row'+1
				foreach p of local prov {			
						logit `vax' urb [pw=weight]  if prov== "`p'" & age==1, nolog
						
						margins, at(urb=(0 1)) post
						nlcom (RD: (_b[2._at] - _b[1._at])), post
				
        putexcel A`row' = "`p'"
		putexcel B`row' = "`vax'"
		putexcel C`row'=(r(N))
        putexcel D`row' = (_b[RD])
        putexcel E`row' = (_b[RD]-invnormal(1-.05/2)*_se[RD])
        putexcel F`row' = (_b[RD]+invnormal(1-.05/2)*_se[RD])
        putexcel G`row' = (_se[RD])
		putexcel H`row' = "2022"
        local row = `row' + 1
				}
		}				
		
*** 2023

import delimited "wealthECV23.csv", clear

replace urb = 0 if urb == 2
*urban = 1 , rural = 0
		putexcel set "urb.xlsx", sheet(urb23_nat) modify
			
** NATIONAL

* Risk Difference
	putexcel A1="National" B1="n" C1="rd" D1="lcl" E1="ucl" F1 = "se" G1 = "year"
			
		local row = 2
		
		foreach vax in penta3combinew polyo3combinew varcombinew couvebasecomb dose0penta {
			putexcel A`row'="`vax'"		
						logit `vax' urb [pw=weight] if age==1 , nolog
						
						margins, at(urb =(0 1)) post
						nlcom (RD: (_b[2._at] - _b[1._at])), post
						putexcel B`row'=(r(N))
						
						putexcel C`row'=(_b[RD])
						putexcel D`row'= (_b[RD]-invnormal(1-.05/2)*_se[RD])
						putexcel E`row'= (_b[RD]+invnormal(1-.05/2)*_se[RD])
						putexcel F`row' = (_se[RD])
						putexcel G`row' = "2023"
						local row = `row' + 1
		}
		
** Provincial

keep if mashako != "Other" 

*Note - dropping 'Other' provinces because some have so few urban children urb is a perfect predictor of vaccination. doesn't look like its a problem for any of the mashako provinces. 
		
* Risk Difference
	putexcel set "urb.xlsx", sheet("urb23prov") modify

	putexcel A1="province" B1 = "vax" C1="n" D1="rd" E1="lci" F1="uci" G1="se" H1 = "year"
	
		levelsof prov, local(prov)
		
		
		local row = 1
		
		foreach vax in penta3combinew polyo3combinew varcombinew couvebasecomb dose0penta {
				local row = `row'+1
				foreach p of local prov {			
						logit `vax' urb [pw=weight]  if prov== "`p'" & age==1, nolog
						
						margins, at(urb=(0 1)) post
						nlcom (RD: (_b[2._at] - _b[1._at])), post
				
        putexcel A`row' = "`p'"
		putexcel B`row' = "`vax'"
		putexcel C`row'=(r(N))
        putexcel D`row' = (_b[RD])
        putexcel E`row' = (_b[RD]-invnormal(1-.05/2)*_se[RD])
        putexcel F`row' = (_b[RD]+invnormal(1-.05/2)*_se[RD])
        putexcel G`row' = (_se[RD])
		putexcel H`row' = "2023"
        local row = `row' + 1
				}
		}				
				

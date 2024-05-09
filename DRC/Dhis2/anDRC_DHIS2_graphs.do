
u 	 "$user/RAW DATA/DRC/DHIS2/DHIS2_2019-2023_long.dta", clear

			collapse (sum) penta3 , by (province rmonth)

	*preserve 
	
	keep if province==10
			qui reg penta3 rmonth if rmonth<37   // linear prediction baseline
			predict linear_penta3
			
			collapse penta3 linear_penta3 , by(rmonth)

			twoway (scatter penta3 rmonth, msize(vsmall)  sort) ///
			(line linear_penta3 rmonth, lpattern(dash) lcolor(green)) ///
			(lfit penta3 rmonth if rmonth<37, lcolor(green)) ///
			(lfit penta3 rmonth if rmonth>=37 & rmonth<=60 , lcolor(blue)) , ///
			ylabel(, labsize(small)) xline(36, lpattern(dash) lcolor(black)) ///
			xline(36, lpattern(dash) lcolor(black)) ///
			xtitle("", size(small)) legend(off) ///
			graphregion(color(white)) title("Penta 3 (2019-2023)", size(msmall) color(black))  ///
			xlabel(1(1)60) xlabel(,  labsize(tiny)) ylabel(0(5000)20000, labsize(small))
			
	
	
	keep if province==24
			qui reg penta3 rmonth if rmonth<16   // linear prediction baseline
			predict linear_penta3
			
			collapse penta3 linear_penta3 , by(rmonth)

			twoway (scatter penta3 rmonth, msize(vsmall)  sort) ///
			(line linear_penta3 rmonth, lpattern(dash) lcolor(green)) ///
			(lfit penta3 rmonth if rmonth<16, lcolor(green)) ///
			(lfit penta3 rmonth if rmonth>=16 & rmonth<=36, lcolor(red)) /// 
			(lfit penta3 rmonth if rmonth>=37 & rmonth<=60 , lcolor(blue)) , ///
			ylabel(, labsize(small)) xline(15, lpattern(dash) lcolor(black)) ///
			xline(36, lpattern(dash) lcolor(black)) ///
			xtitle("", size(small)) legend(off) ///
			graphregion(color(white)) title("Penta 3 (2019-2023)", size(msmall) color(black))  ///
			xlabel(1(1)60) xlabel(,  labsize(tiny)) ylabel(0(5000)20000, labsize(small))

keep if province==10
			qui reg penta3 rmonth if rmonth<16   // linear prediction baseline
			predict linear_penta3
			
			collapse penta3 linear_penta3 , by(rmonth)

			twoway (scatter penta3 rmonth, msize(vsmall)  sort) ///
			(line linear_penta3 rmonth, lpattern(dash) lcolor(green)) ///
			(lfit penta3 rmonth if rmonth<16, lcolor(green)) ///
			(lfit penta3 rmonth if rmonth>=16 & rmonth<=36, lcolor(red)) /// 
			(lfit penta3 rmonth if rmonth>=37 & rmonth<=60 , lcolor(blue)) , ///
			ylabel(, labsize(small)) xline(15, lpattern(dash) lcolor(black)) ///
			xline(36, lpattern(dash) lcolor(black)) ///
			xtitle("", size(small)) legend(off) ///
			graphregion(color(white)) title("Penta 3 (2019-2023)", size(msmall) color(black))  ///
			xlabel(1(1)60) xlabel(,  labsize(tiny)) ylabel(0(5000)20000, labsize(small))

			
			graph export "$analysis/Results/Graphs/Fig1/Ethiopia_opd_util.pdf", replace

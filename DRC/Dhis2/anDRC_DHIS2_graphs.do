global user  "/Users/catherine.arsenault/Dropbox/BMGF RISP Project/Quant analysis/"
u 	 "$user/RAW DATA/DRC/DHIS2/DHIS2_2019-2023_long.dta", clear

			collapse (sum) penta3 mmr fullvax ipv1 rota3 pcv3 opv3  yf , by (province rmonth)
*-------------------------------------------------------------------------------	
	* Haut Lomami 
*-------------------------------------------------------------------------------	
* PENTA3
preserve 
		keep if province==4
		collapse (sum) penta3  , by(rmonth)

			twoway (scatter penta3 rmonth, msize(vsmall)  sort), ///
			ylabel(, labsize(small))  ytitle("Number of children vaccinated", size(vsmall)) ///
			xtitle("January 2019 to December 2023, vertical lines are years", size(vsmall)) legend(off) ///
			xline(12, lpattern(dot) lcolor(grey)) xline(24, lpattern(dot) lcolor(grey)) ///
			xline(36, lpattern(dot) lcolor(grey))  xline(48, lpattern(dot) lcolor(grey)) ///
			graphregion(color(white)) title("Monthly Penta3 vaccinations: Haut-Lomami Province", ///
			size(small) color(black))  xlabel(1(1)60) xlabel(,  labsize(tiny)) ylabel(0(5000)20000, labsize(small))

			graph export "$user/Results/DRC/DHIS2 Graphs/penta3_HL.pdf", replace
restore

* MMR 
preserve 
		keep if province==4
		collapse (sum) mmr , by(rmonth)

			twoway (scatter mmr rmonth, msize(vsmall)  sort), ///
			ylabel(, labsize(small))  ytitle("Number of children vaccinated", size(vsmall)) ///
			xtitle("January 2019 to December 2023, vertical lines are years", size(vsmall)) legend(off) ///
			xline(12, lpattern(dot) lcolor(grey)) xline(24, lpattern(dot) lcolor(grey)) ///
			xline(36, lpattern(dot) lcolor(grey))  xline(48, lpattern(dot) lcolor(grey)) ///
			graphregion(color(white)) title("Monthly Measles vaccinations: Haut-Lomami Province", ///
			size(small) color(black))  xlabel(1(1)60) xlabel(,  labsize(tiny)) ylabel(0(5000)20000, labsize(small))

			graph export "$user/Results/DRC/DHIS2 Graphs/mmr_HL.pdf", replace
restore	

* IPV 
preserve 
		keep if province==4
		collapse (sum) ipv1 , by(rmonth)

			twoway (scatter ipv rmonth, msize(vsmall)  sort), ///
			ylabel(, labsize(small))  ytitle("Number of children vaccinated", size(vsmall)) ///
			xtitle("January 2019 to December 2023, vertical lines are years", size(vsmall)) legend(off) ///
			xline(12, lpattern(dot) lcolor(grey)) xline(24, lpattern(dot) lcolor(grey)) ///
			xline(36, lpattern(dot) lcolor(grey))  xline(48, lpattern(dot) lcolor(grey)) ///
			graphregion(color(white)) title("Monthly IPV vaccinations: Haut-Lomami Province", ///
			size(small) color(black))  xlabel(1(1)60) xlabel(,  labsize(tiny)) ylabel(0(5000)20000, labsize(small))

			graph export "$user/Results/DRC/DHIS2 Graphs/ipv1_HL.pdf", replace
restore	

* IPV 
preserve 
		keep if province==4
		collapse (sum) pcv3 , by(rmonth)

			twoway (scatter pcv3 rmonth, msize(vsmall)  sort), ///
			ylabel(, labsize(small))  ytitle("Number of children vaccinated", size(vsmall)) ///
			xtitle("January 2019 to December 2023, vertical lines are years", size(vsmall)) legend(off) ///
			xline(12, lpattern(dot) lcolor(grey)) xline(24, lpattern(dot) lcolor(grey)) ///
			xline(36, lpattern(dot) lcolor(grey))  xline(48, lpattern(dot) lcolor(grey)) ///
			graphregion(color(white)) title("Monthly PCV3 vaccinations: Haut-Lomami Province", ///
			size(small) color(black))  xlabel(1(1)60) xlabel(,  labsize(tiny)) ylabel(0(5000)20000, labsize(small))

			graph export "$user/Results/DRC/DHIS2 Graphs/pcv3_HL.pdf", replace
restore	

*-------------------------------------------------------------------------------	
	* Tanganyika
*-------------------------------------------------------------------------------	
* PENTA3
preserve 
		keep if province==24
		collapse (sum) penta3  , by(rmonth)

			twoway (scatter penta3 rmonth, msize(vsmall) mcolor(green) sort), ///
			ylabel(, labsize(small))  ytitle("Number of children vaccinated", size(vsmall)) ///
			xtitle("January 2019 to December 2023, vertical lines are years", size(vsmall)) legend(off) ///
			xline(12, lpattern(dot) lcolor(grey)) xline(24, lpattern(dot) lcolor(grey)) ///
			xline(36, lpattern(dot) lcolor(grey))  xline(48, lpattern(dot) lcolor(grey)) ///
			graphregion(color(white)) title("Monthly Penta3 vaccinations: Tanganyika Province", ///
			size(small) color(black))  xlabel(1(1)60) xlabel(,  labsize(tiny)) ylabel(0(5000)20000, labsize(small))

			graph export "$user/Results/DRC/DHIS2 Graphs/penta3_TG.pdf", replace
restore

* MMR 
preserve 
		keep if province==24
		collapse (sum) mmr , by(rmonth)

			twoway (scatter mmr rmonth, msize(vsmall) mcolor(green) sort), ///
			ylabel(, labsize(small))  ytitle("Number of children vaccinated", size(vsmall)) ///
			xtitle("January 2019 to December 2023, vertical lines are years", size(vsmall)) legend(off) ///
			xline(12, lpattern(dot) lcolor(grey)) xline(24, lpattern(dot) lcolor(grey)) ///
			xline(36, lpattern(dot) lcolor(grey))  xline(48, lpattern(dot) lcolor(grey)) ///
			graphregion(color(white)) title("Monthly Measles vaccinations: Tanganyika Province", ///
			size(small) color(black))  xlabel(1(1)60) xlabel(,  labsize(tiny)) ylabel(0(5000)20000, labsize(small))

			graph export "$user/Results/DRC/DHIS2 Graphs/mmr_TG.pdf", replace
restore

*-------------------------------------------------------------------------------	
	* Lualaba
*-------------------------------------------------------------------------------	
* PENTA3
preserve 
		keep if province==14
		collapse (sum) penta3  , by(rmonth)

			twoway (scatter penta3 rmonth, msize(vsmall) mcolor(purple) sort), ///
			ylabel(, labsize(small))  ytitle("Number of children vaccinated", size(vsmall)) ///
			xtitle("January 2019 to December 2023, vertical lines are years", size(vsmall)) legend(off) ///
			xline(12, lpattern(dot) lcolor(grey)) xline(24, lpattern(dot) lcolor(grey)) ///
			xline(36, lpattern(dot) lcolor(grey))  xline(48, lpattern(dot) lcolor(grey)) ///
			graphregion(color(white)) title("Monthly Penta3 vaccinations: Lualaba Province", ///
			size(small) color(black))  xlabel(1(1)60) xlabel(,  labsize(tiny)) ylabel(0(5000)20000, labsize(small))

			graph export "$user/Results/DRC/DHIS2 Graphs/penta3_LU.pdf", replace
restore

* MMR 
preserve 
		keep if province==14
		collapse (sum) mmr , by(rmonth)

			twoway (scatter mmr rmonth, msize(vsmall) mcolor(purple) sort), ///
			ylabel(, labsize(small))  ytitle("Number of children vaccinated", size(vsmall)) ///
			xtitle("January 2019 to December 2023, vertical lines are years", size(vsmall)) legend(off) ///
			xline(12, lpattern(dot) lcolor(grey)) xline(24, lpattern(dot) lcolor(grey)) ///
			xline(36, lpattern(dot) lcolor(grey))  xline(48, lpattern(dot) lcolor(grey)) ///
			graphregion(color(white)) title("Monthly Measles vaccinations: Lualaba Province", ///
			size(small) color(black))  xlabel(1(1)60) xlabel(,  labsize(tiny)) ylabel(0(5000)20000, labsize(small))

			graph export "$user/Results/DRC/DHIS2 Graphs/mmr_LU.pdf", replace
restore
*-------------------------------------------------------------------------------	
	* Kinshasa
*-------------------------------------------------------------------------------	
* PENTA3
preserve 
		keep if province==11
		collapse (sum) penta3  , by(rmonth)

			twoway (scatter penta3 rmonth, msize(vsmall) mcolor(red) sort), ///
			ylabel(, labsize(small))  ytitle("Number of children vaccinated", size(vsmall)) ///
			xtitle("January 2019 to December 2023, vertical lines are years", size(vsmall)) legend(off) ///
			xline(12, lpattern(dot) lcolor(grey)) xline(24, lpattern(dot) lcolor(grey)) ///
			xline(36, lpattern(dot) lcolor(grey))  xline(48, lpattern(dot) lcolor(grey)) ///
			graphregion(color(white)) title("Monthly Penta3 vaccinations: Kinshasa", ///
			size(small) color(black))  xlabel(1(1)60) xlabel(,  labsize(tiny)) ylabel(0(5000)60000, labsize(small))

			graph export "$user/Results/DRC/DHIS2 Graphs/penta3_KI.pdf", replace
restore

* MMR 
preserve 
		keep if province==11
		collapse (sum) mmr , by(rmonth)

			twoway (scatter mmr rmonth, msize(vsmall) mcolor(red) sort), ///
			ylabel(, labsize(small))  ytitle("Number of children vaccinated", size(vsmall)) ///
			xtitle("January 2019 to December 2023, vertical lines are years", size(vsmall)) legend(off) ///
			xline(12, lpattern(dot) lcolor(grey)) xline(24, lpattern(dot) lcolor(grey)) ///
			xline(36, lpattern(dot) lcolor(grey))  xline(48, lpattern(dot) lcolor(grey)) ///
			graphregion(color(white)) title("Monthly Measles vaccinations: Kinshasa", ///
			size(small) color(black))  xlabel(1(1)60) xlabel(,  labsize(tiny)) ylabel(0(5000)60000, labsize(small))

			graph export "$user/Results/DRC/DHIS2 Graphs/mmr_KI.pdf", replace
restore

*-------------------------------------------------------------------------------	
	* Other original six Mashako Plan provinces
	* Mongala, Tshuapa, Haut Katanga, Ituri, Kwilu, Kasaï
*-------------------------------------------------------------------------------	
* PENTA3
preserve 
		keep if province==17 | province==26 | province==3 | province==6 | province==10  | province==13
		collapse (sum) penta3  , by(rmonth)

			twoway (scatter penta3 rmonth, msize(vsmall) mcolor(sand) sort), ///
			ylabel(, labsize(small))  ytitle("Number of children vaccinated", size(vsmall)) ///
			xtitle("January 2019 to December 2023, vertical lines are years", size(vsmall)) legend(off) ///
			xline(12, lpattern(dot) lcolor(grey)) xline(24, lpattern(dot) lcolor(grey)) ///
			xline(36, lpattern(dot) lcolor(grey))  xline(48, lpattern(dot) lcolor(grey)) ///
			graphregion(color(white)) title("Monthly Penta3 vaccinations: Other 6 initial Mashako Provinces", ///
			size(small) color(black))  xlabel(1(1)60) xlabel(,  labsize(tiny)) ylabel(20000(10000)100000, labsize(small))

			graph export "$user/Results/DRC/DHIS2 Graphs/penta3_other6.pdf", replace
restore

* MMR 
preserve 
		keep if province==17 | province==26 | province==3 | province==6 | province==10  | province==13
		collapse (sum) mmr , by(rmonth)

			twoway (scatter mmr rmonth, msize(vsmall) mcolor(sand) sort), ///
			ylabel(, labsize(small))  ytitle("Number of children vaccinated", size(vsmall)) ///
			xtitle("January 2019 to December 2023, vertical lines are years", size(vsmall)) legend(off) ///
			xline(12, lpattern(dot) lcolor(grey)) xline(24, lpattern(dot) lcolor(grey)) ///
			xline(36, lpattern(dot) lcolor(grey))  xline(48, lpattern(dot) lcolor(grey)) ///
			graphregion(color(white)) title("Monthly Measles vaccinations: Other 6 initial Mashako Provinces", ///
			size(small) color(black))  xlabel(1(1)60) xlabel(,  labsize(tiny)) ylabel(20000(10000)100000, labsize(small))

			graph export "$user/Results/DRC/DHIS2 Graphs/mmr_other6.pdf", replace
restore
*-------------------------------------------------------------------------------	


/*-------------------------------------------------------------------------------	
	* Haut Katanga
*-------------------------------------------------------------------------------	
* PENTA3
preserve 
		keep if province==3
		collapse (sum) penta3  , by(rmonth)

			twoway (scatter penta3 rmonth, msize(vsmall) mcolor(sand)  sort), ///
			ylabel(, labsize(small))  ytitle("Number of children vaccinated", size(vsmall)) ///
			xtitle("January 2019 to December 2023, vertical lines are years", size(vsmall)) legend(off) ///
			xline(12, lpattern(dot) lcolor(grey)) xline(24, lpattern(dot) lcolor(grey)) ///
			xline(36, lpattern(dot) lcolor(grey))  xline(48, lpattern(dot) lcolor(grey)) ///
			graphregion(color(white)) title("Monthly Penta3 vaccinations: Haut-Katanga Province", ///
			size(small) color(black))  xlabel(1(1)60) xlabel(,  labsize(tiny)) ylabel(0(5000)25000, labsize(small))

			graph export "$user/Results/DRC/DHIS2 Graphs/penta3_HK.pdf", replace
restore

* MMR 
preserve 
		keep if province==3
		collapse (sum) mmr , by(rmonth)

			twoway (scatter mmr rmonth, msize(vsmall)  mcolor(sand) sort), ///
			ylabel(, labsize(small))  ytitle("Number of children vaccinated", size(vsmall)) ///
			xtitle("January 2019 to December 2023, vertical lines are years", size(vsmall)) legend(off) ///
			xline(12, lpattern(dot) lcolor(grey)) xline(24, lpattern(dot) lcolor(grey)) ///
			xline(36, lpattern(dot) lcolor(grey))  xline(48, lpattern(dot) lcolor(grey)) ///
			graphregion(color(white)) title("Monthly Measles vaccinations: Haut-Katanga Province", ///
			size(small) color(black))  xlabel(1(1)60) xlabel(,  labsize(tiny)) ylabel(0(5000)25000, labsize(small))

			graph export "$user/Results/DRC/DHIS2 Graphs/mmr_HK.pdf", replace
restore	

*-------------------------------------------------------------------------------	
	* Ituri
*-------------------------------------------------------------------------------	
* PENTA3
preserve 
		keep if province==6
		collapse (sum) penta3  , by(rmonth)

			twoway (scatter penta3 rmonth, msize(vsmall) mcolor(brown)  sort), ///
			ylabel(, labsize(small))  ytitle("Number of children vaccinated", size(vsmall)) ///
			xtitle("January 2019 to December 2023, vertical lines are years", size(vsmall)) legend(off) ///
			xline(12, lpattern(dot) lcolor(grey)) xline(24, lpattern(dot) lcolor(grey)) ///
			xline(36, lpattern(dot) lcolor(grey))  xline(48, lpattern(dot) lcolor(grey)) ///
			graphregion(color(white)) title("Monthly Penta3 vaccinations: Ituri Province", ///
			size(small) color(black))  xlabel(1(1)60) xlabel(,  labsize(tiny)) ylabel(0(5000)25000, labsize(small))

			graph export "$user/Results/DRC/DHIS2 Graphs/penta3_IT.pdf", replace
restore

* MMR 
preserve 
		keep if province==6
		collapse (sum) mmr , by(rmonth)

			twoway (scatter mmr rmonth, msize(vsmall)  mcolor(brown) sort), ///
			ylabel(, labsize(small))  ytitle("Number of children vaccinated", size(vsmall)) ///
			xtitle("January 2019 to December 2023, vertical lines are years", size(vsmall)) legend(off) ///
			xline(12, lpattern(dot) lcolor(grey)) xline(24, lpattern(dot) lcolor(grey)) ///
			xline(36, lpattern(dot) lcolor(grey))  xline(48, lpattern(dot) lcolor(grey)) ///
			graphregion(color(white)) title("Monthly Measles vaccinations: Ituri Province", ///
			size(small) color(black))  xlabel(1(1)60) xlabel(,  labsize(tiny)) ylabel(0(5000)25000, labsize(small))

			graph export "$user/Results/DRC/DHIS2 Graphs/mmr_IT.pdf", replace
restore	










/*
	keep if province==24
			qui reg penta3 rmonth if rmonth<37   // linear prediction baseline
			predict linear_penta3
			
			collapse  penta3 linear_penta3 , by(rmonth)

			twoway (scatter penta3 rmonth, msize(vsmall)  sort) ///
			(line linear_penta3 rmonth, lpattern(dash) lcolor(green)) ///
			(lfit penta3 rmonth if rmonth<37, lcolor(green)) ///
			(lfit penta3 rmonth if rmonth>=37 & rmonth<=60 , lcolor(blue)) , ///
			ylabel(, labsize(small)) xline(36, lpattern(dash) lcolor(black)) ///
			xline(36, lpattern(dash) lcolor(black)) ///
			xtitle("", size(small)) legend(off) ///
			graphregion(color(white)) title("Penta 3 (2019-2023)", size(msmall) color(black))  ///
			xlabel(1(1)60) xlabel(,  labsize(tiny)) ylabel(0(5000)20000, labsize(small))
			
	
	keep if province==4
			qui reg penta3 rmonth if rmonth<16   // linear prediction baseline
			predict linear_penta3
			
			collapse (sum) penta3 linear_penta3 , by(rmonth)

			twoway (scatter penta3 rmonth, msize(vsmall)  sort) ///
			(line linear_penta3 rmonth, lpattern(dash) lcolor(green)) ///
			(lfit penta3 rmonth if rmonth<16, lcolor(green)) ///
			(lfit penta3 rmonth if rmonth>=16 & rmonth<=36, lcolor(red)) /// 
			(lfit penta3 rmonth if rmonth>=37 & rmonth<=60 , lcolor(blue)) , ///
			ylabel(, labsize(small)) xline(15, lpattern(dash) lcolor(black)) ///
			xline(36, lpattern(dash) lcolor(black)) ///
			xtitle("", size(small)) legend(off) ///
			graphregion(color(white)) title("Haut Lomami Number of children who received Penta 3 (Jan 2019- Dec 2023)", size(msmall) color(black))  ///
			xlabel(1(1)60) xlabel(,  labsize(tiny)) ylabel(0(5000)20000, labsize(small))

keep if province==10
			qui reg penta3 rmonth if rmonth<16   // linear prediction baseline
			predict linear_penta3
			
			collapse (sum) penta3 linear_penta3 , by(rmonth)

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

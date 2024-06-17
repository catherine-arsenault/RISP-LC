	global user  "/Users/catherine.arsenault/Dropbox/BMGF RISP Project/Quant analysis/"
	
*-------------------------------------------------------------------------------
* GRAPHS
*-------------------------------------------------------------------------------
	u  "$user/RAW DATA/DRC/DHIS2/DHIS2_2018-2023_long.dta", clear
	collapse (sum) penta3 mmr fullvax ipv1 rota3 pcv3 opv3  yf , by (province rmonth)
	
	cd "/Users/catherine.arsenault/Dropbox/BMGF RISP Project/Quant analysis/Results/DRC/DHIS2 Graphs"
*-------------------------------------------------------------------------------	
	* Haut Lomami 
*-------------------------------------------------------------------------------	
* PENTA3
preserve 
		keep if province==4
		qui reg penta3 rmonth if rmonth<28   // linear prediction baseline (Jan 18 to Mar 20)
			predict linear_penta3
		collapse (sum) penta3  linear_penta3, by(rmonth)
		
			twoway (scatter penta3 rmonth, msize(vsmall) mcolor(gray) sort) ///
			(line linear_penta3 rmonth, lpattern(dash) lcolor(green)) ///
			(lfit penta3 rmonth if rmonth<28, lcolor(green)) ///
			(lfit penta3 rmonth if rmonth>=49 & rmonth<=67 , saving(HL, replace) lcolor(blue)) , /// current period Jan 22 to Dec 23
			ylabel(, labsize(small)) ytitle("Number of children vaccinated", size(vsmall)) ///
			xtitle("January 2018 to December 2023", size(vsmall))  ///
			xline(28, lpattern(dot) lcolor(grey)) xline(49, lpattern(dot) lcolor(grey)) ///
			graphregion(color(white)) title("Monthly Penta3 vaccinations: Haut-Lomami Province", ///
			size(msmall) color(black))  xlabel(1(1)72) xlabel(,  labsize(tiny)) ylabel(0(5000)20000, labsize(small))
				
			graph export "$user/Results/DRC/DHIS2 Graphs/penta3_HL.pdf", replace
restore

			*(lfit penta3 rmonth if rmonth>=28 & rmonth<=48 , lcolor(gray))  /// covid period Apr 20 to Dec 21		
*-------------------------------------------------------------------------------	
	* Tanganyika
*-------------------------------------------------------------------------------	
* PENTA3
preserve 
		keep if province==24
		qui reg penta3 rmonth if rmonth<28   // linear prediction baseline (Jan 18 to Mar 20)
		predict linear_penta3
		collapse (sum) penta3  linear_penta3, by(rmonth)

			twoway (scatter penta3 rmonth, msize(vsmall) mcolor(gray) msymbol(triangle) sort) ///
			(line linear_penta3 rmonth, lpattern(dash) lcolor(green)) ///
			(lfit penta3 rmonth if rmonth<28, lcolor(green)) ///
			(lfit penta3 rmonth if rmonth>=49 & rmonth<=68 , lcolor(blue)) , saving(TAN, replace) /// current period Jan 22 to Dec 23
			ylabel(, labsize(small))  ytitle("Number of children vaccinated", size(vsmall)) ///
			xtitle("January 2018 to December 2023", size(vsmall)) legend(off) ///
			xline(28, lpattern(dot) lcolor(grey)) xline(49, lpattern(dot) lcolor(grey)) ///
			graphregion(color(white)) title("Monthly Penta3 vaccinations: Tanganyika Province", ///
			size(msmall) color(black))  xlabel(1(1)72) xlabel(,  labsize(tiny)) ylabel(0(5000)20000, labsize(small))

			graph export "$user/Results/DRC/DHIS2 Graphs/penta3_TG.pdf", replace
restore					
*-------------------------------------------------------------------------------	
	* Lualaba
*-------------------------------------------------------------------------------	
* PENTA3
preserve 
		keep if province==14
		qui reg penta3 rmonth if rmonth<28   // linear prediction baseline (Jan 18 to Mar 20)
		predict linear_penta3
		collapse (sum) penta3  linear_penta3, by(rmonth)

			twoway (scatter penta3 rmonth, msize(vsmall) mcolor(gray) msymbol(square) sort) ///
			(line linear_penta3 rmonth, lpattern(dash) lcolor(green)) ///
			(lfit penta3 rmonth if rmonth<28, lcolor(green)) ///
			(lfit penta3 rmonth if rmonth>=49 & rmonth<=72 , lcolor(blue)) , saving(LUA, replace) /// current period Jan 22 to Dec 23
			ylabel(, labsize(small))  ytitle("Number of children vaccinated", size(vsmall)) ///
			xtitle("January 2018 to December 2023", size(vsmall)) legend(off) ///
			xline(28, lpattern(dot) lcolor(grey)) xline(49, lpattern(dot) lcolor(grey)) ///
			graphregion(color(white)) title("Monthly Penta3 vaccinations: Lualaba Province", ///
			size(small) color(black))  xlabel(1(1)72) xlabel(,  labsize(tiny)) ylabel(0(5000)20000, labsize(small))

			graph export "$user/Results/DRC/DHIS2 Graphs/penta3_LU.pdf", replace
restore					
*-------------------------------------------------------------------------------	
	* Kinshasa
*-------------------------------------------------------------------------------	
* PENTA3
preserve 
		keep if province==11
		qui reg penta3 rmonth if rmonth<28   // linear prediction baseline (Jan 18 to Mar 20)
		predict linear_penta3
		collapse (sum) penta3  linear_penta3, by(rmonth)

			twoway (scatter penta3 rmonth, msize(vsmall) mcolor(sand) msymbol(triangle) sort) ///
			(line linear_penta3 rmonth, lpattern(dash) lcolor(green)) ///
			(lfit penta3 rmonth if rmonth<28, lcolor(green)) ///
			(lfit penta3 rmonth if rmonth>=49 & rmonth<=72 , lcolor(blue)) , saving(KIN, replace) /// current period Jan 22 to Dec 23
			ylabel(, labsize(small))  ytitle("Number of children vaccinated", size(vsmall)) ///
			xtitle("January 2018 to December 2023", size(vsmall)) legend(off) ///
			xline(28, lpattern(dot) lcolor(grey)) xline(49, lpattern(dot) lcolor(grey)) ///
			graphregion(color(white)) title("Monthly Penta3 vaccinations: Kinshasa Province", ///
			size(small) color(black))  xlabel(1(1)72) xlabel(,  labsize(tiny)) ylabel(0(20000)60000, labsize(small))

			graph export "$user/Results/DRC/DHIS2 Graphs/penta3_KI.pdf", replace
restore			
			
*-------------------------------------------------------------------------------	
	* Other original six Mashako Plan provinces
	* Mongala, Tshuapa, Haut Katanga, Ituri, Kwilu, Kasaï
*-------------------------------------------------------------------------------	
* PENTA3
preserve 
		keep if province==17 | province==26 | province==3 | province==6 | province==10  | province==13
		qui reg penta3 rmonth if rmonth<28   // linear prediction baseline (Jan 18 to Mar 20)
		predict linear_penta3
		collapse (sum) penta3  linear_penta3, by(rmonth)

			twoway (scatter penta3 rmonth, msize(vsmall) mcolor(sand) sort) ///
			(line linear_penta3 rmonth, lpattern(dash) lcolor(green)) ///
			(lfit penta3 rmonth if rmonth<28, lcolor(green)) ///
			(lfit penta3 rmonth if rmonth>=49 & rmonth<=68 , lcolor(blue)) , saving(Mash6, replace) /// current period Jan 22 to Dec 23
			ylabel(, labsize(small))  ytitle("Number of children vaccinated", size(vsmall)) ///
			xtitle("January 2018 to December 2023", size(vsmall)) legend(off) ///
			xline(28, lpattern(dot) lcolor(grey)) xline(49, lpattern(dot) lcolor(grey)) ///
			graphregion(color(white)) title("Monthly Penta3 vaccinations: Other 6 initial Mashako Provinces", ///
			size(small) color(black))  xlabel(1(1)72) xlabel(,  labsize(tiny)) ylabel(20000(20000)160000, labsize(small))

			graph export "$user/Results/DRC/DHIS2 Graphs/penta3_other6.pdf", replace
restore			
			
*-------------------------------------------------------------------------------	
	* Combining graphs
*-------------------------------------------------------------------------------
		u  "$user/RAW DATA/DRC/DHIS2/DHIS2_2018-2023_long.dta", clear
		
		g provcat = 1 if province==4
		replace provcat=2 if province ==24
		replace provcat=3 if province==14
		replace provcat=4 if province==17 | province==26 | province==3 | province==6 | province==10  | province==13
		replace provcat=5 if province ==11
		
		lab def provcat 1"Haut-Lomami" 2"Tanganyika" 3"Lualaba" 4"Other 6 initial Mashako provinces" 5"Kinshasa"
		lab val provcat provcat
		
		drop if provcat==.
		
		collapse (sum) penta3 mmr fullvax ipv1 rota3 pcv3 opv3  yf , by (provcat rmonth)
		
		qui reg penta3 rmonth if rmonth<28 & provcat==1  // linear prediction baseline (Jan 18 to Mar 20) HL
			predict linear_penta3_HL
		qui reg penta3 rmonth if rmonth<28 & provcat==2  // linear prediction baseline (Jan 18 to Mar 20) TAN
			predict linear_penta3_TA
		qui reg penta3 rmonth if rmonth<28   & provcat==3 // linear prediction baseline (Jan 18 to Mar 20) LUA
			predict linear_penta3_LU
		qui reg penta3 rmonth if rmonth<28 & provcat==4  // linear prediction baseline (Jan 18 to Mar 20) Mash6
			predict linear_penta3_MA6
		qui reg penta3 rmonth if rmonth<28 & provcat==5  // linear prediction baseline (Jan 18 to Mar 20) KIN
			predict linear_penta3_KIN
		
		
*-------------------------------------------------------------------------------
* GRAPH: PENTA3 IN THE 3 MOU PROVINCES, CUTTING AT MONTH 68 (until AUG 2023, excluding the last 4 months of 2023)
*-------------------------------------------------------------------------------	
preserve
	drop if rmonth>67
*-------------------------------------------------------------------------------	
		twoway (scatter penta3 rmonth if provcat==1, msize(vsmall) mcolor(gray) sort) ///
			(line linear_penta3_HL rmonth if provcat==1, lpattern(shortdash) lcolor(stgreen)) ///
			(lfit penta3 rmonth if rmonth<28 & provcat==1, lcolor(stgreen)) ///
			(lfit penta3 rmonth if rmonth>=49  & provcat==1 , lcolor(stgreen))  /// 
					(scatter penta3 rmonth if provcat==2, msize(vsmall) mcolor(gray) msymbol(triangle) sort) ///
					(line linear_penta3_TA rmonth if provcat==2, lpattern(shortdash) lcolor(stblue)) ///
					(lfit penta3 rmonth if rmonth<28 & provcat==2, lcolor(stblue)) ///
					(lfit penta3 rmonth if rmonth>=49  & provcat==2, lcolor(stblue)) ///
						(scatter penta3 rmonth if provcat==3, msize(vsmall) mcolor(gray) msymbol(square) sort) ///
						(line linear_penta3_LU rmonth if provcat==3, lpattern(shortdash) lcolor(lavender)) ///
						(lfit penta3 rmonth if rmonth<28 & provcat==3, lcolor(lavender)) ///
						(lfit penta3 rmonth if rmonth>=49 &  provcat==3, lcolor(lavender)), ///				
			ylabel(, labsize(small)) ytitle("Number of children vaccinated", size(vsmall)) ///
			xtitle("January 2018 to July 2023", size(vsmall))  legend(off) ///
			xline(28, lpattern(dot) lcolor(grey)) xline(49, lpattern(dot) lcolor(grey)) ///
			graphregion(color(white)) title("Monthly Penta3 vaccinations in the 3 MOU Provinces*", ///
			size(small) color(black))  xlabel(1(1)67) xlabel(,  labsize(tiny)) ylabel(0(5000)20000, labsize(small))
			
			graph export "$user/Results/DRC/DHIS2 Graphs/penta3_3mou.pdf", replace
*-------------------------------------------------------------------------------
* GRAPH: OTHER 7 INITIAL MASHAKO PROVINCES
*-------------------------------------------------------------------------------
		twoway (scatter penta3 rmonth if provcat==4, msize(vsmall) mcolor(sand) sort) ///
					(line linear_penta3_MA6 rmonth if provcat==4, lpattern(shortdash) lcolor(styellow)) ///
					(lfit penta3 rmonth if rmonth<28 & provcat==4, lcolor(styellow)) ///
					(lfit penta3 rmonth if rmonth>=49  & provcat==4, lcolor(styellow)) ///
							(scatter penta3 rmonth if provcat==5, msize(vsmall) mcolor(sand) sort) ///
							(line linear_penta3_KIN rmonth if provcat==5, lpattern(shortdash) lcolor(stred)) ///
							(lfit penta3 rmonth if rmonth<28 & provcat==5, lcolor(stred)) ///
							(lfit penta3 rmonth if rmonth>=49 & provcat==5, lcolor(stred)), ///
							ylabel(, labsize(small)) ytitle("Number of children vaccinated", size(vsmall)) ///
				xtitle("January 2018 to July 2023", size(vsmall))  legend(off) ///
				xline(28, lpattern(dot) lcolor(grey)) xline(49, lpattern(dot) lcolor(grey)) ///
				graphregion(color(white)) title("Monthly Penta3 vaccinations in the other 7 initial Mashako Plan Provinces", ///
				size(small) color(black))  xlabel(1(1)67) xlabel(,  labsize(tiny)) ylabel(0(20000)120000, labsize(small))
				
				graph export "$user/Results/DRC/DHIS2 Graphs/penta3_other6.pdf", replace
restore 
*-------------------------------------------------------------------------------
* GRAPH: PENTA3 IN THE 3 MOU PROVINCES UNTIL DEC 2023
*-------------------------------------------------------------------------------	
		twoway (scatter penta3 rmonth if provcat==1, msize(vsmall) mcolor(gray) sort) ///
			(line linear_penta3_HL rmonth if provcat==1, lpattern(shortdash) lcolor(stgreen)) ///
			(lfit penta3 rmonth if rmonth<28 & provcat==1, lcolor(stgreen)) ///
			(lfit penta3 rmonth if rmonth>=49  & provcat==1 , lcolor(stgreen))  /// 
					(scatter penta3 rmonth if provcat==2, msize(vsmall) mcolor(gray) msymbol(triangle) sort) ///
					(line linear_penta3_TA rmonth if provcat==2, lpattern(shortdash) lcolor(stblue)) ///
					(lfit penta3 rmonth if rmonth<28 & provcat==2, lcolor(stblue)) ///
					(lfit penta3 rmonth if rmonth>=49  & provcat==2, lcolor(stblue)) ///
						(scatter penta3 rmonth if provcat==3, msize(vsmall) mcolor(gray) msymbol(square) sort) ///
						(line linear_penta3_LU rmonth if provcat==3, lpattern(shortdash) lcolor(lavender)) ///
						(lfit penta3 rmonth if rmonth<28 & provcat==3, lcolor(lavender)) ///
						(lfit penta3 rmonth if rmonth>=49 &  provcat==3, lcolor(lavender)), ///				
			ylabel(, labsize(small)) ytitle("Number of children vaccinated", size(vsmall)) ///
			xtitle("January 2018 to December 2023", size(vsmall))  legend(off) ///
			xline(28, lpattern(dot) lcolor(grey)) xline(49, lpattern(dot) lcolor(grey)) ///
			graphregion(color(white)) title("Monthly Penta3 vaccinations in the 3 MOU Provinces", ///
			size(small) color(black))  xlabel(1(1)72) xlabel(,  labsize(tiny)) ylabel(0(5000)20000, labsize(small))
			
			graph export "$user/Results/DRC/DHIS2 Graphs/penta3_3mou_EXT.pdf", replace
*-------------------------------------------------------------------------------
* GRAPH: OTHER 7 INITIAL MASHAKO PROVINCES
*-------------------------------------------------------------------------------
		twoway (scatter penta3 rmonth if provcat==4, msize(vsmall) mcolor(sand) sort) ///
					(line linear_penta3_MA6 rmonth if provcat==4, lpattern(shortdash) lcolor(styellow)) ///
					(lfit penta3 rmonth if rmonth<28 & provcat==4, lcolor(styellow)) ///
					(lfit penta3 rmonth if rmonth>=49  & provcat==4, lcolor(styellow)) ///
							(scatter penta3 rmonth if provcat==5, msize(vsmall) mcolor(sand) sort) ///
							(line linear_penta3_KIN rmonth if provcat==5, lpattern(shortdash) lcolor(stred)) ///
							(lfit penta3 rmonth if rmonth<28 & provcat==5, lcolor(stred)) ///
							(lfit penta3 rmonth if rmonth>=49 & provcat==5, lcolor(stred)), ///
							ylabel(, labsize(small)) ytitle("Number of children vaccinated", size(vsmall)) ///
				xtitle("January 2018 to December 2023", size(vsmall))  legend(off) ///
				xline(28, lpattern(dot) lcolor(grey)) xline(49, lpattern(dot) lcolor(grey)) ///
				graphregion(color(white)) title("Monthly Penta3 vaccinations in the other 7 initial Mashako Plan Provinces", ///
				size(small) color(black))  xlabel(1(1)72) xlabel(,  labsize(tiny)) ylabel(0(20000)120000, labsize(small))
				
				graph export "$user/Results/DRC/DHIS2 Graphs/penta3_other6_EXT.pdf", replace

			
	
	
	
	
			
/*			
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
			xtitle("January 2019 to December 2023", size(vsmall)) legend(off) ///
			xline(12, lpattern(dot) lcolor(grey)) xline(24, lpattern(dot) lcolor(grey)) ///
			xline(36, lpattern(dot) lcolor(grey))  xline(48, lpattern(dot) lcolor(grey)) ///
			graphregion(color(white)) title("Monthly PCV3 vaccinations: Haut-Lomami Province", ///
			size(small) color(black))  xlabel(1(1)60) xlabel(,  labsize(tiny)) ylabel(0(5000)20000, labsize(small))

			graph export "$user/Results/DRC/DHIS2 Graphs/pcv3_HL.pdf", replace
restore	


*(lfit penta3 rmonth if rmonth>=28 & rmonth<=48 , lcolor(gray))  /// covid period Apr 20 to Dec 21
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


* MMR 
preserve 
		keep if province==14
		collapse (sum) mmr , by(rmonth)

			twoway (scatter mmr rmonth, msize(vsmall) mcolor(gray) sort), ///
			ylabel(, labsize(small))  ytitle("Number of children vaccinated", size(vsmall)) ///
			xtitle("January 2019 to December 2023, vertical lines are years", size(vsmall)) legend(off) ///
			xline(12, lpattern(dot) lcolor(grey)) xline(24, lpattern(dot) lcolor(grey)) ///
			xline(36, lpattern(dot) lcolor(grey))  xline(48, lpattern(dot) lcolor(grey)) ///
			graphregion(color(white)) title("Monthly Measles vaccinations: Lualaba Province", ///
			size(small) color(black))  xlabel(1(1)60) xlabel(,  labsize(tiny)) ylabel(0(5000)20000, labsize(small))

			graph export "$user/Results/DRC/DHIS2 Graphs/mmr_LU.pdf", replace
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

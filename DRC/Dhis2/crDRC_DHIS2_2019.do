	
* Analyses of DHIS2 vaccination data DRC Jan 2019 - December 2023
* Created May 6, 2024
*-------------------------------------------------------------------------------
global user "/Users/catherine.arsenault/Dropbox/BMGF RISP Project/Quant analysis/"

*-------------------------------------------------------------------------------
* 2019
* Jan
	import excel using "$user/RAW DATA/DRC/DHIS2/2019/Janvier 2019.xls", firstrow clear
	duplicates tag org*, g(tag)
	egen sum=rowtotal(B84BCGJanvier2019-B84VPO3Janvier2019) if tag==1
	drop if tag==1 & sum==0
	drop tag sum
	rename (PopulationdelAiredeSantéJa-B84PCV133Janvier2019) (popaire_1_19 bcg_1_19 penta1_1_19 penta2_1_19 ///
	penta3_1_19 fullvax_1_19 pcv1_1_19 pcv2_1_19 pcv3_1_19)
	egen rota1_1_19=rowtotal(B84Rota10et11moisAvanc-B84Rota112et23moisMobi)
	egen rota2_1_19=rowtotal(B84Rota20et11moisAvanc-B84Rota212et23moisMobi)
	egen rota3_1_19=rowtotal(B84Rota30et11moisAvanc-B84Rota312et23moisMobi)
	drop B84Rota10et11moisAvanc-B84Rota312et23moisMobi
	rename (B84VAAJanvier2019 B84VARJanvier2019) (yf_1_19 mmr_1_19)
	drop B84VAR1RR1Janvier2019 B84VAR2RR2Janvier2019
	rename (B84VPIJanvier2019-B84VPO3Janvier2019) (ipv1_1_19 ipv2_1_19 opv0_1_19 ///
	opv1_1_19 opv2_1_19 opv3_1_19)
save "$user/RAW DATA/DRC/DHIS2/2019/DHIS2_2019.dta", replace
* Feb
	import excel using "$user/RAW DATA/DRC/DHIS2/2019/Février 2019.xls", firstrow clear
	duplicates tag org*, g(tag)
	egen sum=rowtotal(B84BCGFévrier2019-B84VPO3Février2019) if tag==1
	drop if tag==1 & sum==0
	drop tag sum 
	rename (PopulationdelAiredeSantéFé-B84PCV133Février2019) (popaire_2_19 bcg_2_19 penta1_2_19 penta2_2_19 ///
	penta3_2_19 fullvax_2_19 pcv1_2_19 pcv2_2_19 pcv3_2_19)
	egen rota1_2_19=rowtotal(B84Rota10et11moisAvanc-B84Rota112et23moisMobi)
	egen rota2_2_19=rowtotal(B84Rota20et11moisAvanc-B84Rota212et23moisMobi)
	egen rota3_2_19=rowtotal(B84Rota30et11moisAvanc-B84Rota312et23moisMobi)
		drop B84Rota10et11moisAvanc-B84Rota312et23moisMobi
	rename (B84VAAFévrier2019 B84VARFévrier2019) (yf_2_19 mmr_2_19)
		drop B84VAR1RR1Février2019 B84VAR2RR2Février2019
	rename (B84VPIFévrier2019-B84VPO3Février2019) (ipv1_2_19 ipv2_2_19 opv0_2_19 ///
	opv1_2_19 opv2_2_19 opv3_2_19)
	merge 1:1 org* using "$user/RAW DATA/DRC/DHIS2/2019/DHIS2_2019"
	drop _merge
	save "$user/RAW DATA/DRC/DHIS2/2019/DHIS2_2019.dta", replace
	
* Mar
	import excel using "$user/RAW DATA/DRC/DHIS2/2019/Mars 2019.xls", firstrow clear
	duplicates tag org*, g(tag)
	egen sum=rowtotal(B84BCGMars2019-B84VPO3Mars2019) if tag==1
	drop if tag==1 & sum==0
	drop tag sum 
	rename (PopulationdelAiredeSantéMa-B84PCV133Mars2019) (popaire_3_19 bcg_3_19 penta1_3_19 penta2_3_19 ///
	penta3_3_19 fullvax_3_19 pcv1_3_19 pcv2_3_19 pcv3_3_19)
	egen rota1_3_19=rowtotal(B84Rota10et11moisAvanc-B84Rota112et23moisMobi)
	egen rota2_3_19=rowtotal(B84Rota20et11moisAvanc-B84Rota212et23moisMobi)
	egen rota3_3_19=rowtotal(B84Rota30et11moisAvanc-B84Rota312et23moisMobi)
	drop B84Rota10et11moisAvanc-B84Rota312et23moisMobi
	rename (B84VAAMars2019 B84VARMars2019) (yf_3_19 mmr_3_19)
	drop B84VAR1RR1Mars2019 B84VAR2RR2Mars2019
	rename (B84VPIMars2019-B84VPO3Mars2019) (ipv1_3_19 ipv2_3_19 opv0_3_19 ///
	opv1_3_19 opv2_3_19 opv3_3_19)
	merge 1:1 org* using "$user/RAW DATA/DRC/DHIS2/2019/DHIS2_2019"
	drop _merge
	save "$user/RAW DATA/DRC/DHIS2/2019/DHIS2_2019.dta", replace
* Apr 
	import excel using "$user/RAW DATA/DRC/DHIS2/2019/Avril 2019.xls", firstrow clear
	duplicates tag org*, g(tag)
	egen sum=rowtotal(B84BCGAvril2019-B84VPO3Avril2019) if tag==1
	drop if tag==1 & sum==0
	drop tag sum 
	rename (PopulationdelAiredeSantéAv-B84PCV133Avril2019) (popaire_4_19 bcg_4_19 penta1_4_19 penta2_4_19 ///
	penta3_4_19 fullvax_4_19 pcv1_4_19 pcv2_4_19 pcv3_4_19)
	egen rota1_4_19=rowtotal(B84Rota10et11moisAvanc-B84Rota112et23moisMobi)
	egen rota2_4_19=rowtotal(B84Rota20et11moisAvanc-B84Rota212et23moisMobi)
	egen rota3_4_19=rowtotal(B84Rota30et11moisAvanc-B84Rota312et23moisMobi)
	drop B84Rota10et11moisAvanc-B84Rota312et23moisMobi
	rename (B84VAAAvril2019 B84VARAvril2019) (yf_4_19 mmr_4_19)
	drop B84VAR1RR1Avril2019 B84VAR2RR2Avril2019
	rename (B84VPIAvril2019-B84VPO3Avril2019) (ipv1_4_19 ipv2_4_19 opv0_4_19 ///
	opv1_4_19 opv2_4_19 opv3_4_19)
	merge 1:1 org* using "$user/RAW DATA/DRC/DHIS2/2019/DHIS2_2019"
	drop _merge
	save "$user/RAW DATA/DRC/DHIS2/2019/DHIS2_2019.dta", replace
* May	
	import excel using "$user/RAW DATA/DRC/DHIS2/2019/Mai 2019.xls", firstrow clear
	duplicates tag org*, g(tag)
	egen sum=rowtotal(B84BCGMai2019-B84VPO3Mai2019) if tag==1
	drop if tag==1 & sum==0
	drop tag sum
	rename (PopulationdelAiredeSantéMa-B84PCV133Mai2019) (popaire_5_19 bcg_5_19 penta1_5_19 penta2_5_19 ///
	penta3_5_19 fullvax_5_19 pcv1_5_19 pcv2_5_19 pcv3_5_19)
	egen rota1_5_19=rowtotal(B84Rota10et11moisAvanc-B84Rota112et23moisMobi)
	egen rota2_5_19=rowtotal(B84Rota20et11moisAvanc-B84Rota212et23moisMobi)
	egen rota3_5_19=rowtotal(B84Rota30et11moisAvanc-B84Rota312et23moisMobi)
	drop B84Rota10et11moisAvanc-B84Rota312et23moisMobi
	rename (B84VAAMai2019 B84VARMai2019) (yf_5_19 mmr_5_19)
	drop B84VAR1RR1Mai2019 B84VAR2RR2Mai2019
	rename (B84VPIMai2019-B84VPO3Mai2019) (ipv1_5_19 ipv2_5_19 opv0_5_19 ///
	opv1_5_19 opv2_5_19 opv3_5_19)
	merge 1:1 org* using "$user/RAW DATA/DRC/DHIS2/2019/DHIS2_2019"
	drop _merge
	save "$user/RAW DATA/DRC/DHIS2/2019/DHIS2_2019.dta", replace
* Jun	
	import excel using "$user/RAW DATA/DRC/DHIS2/2019/Juin 2019.xls", firstrow clear
	duplicates tag org*, g(tag)
	egen sum=rowtotal(B84BCGJuin2019-B84VPO3Juin2019) if tag==1
	drop if tag==1 & sum==0
	drop tag sum
	rename (PopulationdelAiredeSantéJu-B84PCV133Juin2019) (popaire_6_19 bcg_6_19 penta1_6_19 penta2_6_19 ///
	penta3_6_19 fullvax_6_19 pcv1_6_19 pcv2_6_19 pcv3_6_19)
	egen rota1_6_19=rowtotal(B84Rota10et11moisAvanc-B84Rota112et23moisMobi)
	egen rota2_6_19=rowtotal(B84Rota20et11moisAvanc-B84Rota212et23moisMobi)
	egen rota3_6_19=rowtotal(B84Rota30et11moisAvanc-B84Rota312et23moisMobi)
	drop B84Rota10et11moisAvanc-B84Rota312et23moisMobi
	rename (B84VAAJuin2019 B84VARJuin2019) (yf_6_19 mmr_6_19)
	drop B84VAR1RR1Juin2019 B84VAR2RR2Juin2019
	rename (B84VPIJuin2019-B84VPO3Juin2019) (ipv1_6_19 ipv2_6_19 opv0_6_19 ///
	opv1_6_19 opv2_6_19 opv3_6_19)
	merge 1:1 org* using "$user/RAW DATA/DRC/DHIS2/2019/DHIS2_2019"
	drop _merge
	save "$user/RAW DATA/DRC/DHIS2/2019/DHIS2_2019.dta", replace
*Jul	
	import excel using "$user/RAW DATA/DRC/DHIS2/2019/Juillet 2019.xls", firstrow clear
	duplicates tag org*, g(tag)
	egen sum=rowtotal(B84BCGJuillet2019-B84VPO3Juillet2019) if tag==1
	drop if tag==1 & sum==0
	drop tag sum 
	rename (PopulationdelAiredeSantéJu-B84PCV133Juillet2019) (popaire_7_19 bcg_7_19 penta1_7_19 penta2_7_19 ///
	penta3_7_19 fullvax_7_19 pcv1_7_19 pcv2_7_19 pcv3_7_19)
	egen rota1_7_19=rowtotal(B84Rota10et11moisAvanc-B84Rota112et23moisMobi)
	egen rota2_7_19=rowtotal(B84Rota20et11moisAvanc-B84Rota212et23moisMobi)
	egen rota3_7_19=rowtotal(B84Rota30et11moisAvanc-B84Rota312et23moisMobi)
	drop B84Rota10et11moisAvanc-B84Rota312et23moisMobi
	rename (B84VAAJuillet2019 B84VARJuillet2019) (yf_7_19 mmr_7_19)
	drop B84VAR1RR1Juillet2019 B84VAR2RR2Juillet2019
	rename (B84VPIJuillet2019-B84VPO3Juillet2019) (ipv1_7_19 ipv2_7_19 opv0_7_19 ///
	opv1_7_19 opv2_7_19 opv3_7_19)
	merge 1:1 org* using "$user/RAW DATA/DRC/DHIS2/2019/DHIS2_2019"
	drop _merge
	save "$user/RAW DATA/DRC/DHIS2/2019/DHIS2_2019.dta", replace
*Aug	
	import excel using "$user/RAW DATA/DRC/DHIS2/2019/Août 2019.xls", firstrow clear
	duplicates tag org*, g(tag)
	egen sum=rowtotal(B84BCGAoût2019-B84VPO3Août2019) if tag==1
	drop if tag==1 & sum==0
	drop tag sum
	rename (PopulationdelAiredeSantéAo-B84PCV133Août2019) (popaire_8_19 bcg_8_19 penta1_8_19 penta2_8_19 ///
	penta3_8_19 fullvax_8_19 pcv1_8_19 pcv2_8_19 pcv3_8_19)
	egen rota1_8_19=rowtotal(B84Rota10et11moisAvanc-B84Rota112et23moisMobi)
	egen rota2_8_19=rowtotal(B84Rota20et11moisAvanc-B84Rota212et23moisMobi)
	egen rota3_8_19=rowtotal(B84Rota30et11moisAvanc-B84Rota312et23moisMobi)
	drop B84Rota10et11moisAvanc-B84Rota312et23moisMobi
	rename (B84VAAAoût2019 B84VARAoût2019) (yf_8_19 mmr_8_19)
	drop B84VAR1RR1Août2019 B84VAR2RR2Août2019
	rename (B84VPIAoût2019-B84VPO3Août2019) (ipv1_8_19 ipv2_8_19 opv0_8_19 ///
	opv1_8_19 opv2_8_19 opv3_8_19)
	merge 1:1 org* using "$user/RAW DATA/DRC/DHIS2/2019/DHIS2_2019"
	drop _merge
	save "$user/RAW DATA/DRC/DHIS2/2019/DHIS2_2019.dta", replace
*Sep	
	import excel using "$user/RAW DATA/DRC/DHIS2/2019/Septembre 2019.xls", firstrow clear
	duplicates tag org*, g(tag)
	egen sum=rowtotal(B84BCGSeptembre2019-B84VPO3Septembre2019) if tag==1
	drop if tag==1 & sum==0
	drop tag sum 
	rename (PopulationdelAiredeSantéSe-B84PCV133Septembre2019) (popaire_9_19 bcg_9_19 penta1_9_19 penta2_9_19 ///
	penta3_9_19 fullvax_9_19 pcv1_9_19 pcv2_9_19 pcv3_9_19)
	egen rota1_9_19=rowtotal(B84Rota10et11moisAvanc-B84Rota112et23moisMobi)
	egen rota2_9_19=rowtotal(B84Rota20et11moisAvanc-B84Rota212et23moisMobi)
	egen rota3_9_19=rowtotal(B84Rota30et11moisAvanc-B84Rota312et23moisMobi)
	drop B84Rota10et11moisAvanc-B84Rota312et23moisMobi
	rename (B84VAASeptembre2019 B84VARSeptembre2019) (yf_9_19 mmr_9_19)
	drop B84VAR1RR1Septembre2019 B84VAR2RR2Septembre2019
	rename (B84VPISeptembre2019-B84VPO3Septembre2019) (ipv1_9_19 ipv2_9_19 opv0_9_19 ///
	opv1_9_19 opv2_9_19 opv3_9_19)
	merge 1:1 org* using "$user/RAW DATA/DRC/DHIS2/2019/DHIS2_2019"
	drop _merge
	save "$user/RAW DATA/DRC/DHIS2/2019/DHIS2_2019.dta", replace
*Oct	
	import excel using "$user/RAW DATA/DRC/DHIS2/2019/Octobre 2019.xls", firstrow clear
	duplicates tag org*, g(tag)
	egen sum=rowtotal(B84BCGOctobre2019-B84VPO3Octobre2019) if tag==1
	drop if tag==1 & sum==0
	drop tag sum 
	rename (PopulationdelAiredeSantéOc-B84PCV133Octobre2019) (popaire_10_19 bcg_10_19 penta1_10_19 penta2_10_19 ///
	penta3_10_19 fullvax_10_19 pcv1_10_19 pcv2_10_19 pcv3_10_19)
	egen rota1_10_19=rowtotal(B84Rota10et11moisAvanc-B84Rota112et23moisMobi)
	egen rota2_10_19=rowtotal(B84Rota20et11moisAvanc-B84Rota212et23moisMobi)
	egen rota3_10_19=rowtotal(B84Rota30et11moisAvanc-B84Rota312et23moisMobi)
	drop B84Rota10et11moisAvanc-B84Rota312et23moisMobi
	rename (B84VAAOctobre2019 B84VAROctobre2019) (yf_10_19 mmr_10_19)
	drop B84VAR1RR1Octobre2019 B84VAR2RR2Octobre2019
	rename (B84VPIOctobre2019-B84VPO3Octobre2019) (ipv1_10_19 ipv2_10_19 opv0_10_19 ///
	opv1_10_19 opv2_10_19 opv3_10_19)
	merge 1:1 org* using "$user/RAW DATA/DRC/DHIS2/2019/DHIS2_2019"
	drop _merge
	save "$user/RAW DATA/DRC/DHIS2/2019/DHIS2_2019.dta", replace
* Nov	
	import excel using "$user/RAW DATA/DRC/DHIS2/2019/Novembre 2019.xls", firstrow clear
	duplicates tag org*, g(tag)
	egen sum=rowtotal(B84BCGNovembre2019-B84VPO3Novembre2019) if tag==1
	drop if tag==1 & sum==0
	drop tag sum
	rename (PopulationdelAiredeSantéNo-B84PCV133Novembre2019) (popaire_11_19 bcg_11_19 penta1_11_19 penta2_11_19 ///
	penta3_11_19 fullvax_11_19 pcv1_11_19 pcv2_11_19 pcv3_11_19)
	egen rota1_11_19=rowtotal(B84Rota10et11moisAvanc-B84Rota112et23moisMobi)
	egen rota2_11_19=rowtotal(B84Rota20et11moisAvanc-B84Rota212et23moisMobi)
	egen rota3_11_19=rowtotal(B84Rota30et11moisAvanc-B84Rota312et23moisMobi)
	drop B84Rota10et11moisAvanc-B84Rota312et23moisMobi
	rename (B84VAANovembre2019 B84VARNovembre2019) (yf_11_19 mmr_11_19)
	drop B84VAR1RR1Novembre2019 B84VAR2RR2Novembre2019
	rename (B84VPINovembre2019-B84VPO3Novembre2019) (ipv1_11_19 ipv2_11_19 opv0_11_19 ///
	opv1_11_19 opv2_11_19 opv3_11_19)
	merge 1:1 org* using "$user/RAW DATA/DRC/DHIS2/2019/DHIS2_2019"
	drop _merge
	save "$user/RAW DATA/DRC/DHIS2/2019/DHIS2_2019.dta", replace
*Dec	
	import excel using "$user/RAW DATA/DRC/DHIS2/2019/Décembre 2019.xls", firstrow clear
	duplicates tag org*, g(tag)
	egen sum=rowtotal(B84BCGDécembre2019-B84VPO3Décembre2019) if tag==1
	drop if tag==1 & sum==0
	drop tag sum 
	rename (PopulationdelAiredeSantéDé-B84PCV133Décembre2019) (popaire_12_19 bcg_12_19 penta1_12_19 penta2_12_19 ///
	penta3_12_19 fullvax_12_19 pcv1_12_19 pcv2_12_19 pcv3_12_19)
	egen rota1_12_19=rowtotal(B84Rota10et11moisAvanc-B84Rota112et23moisMobi)
	egen rota2_12_19=rowtotal(B84Rota20et11moisAvanc-B84Rota212et23moisMobi)
	egen rota3_12_19=rowtotal(B84Rota30et11moisAvanc-B84Rota312et23moisMobi)
	drop B84Rota10et11moisAvanc-B84Rota312et23moisMobi
	rename (B84VAADécembre2019 B84VARDécembre2019) (yf_12_19 mmr_12_19)
	drop B84VAR1RR1Décembre2019 B84VAR2RR2Décembre2019
	rename (B84VPIDécembre2019-B84VPO3Décembre2019) (ipv1_12_19 ipv2_12_19 opv0_12_19 ///
	opv1_12_19 opv2_12_19 opv3_12_19)
	merge 1:1 org* using "$user/RAW DATA/DRC/DHIS2/2019/DHIS2_2019"
	drop _merge
	save "$user/RAW DATA/DRC/DHIS2/2019/DHIS2_2019.dta", replace

*------------------------------------------------------------------------------	
* IDENTIFYING AND REMOVING OUTLIERS
/* Outliers are defined as observations that are greater than 3 SD from the mean over the year
 and are volumes larger than 100 clients. */
global all bcg_ penta1_ penta2_ penta3_ fullvax_ pcv1_ pcv2_ pcv3_ yf_ mmr_ ipv1_ ///
		   ipv2_ opv0_ opv1_ opv2_ opv3_ rota1_ rota2_ rota3_
		   
foreach x of global all {
	egen rowmean`x'= rowmean(`x'*)
	egen rowsd`x'= rowsd(`x'*)
	gen pos_out`x' = rowmean`x'+(3*(rowsd`x')) // positive threshold
		
		foreach v in 1_19 2_19 3_19 4_19 5_19 6_19 7_19 8_19 9_19 10_19 11_19 12_19  { 
			gen flag_outlier`x'`v'= 1 if `x'`v'>pos_out`x' & `x'`v'<. 
			replace flag_outlier`x'`v' =. if `x'`v' <100 // replaces flag to . if volument < 100
			replace `x'`v'=. if flag_outlier`x'`v'==1 // replaces value to missing if flag is 1
	}
	drop rowmean`x' rowsd`x' pos_out`x'  flag_outlier`x'* 
}
	save "$user/RAW DATA/DRC/DHIS2/2019/DHIS2_2019.dta", replace
















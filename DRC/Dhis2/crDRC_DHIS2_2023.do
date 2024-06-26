*-------------------------------------------------------------------------------
* 2023
	import excel using "$user/RAW DATA/DRC/DHIS2/2023/Janvier 2023.xls", firstrow clear
	duplicates tag org*, g(tag)
	egen sum=rowtotal(B84BCGJanvier2023-B84VPO3Janvier2023) if tag==1
	drop if tag==1 & sum==0
	drop tag sum 
	rename (PopulationdelAiredeSantéJa-B84PCV133Janvier2023) (popaire_1_23 bcg_1_23 penta1_1_23 penta2_1_23 ///
	penta3_1_23 fullvax_1_23 pcv1_1_23 pcv2_1_23 pcv3_1_23)
	egen rota1_1_23=rowtotal(B84Rota10et11moisAvanc-B84Rota112et23moisMobi)
	egen rota2_1_23=rowtotal(B84Rota20et11moisAvanc-B84Rota212et23moisMobi)
	egen rota3_1_23=rowtotal(B84Rota30et11moisAvanc-B84Rota312et23moisMobi)
	drop B84Rota10et11moisAvanc-B84Rota312et23moisMobi
	rename (B84VAAJanvier2023 B84VARJanvier2023) (yf_1_23 mmr_1_23)
	drop B84VAR1RR1Janvier2023 B84VAR2RR2Janvier2023
	rename (B84VPIJanvier2023-B84VPO3Janvier2023) (ipv1_1_23 ipv2_1_23 opv0_1_23 ///
	opv1_1_23 opv2_1_23 opv3_1_23)
save "$user/RAW DATA/DRC/DHIS2/2023/DHIS2_2023.dta", replace

	import excel using "$user/RAW DATA/DRC/DHIS2/2023/Février 2023.xls", firstrow clear
	duplicates tag org*, g(tag)
	egen sum=rowtotal(B84BCGFévrier2023-B84VPO3Février2023) if tag==1
	drop if tag==1 & sum==0
	drop tag sum 
		rename (PopulationdelAiredeSantéFé-B84PCV133Février2023) (popaire_2_23 bcg_2_23 penta1_2_23 penta2_2_23 ///
	penta3_2_23 fullvax_2_23 pcv1_2_23 pcv2_2_23 pcv3_2_23)
	egen rota1_2_23=rowtotal(B84Rota10et11moisAvanc-B84Rota112et23moisMobi)
	egen rota2_2_23=rowtotal(B84Rota20et11moisAvanc-B84Rota212et23moisMobi)
	egen rota3_2_23=rowtotal(B84Rota30et11moisAvanc-B84Rota312et23moisMobi)
		drop B84Rota10et11moisAvanc-B84Rota312et23moisMobi
	rename (B84VAAFévrier2023 B84VARFévrier2023) (yf_2_23 mmr_2_23)
		drop B84VAR1RR1Février2023 B84VAR2RR2Février2023
	rename (B84VPIFévrier2023-B84VPO3Février2023) (ipv1_2_23 ipv2_2_23 opv0_2_23 ///
	opv1_2_23 opv2_2_23 opv3_2_23)
	merge 1:1 org* using "$user/RAW DATA/DRC/DHIS2/2023/DHIS2_2023"
	drop _merge
	save "$user/RAW DATA/DRC/DHIS2/2023/DHIS2_2023.dta", replace

	
	import excel using "$user/RAW DATA/DRC/DHIS2/2023/Mars 2023.xls", firstrow clear
	duplicates tag org*, g(tag)
	egen sum=rowtotal(B84BCGMars2023-B84VPO3Mars2023) if tag==1
	drop if tag==1 & sum==0
	drop tag sum 
	rename (PopulationdelAiredeSantéMa-B84PCV133Mars2023) (popaire_3_23 bcg_3_23 penta1_3_23 penta2_3_23 ///
	penta3_3_23 fullvax_3_23 pcv1_3_23 pcv2_3_23 pcv3_3_23)
	egen rota1_3_23=rowtotal(B84Rota10et11moisAvanc-B84Rota112et23moisMobi)
	egen rota2_3_23=rowtotal(B84Rota20et11moisAvanc-B84Rota212et23moisMobi)
	egen rota3_3_23=rowtotal(B84Rota30et11moisAvanc-B84Rota312et23moisMobi)
	drop B84Rota10et11moisAvanc-B84Rota312et23moisMobi
	rename (B84VAAMars2023 B84VARMars2023) (yf_3_23 mmr_3_23)
	drop B84VAR1RR1Mars2023 B84VAR2RR2Mars2023
	rename (B84VPIMars2023-B84VPO3Mars2023) (ipv1_3_23 ipv2_3_23 opv0_3_23 ///
	opv1_3_23 opv2_3_23 opv3_3_23)
	merge 1:1 org* using "$user/RAW DATA/DRC/DHIS2/2023/DHIS2_2023"
	drop _merge
	save "$user/RAW DATA/DRC/DHIS2/2023/DHIS2_2023.dta", replace

	
	import excel using "$user/RAW DATA/DRC/DHIS2/2023/Avril 2023.xls", firstrow clear
	duplicates tag org*, g(tag)
	egen sum=rowtotal(B84BCGAvril2023-B84VPO3Avril2023) if tag==1
	drop if tag==1 & sum==0
	drop tag sum 
		rename (PopulationdelAiredeSantéAv-B84PCV133Avril2023) (popaire_4_23 bcg_4_23 penta1_4_23 penta2_4_23 ///
	penta3_4_23 fullvax_4_23 pcv1_4_23 pcv2_4_23 pcv3_4_23)
	egen rota1_4_23=rowtotal(B84Rota10et11moisAvanc-B84Rota112et23moisMobi)
	egen rota2_4_23=rowtotal(B84Rota20et11moisAvanc-B84Rota212et23moisMobi)
	egen rota3_4_23=rowtotal(B84Rota30et11moisAvanc-B84Rota312et23moisMobi)
	drop B84Rota10et11moisAvanc-B84Rota312et23moisMobi
	rename (B84VAAAvril2023 B84VARAvril2023) (yf_4_23 mmr_4_23)
	drop B84VAR1RR1Avril2023 B84VAR2RR2Avril2023
	rename (B84VPIAvril2023-B84VPO3Avril2023) (ipv1_4_23 ipv2_4_23 opv0_4_23 ///
	opv1_4_23 opv2_4_23 opv3_4_23)
	merge 1:1 org* using "$user/RAW DATA/DRC/DHIS2/2023/DHIS2_2023"
	drop _merge
	save "$user/RAW DATA/DRC/DHIS2/2023/DHIS2_2023.dta", replace

	
	import excel using "$user/RAW DATA/DRC/DHIS2/2023/Mai 2023.xls", firstrow clear
	duplicates tag org*, g(tag)
	egen sum=rowtotal(B84BCGMai2023-B84VPO3Mai2023) if tag==1
	drop if tag==1 & sum==0
	drop tag sum 
		rename (PopulationdelAiredeSantéMa-B84PCV133Mai2023) (popaire_5_23 bcg_5_23 penta1_5_23 penta2_5_23 ///
	penta3_5_23 fullvax_5_23 pcv1_5_23 pcv2_5_23 pcv3_5_23)
	egen rota1_5_23=rowtotal(B84Rota10et11moisAvanc-B84Rota112et23moisMobi)
	egen rota2_5_23=rowtotal(B84Rota20et11moisAvanc-B84Rota212et23moisMobi)
	egen rota3_5_23=rowtotal(B84Rota30et11moisAvanc-B84Rota312et23moisMobi)
	drop B84Rota10et11moisAvanc-B84Rota312et23moisMobi
	rename (B84VAAMai2023 B84VARMai2023) (yf_5_23 mmr_5_23)
	drop B84VAR1RR1Mai2023 B84VAR2RR2Mai2023
	rename (B84VPIMai2023-B84VPO3Mai2023) (ipv1_5_23 ipv2_5_23 opv0_5_23 ///
	opv1_5_23 opv2_5_23 opv3_5_23)
	merge 1:1 org* using "$user/RAW DATA/DRC/DHIS2/2023/DHIS2_2023"
	drop _merge
	save "$user/RAW DATA/DRC/DHIS2/2023/DHIS2_2023.dta", replace

	
	import excel using "$user/RAW DATA/DRC/DHIS2/2023/Juin 2023.xls", firstrow clear
	duplicates tag org*, g(tag)
	egen sum=rowtotal(B84BCGJuin2023-B84VPO3Juin2023) if tag==1
	drop if tag==1 & sum==0
	drop tag sum 
	rename (PopulationdelAiredeSantéJu-B84PCV133Juin2023) (popaire_6_23 bcg_6_23 penta1_6_23 penta2_6_23 ///
	penta3_6_23 fullvax_6_23 pcv1_6_23 pcv2_6_23 pcv3_6_23)
	egen rota1_6_23=rowtotal(B84Rota10et11moisAvanc-B84Rota112et23moisMobi)
	egen rota2_6_23=rowtotal(B84Rota20et11moisAvanc-B84Rota212et23moisMobi)
	egen rota3_6_23=rowtotal(B84Rota30et11moisAvanc-B84Rota312et23moisMobi)
	drop B84Rota10et11moisAvanc-B84Rota312et23moisMobi
	rename (B84VAAJuin2023 B84VARJuin2023) (yf_6_23 mmr_6_23)
	drop B84VAR1RR1Juin2023 B84VAR2RR2Juin2023
	rename (B84VPIJuin2023-B84VPO3Juin2023) (ipv1_6_23 ipv2_6_23 opv0_6_23 ///
	opv1_6_23 opv2_6_23 opv3_6_23)
	merge 1:1 org* using "$user/RAW DATA/DRC/DHIS2/2023/DHIS2_2023"
	drop _merge
	save "$user/RAW DATA/DRC/DHIS2/2023/DHIS2_2023.dta", replace

	
	import excel using "$user/RAW DATA/DRC/DHIS2/2023/Juillet 2023.xls", firstrow clear
	duplicates tag org*, g(tag)
	egen sum=rowtotal(B84BCGJuillet2023-B84VPO3Juillet2023) if tag==1
	drop if tag==1 & sum==0
	drop tag sum 
	rename (PopulationdelAiredeSantéJu-B84PCV133Juillet2023) (popaire_7_23 bcg_7_23 penta1_7_23 penta2_7_23 ///
	penta3_7_23 fullvax_7_23 pcv1_7_23 pcv2_7_23 pcv3_7_23)
	egen rota1_7_23=rowtotal(B84Rota10et11moisAvanc-B84Rota112et23moisMobi)
	egen rota2_7_23=rowtotal(B84Rota20et11moisAvanc-B84Rota212et23moisMobi)
	egen rota3_7_23=rowtotal(B84Rota30et11moisAvanc-B84Rota312et23moisMobi)
	drop B84Rota10et11moisAvanc-B84Rota312et23moisMobi
	rename (B84VAAJuillet2023 B84VARJuillet2023) (yf_7_23 mmr_7_23)
	drop B84VAR1RR1Juillet2023 B84VAR2RR2Juillet2023
	rename (B84VPIJuillet2023-B84VPO3Juillet2023) (ipv1_7_23 ipv2_7_23 opv0_7_23 ///
	opv1_7_23 opv2_7_23 opv3_7_23)

	merge 1:1 org* using "$user/RAW DATA/DRC/DHIS2/2023/DHIS2_2023"
	drop _merge
	save "$user/RAW DATA/DRC/DHIS2/2023/DHIS2_2023.dta", replace

	
	import excel using "$user/RAW DATA/DRC/DHIS2/2023/Août 2023.xls", firstrow clear
	duplicates tag org*, g(tag)
	egen sum=rowtotal(B84BCGAoût2023-B84VPO3Août2023) if tag==1
	drop if tag==1 & sum==0
	drop tag sum 
		rename (PopulationdelAiredeSantéAo-B84PCV133Août2023) (popaire_8_23 bcg_8_23 penta1_8_23 penta2_8_23 ///
	penta3_8_23 fullvax_8_23 pcv1_8_23 pcv2_8_23 pcv3_8_23)
	egen rota1_8_23=rowtotal(B84Rota10et11moisAvanc-B84Rota112et23moisMobi)
	egen rota2_8_23=rowtotal(B84Rota20et11moisAvanc-B84Rota212et23moisMobi)
	egen rota3_8_23=rowtotal(B84Rota30et11moisAvanc-B84Rota312et23moisMobi)
	drop B84Rota10et11moisAvanc-B84Rota312et23moisMobi
	rename (B84VAAAoût2023 B84VARAoût2023) (yf_8_23 mmr_8_23)
	drop B84VAR1RR1Août2023 B84VAR2RR2Août2023
	rename (B84VPIAoût2023-B84VPO3Août2023) (ipv1_8_23 ipv2_8_23 opv0_8_23 ///
	opv1_8_23 opv2_8_23 opv3_8_23)
	merge 1:1 org* using "$user/RAW DATA/DRC/DHIS2/2023/DHIS2_2023"
	drop _merge
	save "$user/RAW DATA/DRC/DHIS2/2023/DHIS2_2023.dta", replace

	
	import excel using "$user/RAW DATA/DRC/DHIS2/2023/Septembre 2023.xls", firstrow clear
	duplicates tag org*, g(tag)
	egen sum=rowtotal(B84BCGSeptembre2023-B84VPO3Septembre2023) if tag==1
	drop if tag==1 & sum==0
	drop tag sum 
		rename (PopulationdelAiredeSantéSe-B84PCV133Septembre2023) (popaire_9_23 bcg_9_23 penta1_9_23 penta2_9_23 ///
	penta3_9_23 fullvax_9_23 pcv1_9_23 pcv2_9_23 pcv3_9_23)
	egen rota1_9_23=rowtotal(B84Rota10et11moisAvanc-B84Rota112et23moisMobi)
	egen rota2_9_23=rowtotal(B84Rota20et11moisAvanc-B84Rota212et23moisMobi)
	egen rota3_9_23=rowtotal(B84Rota30et11moisAvanc-B84Rota312et23moisMobi)
	drop B84Rota10et11moisAvanc-B84Rota312et23moisMobi
	rename (B84VAASeptembre2023 B84VARSeptembre2023) (yf_9_23 mmr_9_23)
	drop B84VAR1RR1Septembre2023 B84VAR2RR2Septembre2023
	rename (B84VPISeptembre2023-B84VPO3Septembre2023) (ipv1_9_23 ipv2_9_23 opv0_9_23 ///
	opv1_9_23 opv2_9_23 opv3_9_23)
	merge 1:1 org* using "$user/RAW DATA/DRC/DHIS2/2023/DHIS2_2023"
	drop _merge
	save "$user/RAW DATA/DRC/DHIS2/2023/DHIS2_2023.dta", replace

	
	import excel using "$user/RAW DATA/DRC/DHIS2/2023/Octobre 2023.xls", firstrow clear
	duplicates tag org*, g(tag)
	egen sum=rowtotal(B84BCGOctobre2023-B84VPO3Octobre2023) if tag==1
	drop if tag==1 & sum==0
	drop tag sum 
		rename (PopulationdelAiredeSantéOc-B84PCV133Octobre2023) (popaire_10_23 bcg_10_23 penta1_10_23 penta2_10_23 ///
	penta3_10_23 fullvax_10_23 pcv1_10_23 pcv2_10_23 pcv3_10_23)
	egen rota1_10_23=rowtotal(B84Rota10et11moisAvanc-B84Rota112et23moisMobi)
	egen rota2_10_23=rowtotal(B84Rota20et11moisAvanc-B84Rota212et23moisMobi)
	egen rota3_10_23=rowtotal(B84Rota30et11moisAvanc-B84Rota312et23moisMobi)
	drop B84Rota10et11moisAvanc-B84Rota312et23moisMobi
	rename (B84VAAOctobre2023 B84VAROctobre2023) (yf_10_23 mmr_10_23)
	drop B84VAR1RR1Octobre2023 B84VAR2RR2Octobre2023
	rename (B84VPIOctobre2023-B84VPO3Octobre2023) (ipv1_10_23 ipv2_10_23 opv0_10_23 ///
	opv1_10_23 opv2_10_23 opv3_10_23)
	merge 1:1 org* using "$user/RAW DATA/DRC/DHIS2/2023/DHIS2_2023"
	drop _merge
	save "$user/RAW DATA/DRC/DHIS2/2023/DHIS2_2023.dta", replace

	
	import excel using "$user/RAW DATA/DRC/DHIS2/2023/Novembre 2023.xls", firstrow clear
	duplicates tag org*, g(tag)
	egen sum=rowtotal(B84BCGNovembre2023-B84VPO3Novembre2023) if tag==1
	drop if tag==1 & sum==0
	drop tag sum 
	rename (PopulationdelAiredeSantéNo-B84PCV133Novembre2023) (popaire_11_23 bcg_11_23 penta1_11_23 penta2_11_23 ///
	penta3_11_23 fullvax_11_23 pcv1_11_23 pcv2_11_23 pcv3_11_23)
	egen rota1_11_23=rowtotal(B84Rota10et11moisAvanc-B84Rota112et23moisMobi)
	egen rota2_11_23=rowtotal(B84Rota20et11moisAvanc-B84Rota212et23moisMobi)
	egen rota3_11_23=rowtotal(B84Rota30et11moisAvanc-B84Rota312et23moisMobi)
	drop B84Rota10et11moisAvanc-B84Rota312et23moisMobi
	rename (B84VAANovembre2023 B84VARNovembre2023) (yf_11_23 mmr_11_23)
	drop B84VAR1RR1Novembre2023 B84VAR2RR2Novembre2023
	rename (B84VPINovembre2023-B84VPO3Novembre2023) (ipv1_11_23 ipv2_11_23 opv0_11_23 ///
	opv1_11_23 opv2_11_23 opv3_11_23)
	merge 1:1 org* using "$user/RAW DATA/DRC/DHIS2/2023/DHIS2_2023"
	drop _merge
	save "$user/RAW DATA/DRC/DHIS2/2023/DHIS2_2023.dta", replace

	
	import excel using "$user/RAW DATA/DRC/DHIS2/2023/Décembre 2023.xls", firstrow clear
	duplicates tag org*, g(tag)
	egen sum=rowtotal(B84BCGDécembre2023-B84VPO3Décembre2023) if tag==1
	drop if tag==1 & sum==0
	drop tag sum 
		rename (PopulationdelAiredeSantéDé-B84PCV133Décembre2023) (popaire_12_23 bcg_12_23 penta1_12_23 penta2_12_23 ///
	penta3_12_23 fullvax_12_23 pcv1_12_23 pcv2_12_23 pcv3_12_23)
	egen rota1_12_23=rowtotal(B84Rota10et11moisAvanc-B84Rota112et23moisMobi)
	egen rota2_12_23=rowtotal(B84Rota20et11moisAvanc-B84Rota212et23moisMobi)
	egen rota3_12_23=rowtotal(B84Rota30et11moisAvanc-B84Rota312et23moisMobi)
	drop B84Rota10et11moisAvanc-B84Rota312et23moisMobi
	rename (B84VAADécembre2023 B84VARDécembre2023) (yf_12_23 mmr_12_23)
	drop B84VAR1RR1Décembre2023 B84VAR2RR2Décembre2023
	rename (B84VPIDécembre2023-B84VPO3Décembre2023) (ipv1_12_23 ipv2_12_23 opv0_12_23 ///
	opv1_12_23 opv2_12_23 opv3_12_23)
	merge 1:1 org* using "$user/RAW DATA/DRC/DHIS2/2023/DHIS2_2023"
	drop _merge
	save "$user/RAW DATA/DRC/DHIS2/2023/DHIS2_2023.dta", replace
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
		
		foreach v in 1_23 2_23 3_23 4_23 5_23 6_23 7_23 8_23 9_23 10_23 11_23 12_23  { 
			gen flag_outlier`x'`v'= 1 if `x'`v'>pos_out`x' & `x'`v'<. 
			replace flag_outlier`x'`v' =. if `x'`v' <100 // replaces flag to . if volument < 100
			replace `x'`v'=. if flag_outlier`x'`v'==1 // replaces value to missing if flag is 1
	}
	drop rowmean`x' rowsd`x' pos_out`x'  flag_outlier`x'* 
}
	save "$user/RAW DATA/DRC/DHIS2/2023/DHIS2_2023.dta", replace


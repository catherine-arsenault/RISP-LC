*-------------------------------------------------------------------------------
* 2022
	import excel using "$user/RAW DATA/DRC/DHIS2/2022/Janvier 2022.xls", firstrow clear
	duplicates tag org*, g(tag)
	egen sum=rowtotal(B84BCGJanvier2022-B84VPO3Janvier2022) if tag==1
	drop if tag==1 & sum==0
	drop tag sum 
	rename (PopulationdelAiredeSantéJa-B84PCV133Janvier2022) (popaire_1_22 bcg_1_22 penta1_1_22 penta2_1_22 ///
	penta3_1_22 fullvax_1_22 pcv1_1_22 pcv2_1_22 pcv3_1_22)
	egen rota1_1_22=rowtotal(B84Rota10et11moisAvanc-B84Rota112et23moisMobi)
	egen rota2_1_22=rowtotal(B84Rota20et11moisAvanc-B84Rota212et23moisMobi)
	egen rota3_1_22=rowtotal(B84Rota30et11moisAvanc-B84Rota312et23moisMobi)
	drop B84Rota10et11moisAvanc-B84Rota312et23moisMobi
	rename (B84VAAJanvier2022 B84VARJanvier2022) (yf_1_22 mmr_1_22)
	drop B84VAR1RR1Janvier2022 B84VAR2RR2Janvier2022
	rename (B84VPIJanvier2022-B84VPO3Janvier2022) (ipv1_1_22 ipv2_1_22 opv0_1_22 ///
	opv1_1_22 opv2_1_22 opv3_1_22)
save "$user/RAW DATA/DRC/DHIS2/2022/DHIS2_2022.dta", replace

	import excel using "$user/RAW DATA/DRC/DHIS2/2022/Février 2022.xls", firstrow clear
	duplicates tag org*, g(tag)
	egen sum=rowtotal(B84BCGFévrier2022-B84VPO3Février2022) if tag==1
	drop if tag==1 & sum==0
	drop tag sum 
		rename (PopulationdelAiredeSantéFé-B84PCV133Février2022) (popaire_2_22 bcg_2_22 penta1_2_22 penta2_2_22 ///
	penta3_2_22 fullvax_2_22 pcv1_2_22 pcv2_2_22 pcv3_2_22)
	egen rota1_2_22=rowtotal(B84Rota10et11moisAvanc-B84Rota112et23moisMobi)
	egen rota2_2_22=rowtotal(B84Rota20et11moisAvanc-B84Rota212et23moisMobi)
	egen rota3_2_22=rowtotal(B84Rota30et11moisAvanc-B84Rota312et23moisMobi)
		drop B84Rota10et11moisAvanc-B84Rota312et23moisMobi
	rename (B84VAAFévrier2022 B84VARFévrier2022) (yf_2_22 mmr_2_22)
		drop B84VAR1RR1Février2022 B84VAR2RR2Février2022
	rename (B84VPIFévrier2022-B84VPO3Février2022) (ipv1_2_22 ipv2_2_22 opv0_2_22 ///
	opv1_2_22 opv2_2_22 opv3_2_22)
	merge 1:1 org* using "$user/RAW DATA/DRC/DHIS2/2022/DHIS2_2022"
	drop _merge
	save "$user/RAW DATA/DRC/DHIS2/2022/DHIS2_2022.dta", replace

	import excel using "$user/RAW DATA/DRC/DHIS2/2022/Mars 2022.xls", firstrow clear
	duplicates tag org*, g(tag)
	egen sum=rowtotal(B84BCGMars2022-B84VPO3Mars2022) if tag==1
	drop if tag==1 & sum==0
	drop tag sum 
		rename (PopulationdelAiredeSantéMa-B84PCV133Mars2022) (popaire_3_22 bcg_3_22 penta1_3_22 penta2_3_22 ///
	penta3_3_22 fullvax_3_22 pcv1_3_22 pcv2_3_22 pcv3_3_22)
	egen rota1_3_22=rowtotal(B84Rota10et11moisAvanc-B84Rota112et23moisMobi)
	egen rota2_3_22=rowtotal(B84Rota20et11moisAvanc-B84Rota212et23moisMobi)
	egen rota3_3_22=rowtotal(B84Rota30et11moisAvanc-B84Rota312et23moisMobi)
	drop B84Rota10et11moisAvanc-B84Rota312et23moisMobi
	rename (B84VAAMars2022 B84VARMars2022) (yf_3_22 mmr_3_22)
	drop B84VAR1RR1Mars2022 B84VAR2RR2Mars2022
	rename (B84VPIMars2022-B84VPO3Mars2022) (ipv1_3_22 ipv2_3_22 opv0_3_22 ///
	opv1_3_22 opv2_3_22 opv3_3_22)
	merge 1:1 org* using "$user/RAW DATA/DRC/DHIS2/2022/DHIS2_2022"
	drop _merge
	save "$user/RAW DATA/DRC/DHIS2/2022/DHIS2_2022.dta", replace

	import excel using "$user/RAW DATA/DRC/DHIS2/2022/Avril 2022.xls", firstrow clear
	duplicates tag org*, g(tag)
	egen sum=rowtotal(B84BCGAvril2022-B84VPO3Avril2022) if tag==1
	drop if tag==1 & sum==0
	drop tag sum 
		rename (PopulationdelAiredeSantéAv-B84PCV133Avril2022) (popaire_4_22 bcg_4_22 penta1_4_22 penta2_4_22 ///
	penta3_4_22 fullvax_4_22 pcv1_4_22 pcv2_4_22 pcv3_4_22)
	egen rota1_4_22=rowtotal(B84Rota10et11moisAvanc-B84Rota112et23moisMobi)
	egen rota2_4_22=rowtotal(B84Rota20et11moisAvanc-B84Rota212et23moisMobi)
	egen rota3_4_22=rowtotal(B84Rota30et11moisAvanc-B84Rota312et23moisMobi)
	drop B84Rota10et11moisAvanc-B84Rota312et23moisMobi
	rename (B84VAAAvril2022 B84VARAvril2022) (yf_4_22 mmr_4_22)
	drop B84VAR1RR1Avril2022 B84VAR2RR2Avril2022
	rename (B84VPIAvril2022-B84VPO3Avril2022) (ipv1_4_22 ipv2_4_22 opv0_4_22 ///
	opv1_4_22 opv2_4_22 opv3_4_22)
	merge 1:1 org* using "$user/RAW DATA/DRC/DHIS2/2022/DHIS2_2022"
	drop _merge
	save "$user/RAW DATA/DRC/DHIS2/2022/DHIS2_2022.dta", replace

	import excel using "$user/RAW DATA/DRC/DHIS2/2022/Mai 2022.xls", firstrow clear
	duplicates tag org*, g(tag)
	egen sum=rowtotal(B84BCGMai2022-B84VPO3Mai2022) if tag==1
	drop if tag==1 & sum==0
	drop tag sum 
		rename (PopulationdelAiredeSantéMa-B84PCV133Mai2022) (popaire_5_22 bcg_5_22 penta1_5_22 penta2_5_22 ///
	penta3_5_22 fullvax_5_22 pcv1_5_22 pcv2_5_22 pcv3_5_22)
	egen rota1_5_22=rowtotal(B84Rota10et11moisAvanc-B84Rota112et23moisMobi)
	egen rota2_5_22=rowtotal(B84Rota20et11moisAvanc-B84Rota212et23moisMobi)
	egen rota3_5_22=rowtotal(B84Rota30et11moisAvanc-B84Rota312et23moisMobi)
	drop B84Rota10et11moisAvanc-B84Rota312et23moisMobi
	rename (B84VAAMai2022 B84VARMai2022) (yf_5_22 mmr_5_22)
	drop B84VAR1RR1Mai2022 B84VAR2RR2Mai2022
	rename (B84VPIMai2022-B84VPO3Mai2022) (ipv1_5_22 ipv2_5_22 opv0_5_22 ///
	opv1_5_22 opv2_5_22 opv3_5_22)
	merge 1:1 org* using "$user/RAW DATA/DRC/DHIS2/2022/DHIS2_2022"
	drop _merge
	save "$user/RAW DATA/DRC/DHIS2/2022/DHIS2_2022.dta", replace

	import excel using "$user/RAW DATA/DRC/DHIS2/2022/Juin 2022.xls", firstrow clear
	duplicates tag org*, g(tag)
	egen sum=rowtotal(B84BCGJuin2022-B84VPO3Juin2022) if tag==1
	drop if tag==1 & sum==0
	drop tag sum 
		rename (PopulationdelAiredeSantéJu-B84PCV133Juin2022) (popaire_6_22 bcg_6_22 penta1_6_22 penta2_6_22 ///
	penta3_6_22 fullvax_6_22 pcv1_6_22 pcv2_6_22 pcv3_6_22)
	egen rota1_6_22=rowtotal(B84Rota10et11moisAvanc-B84Rota112et23moisMobi)
	egen rota2_6_22=rowtotal(B84Rota20et11moisAvanc-B84Rota212et23moisMobi)
	egen rota3_6_22=rowtotal(B84Rota30et11moisAvanc-B84Rota312et23moisMobi)
	drop B84Rota10et11moisAvanc-B84Rota312et23moisMobi
	rename (B84VAAJuin2022 B84VARJuin2022) (yf_6_22 mmr_6_22)
	drop B84VAR1RR1Juin2022 B84VAR2RR2Juin2022
	rename (B84VPIJuin2022-B84VPO3Juin2022) (ipv1_6_22 ipv2_6_22 opv0_6_22 ///
	opv1_6_22 opv2_6_22 opv3_6_22)
	merge 1:1 org* using "$user/RAW DATA/DRC/DHIS2/2022/DHIS2_2022"
	drop _merge
	save "$user/RAW DATA/DRC/DHIS2/2022/DHIS2_2022.dta", replace

	import excel using "$user/RAW DATA/DRC/DHIS2/2022/Juillet 2022.xls", firstrow clear
	duplicates tag org*, g(tag)
	egen sum=rowtotal(B84BCGJuillet2022-B84VPO3Juillet2022) if tag==1
	drop if tag==1 & sum==0
	drop tag sum 
	rename (PopulationdelAiredeSantéJu-B84PCV133Juillet2022) (popaire_7_22 bcg_7_22 penta1_7_22 penta2_7_22 ///
	penta3_7_22 fullvax_7_22 pcv1_7_22 pcv2_7_22 pcv3_7_22)
	egen rota1_7_22=rowtotal(B84Rota10et11moisAvanc-B84Rota112et23moisMobi)
	egen rota2_7_22=rowtotal(B84Rota20et11moisAvanc-B84Rota212et23moisMobi)
	egen rota3_7_22=rowtotal(B84Rota30et11moisAvanc-B84Rota312et23moisMobi)
	drop B84Rota10et11moisAvanc-B84Rota312et23moisMobi
	rename (B84VAAJuillet2022 B84VARJuillet2022) (yf_7_22 mmr_7_22)
	drop B84VAR1RR1Juillet2022 B84VAR2RR2Juillet2022
	rename (B84VPIJuillet2022-B84VPO3Juillet2022) (ipv1_7_22 ipv2_7_22 opv0_7_22 ///
	opv1_7_22 opv2_7_22 opv3_7_22)
	merge 1:1 org* using "$user/RAW DATA/DRC/DHIS2/2022/DHIS2_2022"
	drop _merge
	save "$user/RAW DATA/DRC/DHIS2/2022/DHIS2_2022.dta", replace

	import excel using "$user/RAW DATA/DRC/DHIS2/2022/Août 2022.xls", firstrow clear
	duplicates tag org*, g(tag)
	egen sum=rowtotal(B84BCGAoût2022-B84VPO3Août2022) if tag==1
	drop if tag==1 & sum==0
	drop tag sum 
		rename (PopulationdelAiredeSantéAo-B84PCV133Août2022) (popaire_8_22 bcg_8_22 penta1_8_22 penta2_8_22 ///
	penta3_8_22 fullvax_8_22 pcv1_8_22 pcv2_8_22 pcv3_8_22)
	egen rota1_8_22=rowtotal(B84Rota10et11moisAvanc-B84Rota112et23moisMobi)
	egen rota2_8_22=rowtotal(B84Rota20et11moisAvanc-B84Rota212et23moisMobi)
	egen rota3_8_22=rowtotal(B84Rota30et11moisAvanc-B84Rota312et23moisMobi)
	drop B84Rota10et11moisAvanc-B84Rota312et23moisMobi
	rename (B84VAAAoût2022 B84VARAoût2022) (yf_8_22 mmr_8_22)
	drop B84VAR1RR1Août2022 B84VAR2RR2Août2022
	rename (B84VPIAoût2022-B84VPO3Août2022) (ipv1_8_22 ipv2_8_22 opv0_8_22 ///
	opv1_8_22 opv2_8_22 opv3_8_22)
	merge 1:1 org* using "$user/RAW DATA/DRC/DHIS2/2022/DHIS2_2022"
	drop _merge
	save "$user/RAW DATA/DRC/DHIS2/2022/DHIS2_2022.dta", replace

	import excel using "$user/RAW DATA/DRC/DHIS2/2022/Septembre 2022.xls", firstrow clear
	duplicates tag org*, g(tag)
	egen sum=rowtotal(B84BCGSeptembre2022-B84VPO3Septembre2022) if tag==1
	drop if tag==1 & sum==0
	drop tag sum 
		rename (PopulationdelAiredeSantéSe-B84PCV133Septembre2022) (popaire_9_22 bcg_9_22 penta1_9_22 penta2_9_22 ///
	penta3_9_22 fullvax_9_22 pcv1_9_22 pcv2_9_22 pcv3_9_22)
	egen rota1_9_22=rowtotal(B84Rota10et11moisAvanc-B84Rota112et23moisMobi)
	egen rota2_9_22=rowtotal(B84Rota20et11moisAvanc-B84Rota212et23moisMobi)
	egen rota3_9_22=rowtotal(B84Rota30et11moisAvanc-B84Rota312et23moisMobi)
	drop B84Rota10et11moisAvanc-B84Rota312et23moisMobi
	rename (B84VAASeptembre2022 B84VARSeptembre2022) (yf_9_22 mmr_9_22)
	drop B84VAR1RR1Septembre2022 B84VAR2RR2Septembre2022
	rename (B84VPISeptembre2022-B84VPO3Septembre2022) (ipv1_9_22 ipv2_9_22 opv0_9_22 ///
	opv1_9_22 opv2_9_22 opv3_9_22)
	merge 1:1 org* using "$user/RAW DATA/DRC/DHIS2/2022/DHIS2_2022"
	drop _merge
	save "$user/RAW DATA/DRC/DHIS2/2022/DHIS2_2022.dta", replace

	import excel using "$user/RAW DATA/DRC/DHIS2/2022/Octobre 2022.xls", firstrow clear
	duplicates tag org*, g(tag)
	egen sum=rowtotal(B84BCGOctobre2022-B84VPO3Octobre2022) if tag==1
	drop if tag==1 & sum==0
	drop tag sum 
		rename (PopulationdelAiredeSantéOc-B84PCV133Octobre2022) (popaire_10_22 bcg_10_22 penta1_10_22 penta2_10_22 ///
	penta3_10_22 fullvax_10_22 pcv1_10_22 pcv2_10_22 pcv3_10_22)
	egen rota1_10_22=rowtotal(B84Rota10et11moisAvanc-B84Rota112et23moisMobi)
	egen rota2_10_22=rowtotal(B84Rota20et11moisAvanc-B84Rota212et23moisMobi)
	egen rota3_10_22=rowtotal(B84Rota30et11moisAvanc-B84Rota312et23moisMobi)
	drop B84Rota10et11moisAvanc-B84Rota312et23moisMobi
	rename (B84VAAOctobre2022 B84VAROctobre2022) (yf_10_22 mmr_10_22)
	drop B84VAR1RR1Octobre2022 B84VAR2RR2Octobre2022
	rename (B84VPIOctobre2022-B84VPO3Octobre2022) (ipv1_10_22 ipv2_10_22 opv0_10_22 ///
	opv1_10_22 opv2_10_22 opv3_10_22)
	merge 1:1 org* using "$user/RAW DATA/DRC/DHIS2/2022/DHIS2_2022"
	drop _merge
	save "$user/RAW DATA/DRC/DHIS2/2022/DHIS2_2022.dta", replace

	import excel using "$user/RAW DATA/DRC/DHIS2/2022/Novembre 2022.xls", firstrow clear
	duplicates tag org*, g(tag)
	egen sum=rowtotal(B84BCGNovembre2022-B84VPO3Novembre2022) if tag==1
	drop if tag==1 & sum==0
	drop tag sum 
		rename (PopulationdelAiredeSantéNo-B84PCV133Novembre2022) (popaire_11_22 bcg_11_22 penta1_11_22 penta2_11_22 ///
	penta3_11_22 fullvax_11_22 pcv1_11_22 pcv2_11_22 pcv3_11_22)
	egen rota1_11_22=rowtotal(B84Rota10et11moisAvanc-B84Rota112et23moisMobi)
	egen rota2_11_22=rowtotal(B84Rota20et11moisAvanc-B84Rota212et23moisMobi)
	egen rota3_11_22=rowtotal(B84Rota30et11moisAvanc-B84Rota312et23moisMobi)
	drop B84Rota10et11moisAvanc-B84Rota312et23moisMobi
	rename (B84VAANovembre2022 B84VARNovembre2022) (yf_11_22 mmr_11_22)
	drop B84VAR1RR1Novembre2022 B84VAR2RR2Novembre2022
	rename (B84VPINovembre2022-B84VPO3Novembre2022) (ipv1_11_22 ipv2_11_22 opv0_11_22 ///
	opv1_11_22 opv2_11_22 opv3_11_22)
	merge 1:1 org* using "$user/RAW DATA/DRC/DHIS2/2022/DHIS2_2022"
	drop _merge
	save "$user/RAW DATA/DRC/DHIS2/2022/DHIS2_2022.dta", replace

	import excel using "$user/RAW DATA/DRC/DHIS2/2022/Décembre 2022.xls", firstrow clear
	duplicates tag org*, g(tag)
	egen sum=rowtotal(B84BCGDécembre2022-B84VPO3Décembre2022) if tag==1
	drop if tag==1 & sum==0
	drop tag sum 
		rename (PopulationdelAiredeSantéDé-B84PCV133Décembre2022) (popaire_12_22 bcg_12_22 penta1_12_22 penta2_12_22 ///
	penta3_12_22 fullvax_12_22 pcv1_12_22 pcv2_12_22 pcv3_12_22)
	egen rota1_12_22=rowtotal(B84Rota10et11moisAvanc-B84Rota112et23moisMobi)
	egen rota2_12_22=rowtotal(B84Rota20et11moisAvanc-B84Rota212et23moisMobi)
	egen rota3_12_22=rowtotal(B84Rota30et11moisAvanc-B84Rota312et23moisMobi)
	drop B84Rota10et11moisAvanc-B84Rota312et23moisMobi
	rename (B84VAADécembre2022 B84VARDécembre2022) (yf_12_22 mmr_12_22)
	drop B84VAR1RR1Décembre2022 B84VAR2RR2Décembre2022
	rename (B84VPIDécembre2022-B84VPO3Décembre2022) (ipv1_12_22 ipv2_12_22 opv0_12_22 ///
	opv1_12_22 opv2_12_22 opv3_12_22)
	merge 1:1 org* using "$user/RAW DATA/DRC/DHIS2/2022/DHIS2_2022"
	drop _merge
	save "$user/RAW DATA/DRC/DHIS2/2022/DHIS2_2022.dta", replace
	
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
		
		foreach v in 1_22 2_22 3_22 4_22 5_22 6_22 7_22 8_22 9_22 10_22 11_22 12_22  { 
			gen flag_outlier`x'`v'= 1 if `x'`v'>pos_out`x' & `x'`v'<. 
			replace flag_outlier`x'`v' =. if `x'`v' <100 // replaces flag to . if volument < 100
			replace `x'`v'=. if flag_outlier`x'`v'==1 // replaces value to missing if flag is 1
	}
	drop rowmean`x' rowsd`x' pos_out`x'  flag_outlier`x'* 
}
	save "$user/RAW DATA/DRC/DHIS2/2022/DHIS2_2022.dta", replace

	

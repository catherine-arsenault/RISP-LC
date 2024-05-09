
*-------------------------------------------------------------------------------
* 2020
	import excel using "$user/RAW DATA/DRC/DHIS2/2020/Janvier 2020.xls", firstrow clear
	duplicates tag org*, g(tag)
	egen sum=rowtotal(B84BCGJanvier2020-B84VPO3Janvier2020) if tag==1
	drop if tag==1 & sum==0
	drop tag sum 
	rename (PopulationdelAiredeSantéJa-B84PCV133Janvier2020) (popaire_1_20 bcg_1_20 penta1_1_20 penta2_1_20 ///
	penta3_1_20 fullvax_1_20 pcv1_1_20 pcv2_1_20 pcv3_1_20)
	egen rota1_1_20=rowtotal(B84Rota10et11moisAvanc-B84Rota112et23moisMobi)
	egen rota2_1_20=rowtotal(B84Rota20et11moisAvanc-B84Rota212et23moisMobi)
	egen rota3_1_20=rowtotal(B84Rota30et11moisAvanc-B84Rota312et23moisMobi)
	drop B84Rota10et11moisAvanc-B84Rota312et23moisMobi
	rename (B84VAAJanvier2020 B84VARJanvier2020) (yf_1_20 mmr_1_20)
	drop B84VAR1RR1Janvier2020 B84VAR2RR2Janvier2020
	rename (B84VPIJanvier2020-B84VPO3Janvier2020) (ipv1_1_20 ipv2_1_20 opv0_1_20 ///
	opv1_1_20 opv2_1_20 opv3_1_20)
save "$user/RAW DATA/DRC/DHIS2/2020/DHIS2_2020.dta", replace

	import excel using "$user/RAW DATA/DRC/DHIS2/2020/Février 2020.xls", firstrow clear
	duplicates tag org*, g(tag)
	egen sum=rowtotal(B84BCGFévrier2020-B84VPO3Février2020) if tag==1
	drop if tag==1 & sum==0
	drop tag sum 
		rename (PopulationdelAiredeSantéFé-B84PCV133Février2020) (popaire_2_20 bcg_2_20 penta1_2_20 penta2_2_20 ///
	penta3_2_20 fullvax_2_20 pcv1_2_20 pcv2_2_20 pcv3_2_20)
	egen rota1_2_20=rowtotal(B84Rota10et11moisAvanc-B84Rota112et23moisMobi)
	egen rota2_2_20=rowtotal(B84Rota20et11moisAvanc-B84Rota212et23moisMobi)
	egen rota3_2_20=rowtotal(B84Rota30et11moisAvanc-B84Rota312et23moisMobi)
		drop B84Rota10et11moisAvanc-B84Rota312et23moisMobi
	rename (B84VAAFévrier2020 B84VARFévrier2020) (yf_2_20 mmr_2_20)
		drop B84VAR1RR1Février2020 B84VAR2RR2Février2020
	rename (B84VPIFévrier2020-B84VPO3Février2020) (ipv1_2_20 ipv2_2_20 opv0_2_20 ///
	opv1_2_20 opv2_2_20 opv3_2_20)
	merge 1:1 org* using "$user/RAW DATA/DRC/DHIS2/2020/DHIS2_2020"
	drop _merge
	save "$user/RAW DATA/DRC/DHIS2/2020/DHIS2_2020.dta", replace
	
	import excel using "$user/RAW DATA/DRC/DHIS2/2020/Mars 2020.xls", firstrow clear
	duplicates tag org*, g(tag)
	egen sum=rowtotal(B84BCGMars2020-B84VPO3Mars2020) if tag==1
	drop if tag==1 & sum==0
	drop tag sum 
		rename (PopulationdelAiredeSantéMa-B84PCV133Mars2020) (popaire_3_20 bcg_3_20 penta1_3_20 penta2_3_20 ///
	penta3_3_20 fullvax_3_20 pcv1_3_20 pcv2_3_20 pcv3_3_20)
	egen rota1_3_20=rowtotal(B84Rota10et11moisAvanc-B84Rota112et23moisMobi)
	egen rota2_3_20=rowtotal(B84Rota20et11moisAvanc-B84Rota212et23moisMobi)
	egen rota3_3_20=rowtotal(B84Rota30et11moisAvanc-B84Rota312et23moisMobi)
	drop B84Rota10et11moisAvanc-B84Rota312et23moisMobi
	rename (B84VAAMars2020 B84VARMars2020) (yf_3_20 mmr_3_20)
	drop B84VAR1RR1Mars2020 B84VAR2RR2Mars2020
	rename (B84VPIMars2020-B84VPO3Mars2020) (ipv1_3_20 ipv2_3_20 opv0_3_20 ///
	opv1_3_20 opv2_3_20 opv3_3_20)
	merge 1:1 org* using "$user/RAW DATA/DRC/DHIS2/2020/DHIS2_2020"
	drop _merge
	save "$user/RAW DATA/DRC/DHIS2/2020/DHIS2_2020.dta", replace
	
	import excel using "$user/RAW DATA/DRC/DHIS2/2020/Avril 2020.xls", firstrow clear
	duplicates tag org*, g(tag)
	egen sum=rowtotal(B84BCGAvril2020-B84VPO3Avril2020) if tag==1
	drop if tag==1 & sum==0
	drop tag sum 
		rename (PopulationdelAiredeSantéAv-B84PCV133Avril2020) (popaire_4_20 bcg_4_20 penta1_4_20 penta2_4_20 ///
	penta3_4_20 fullvax_4_20 pcv1_4_20 pcv2_4_20 pcv3_4_20)
	egen rota1_4_20=rowtotal(B84Rota10et11moisAvanc-B84Rota112et23moisMobi)
	egen rota2_4_20=rowtotal(B84Rota20et11moisAvanc-B84Rota212et23moisMobi)
	egen rota3_4_20=rowtotal(B84Rota30et11moisAvanc-B84Rota312et23moisMobi)
	drop B84Rota10et11moisAvanc-B84Rota312et23moisMobi
	rename (B84VAAAvril2020 B84VARAvril2020) (yf_4_20 mmr_4_20)
	drop B84VAR1RR1Avril2020 B84VAR2RR2Avril2020
	rename (B84VPIAvril2020-B84VPO3Avril2020) (ipv1_4_20 ipv2_4_20 opv0_4_20 ///
	opv1_4_20 opv2_4_20 opv3_4_20)
	merge 1:1 org* using "$user/RAW DATA/DRC/DHIS2/2020/DHIS2_2020"
	drop _merge
	save "$user/RAW DATA/DRC/DHIS2/2020/DHIS2_2020.dta", replace
	
	import excel using "$user/RAW DATA/DRC/DHIS2/2020/Mai 2020.xls", firstrow clear
	duplicates tag org*, g(tag)
	egen sum=rowtotal(B84BCGMai2020-B84VPO3Mai2020) if tag==1
	drop if tag==1 & sum==0
	drop tag sum 
		rename (PopulationdelAiredeSantéMa-B84PCV133Mai2020) (popaire_5_20 bcg_5_20 penta1_5_20 penta2_5_20 ///
	penta3_5_20 fullvax_5_20 pcv1_5_20 pcv2_5_20 pcv3_5_20)
	egen rota1_5_20=rowtotal(B84Rota10et11moisAvanc-B84Rota112et23moisMobi)
	egen rota2_5_20=rowtotal(B84Rota20et11moisAvanc-B84Rota212et23moisMobi)
	egen rota3_5_20=rowtotal(B84Rota30et11moisAvanc-B84Rota312et23moisMobi)
	drop B84Rota10et11moisAvanc-B84Rota312et23moisMobi
	rename (B84VAAMai2020 B84VARMai2020) (yf_5_20 mmr_5_20)
	drop B84VAR1RR1Mai2020 B84VAR2RR2Mai2020
	rename (B84VPIMai2020-B84VPO3Mai2020) (ipv1_5_20 ipv2_5_20 opv0_5_20 ///
	opv1_5_20 opv2_5_20 opv3_5_20)
	merge 1:1 org* using "$user/RAW DATA/DRC/DHIS2/2020/DHIS2_2020"
	drop _merge
	save "$user/RAW DATA/DRC/DHIS2/2020/DHIS2_2020.dta", replace
	
	import excel using "$user/RAW DATA/DRC/DHIS2/2020/Juin 2020.xls", firstrow clear
	duplicates tag org*, g(tag)
	egen sum=rowtotal(B84BCGJuin2020-B84VPO3Juin2020) if tag==1
	drop if tag==1 & sum==0
	drop tag sum 
		rename (PopulationdelAiredeSantéJu-B84PCV133Juin2020) (popaire_6_20 bcg_6_20 penta1_6_20 penta2_6_20 ///
	penta3_6_20 fullvax_6_20 pcv1_6_20 pcv2_6_20 pcv3_6_20)
	egen rota1_6_20=rowtotal(B84Rota10et11moisAvanc-B84Rota112et23moisMobi)
	egen rota2_6_20=rowtotal(B84Rota20et11moisAvanc-B84Rota212et23moisMobi)
	egen rota3_6_20=rowtotal(B84Rota30et11moisAvanc-B84Rota312et23moisMobi)
	drop B84Rota10et11moisAvanc-B84Rota312et23moisMobi
	rename (B84VAAJuin2020 B84VARJuin2020) (yf_6_20 mmr_6_20)
	drop B84VAR1RR1Juin2020 B84VAR2RR2Juin2020
	rename (B84VPIJuin2020-B84VPO3Juin2020) (ipv1_6_20 ipv2_6_20 opv0_6_20 ///
	opv1_6_20 opv2_6_20 opv3_6_20)
	merge 1:1 org* using "$user/RAW DATA/DRC/DHIS2/2020/DHIS2_2020"
	drop _merge
	save "$user/RAW DATA/DRC/DHIS2/2020/DHIS2_2020.dta", replace
	
	import excel using "$user/RAW DATA/DRC/DHIS2/2020/Juillet 2020.xls", firstrow clear
	duplicates tag org*, g(tag)
	egen sum=rowtotal(B84BCGJuillet2020-B84VPO3Juillet2020) if tag==1
	drop if tag==1 & sum==0
	drop in 23149 // remaining duplicate
	drop tag sum 
		rename (PopulationdelAiredeSantéJu-B84PCV133Juillet2020) (popaire_7_20 bcg_7_20 penta1_7_20 penta2_7_20 ///
	penta3_7_20 fullvax_7_20 pcv1_7_20 pcv2_7_20 pcv3_7_20)
	egen rota1_7_20=rowtotal(B84Rota10et11moisAvanc-B84Rota112et23moisMobi)
	egen rota2_7_20=rowtotal(B84Rota20et11moisAvanc-B84Rota212et23moisMobi)
	egen rota3_7_20=rowtotal(B84Rota30et11moisAvanc-B84Rota312et23moisMobi)
	drop B84Rota10et11moisAvanc-B84Rota312et23moisMobi
	rename (B84VAAJuillet2020 B84VARJuillet2020) (yf_7_20 mmr_7_20)
	drop B84VAR1RR1Juillet2020 B84VAR2RR2Juillet2020
	rename (B84VPIJuillet2020-B84VPO3Juillet2020) (ipv1_7_20 ipv2_7_20 opv0_7_20 ///
	opv1_7_20 opv2_7_20 opv3_7_20)
	merge 1:1 org* using "$user/RAW DATA/DRC/DHIS2/2020/DHIS2_2020"
	drop _merge
	save "$user/RAW DATA/DRC/DHIS2/2020/DHIS2_2020.dta", replace
	
	import excel using "$user/RAW DATA/DRC/DHIS2/2020/Août 2020.xls", firstrow clear
	duplicates tag org*, g(tag)
	egen sum=rowtotal(B84BCGAoût2020-B84VPO3Août2020) if tag==1
	drop if tag==1 & sum==0
	drop tag sum 
		rename (PopulationdelAiredeSantéAo-B84PCV133Août2020) (popaire_8_20 bcg_8_20 penta1_8_20 penta2_8_20 ///
	penta3_8_20 fullvax_8_20 pcv1_8_20 pcv2_8_20 pcv3_8_20)
	egen rota1_8_20=rowtotal(B84Rota10et11moisAvanc-B84Rota112et23moisMobi)
	egen rota2_8_20=rowtotal(B84Rota20et11moisAvanc-B84Rota212et23moisMobi)
	egen rota3_8_20=rowtotal(B84Rota30et11moisAvanc-B84Rota312et23moisMobi)
	drop B84Rota10et11moisAvanc-B84Rota312et23moisMobi
	rename (B84VAAAoût2020 B84VARAoût2020) (yf_8_20 mmr_8_20)
	drop B84VAR1RR1Août2020 B84VAR2RR2Août2020
	rename (B84VPIAoût2020-B84VPO3Août2020) (ipv1_8_20 ipv2_8_20 opv0_8_20 ///
	opv1_8_20 opv2_8_20 opv3_8_20)
	merge 1:1 org* using "$user/RAW DATA/DRC/DHIS2/2020/DHIS2_2020"
	drop _merge
	save "$user/RAW DATA/DRC/DHIS2/2020/DHIS2_2020.dta", replace
	
	import excel using "$user/RAW DATA/DRC/DHIS2/2020/Septembre 2020.xls", firstrow clear
	duplicates tag org*, g(tag)
	egen sum=rowtotal(B84BCGSeptembre2020-B84VPO3Septembre2020) if tag==1
	drop if tag==1 & sum==0
	drop tag sum 
		rename (PopulationdelAiredeSantéSe-B84PCV133Septembre2020) (popaire_9_20 bcg_9_20 penta1_9_20 penta2_9_20 ///
	penta3_9_20 fullvax_9_20 pcv1_9_20 pcv2_9_20 pcv3_9_20)
	egen rota1_9_20=rowtotal(B84Rota10et11moisAvanc-B84Rota112et23moisMobi)
	egen rota2_9_20=rowtotal(B84Rota20et11moisAvanc-B84Rota212et23moisMobi)
	egen rota3_9_20=rowtotal(B84Rota30et11moisAvanc-B84Rota312et23moisMobi)
	drop B84Rota10et11moisAvanc-B84Rota312et23moisMobi
	rename (B84VAASeptembre2020 B84VARSeptembre2020) (yf_9_20 mmr_9_20)
	drop B84VAR1RR1Septembre2020 B84VAR2RR2Septembre2020
	rename (B84VPISeptembre2020-B84VPO3Septembre2020) (ipv1_9_20 ipv2_9_20 opv0_9_20 ///
	opv1_9_20 opv2_9_20 opv3_9_20)
	
	merge 1:1 org* using "$user/RAW DATA/DRC/DHIS2/2020/DHIS2_2020"
	drop _merge
	save "$user/RAW DATA/DRC/DHIS2/2020/DHIS2_2020.dta", replace
	
	import excel using "$user/RAW DATA/DRC/DHIS2/2020/Octobre 2020.xls", firstrow clear
	duplicates tag org*, g(tag)
	egen sum=rowtotal(B84BCGOctobre2020-B84VPO3Octobre2020) if tag==1
	drop if tag==1 & sum==0
	drop tag sum 
		rename (PopulationdelAiredeSantéOc-B84PCV133Octobre2020) (popaire_10_20 bcg_10_20 penta1_10_20 penta2_10_20 ///
	penta3_10_20 fullvax_10_20 pcv1_10_20 pcv2_10_20 pcv3_10_20)
	egen rota1_10_20=rowtotal(B84Rota10et11moisAvanc-B84Rota112et23moisMobi)
	egen rota2_10_20=rowtotal(B84Rota20et11moisAvanc-B84Rota212et23moisMobi)
	egen rota3_10_20=rowtotal(B84Rota30et11moisAvanc-B84Rota312et23moisMobi)
	drop B84Rota10et11moisAvanc-B84Rota312et23moisMobi
	rename (B84VAAOctobre2020 B84VAROctobre2020) (yf_10_20 mmr_10_20)
	drop B84VAR1RR1Octobre2020 B84VAR2RR2Octobre2020
	rename (B84VPIOctobre2020-B84VPO3Octobre2020) (ipv1_10_20 ipv2_10_20 opv0_10_20 ///
	opv1_10_20 opv2_10_20 opv3_10_20)
	merge 1:1 org* using "$user/RAW DATA/DRC/DHIS2/2020/DHIS2_2020"
	drop _merge
	save "$user/RAW DATA/DRC/DHIS2/2020/DHIS2_2020.dta", replace
	
	import excel using "$user/RAW DATA/DRC/DHIS2/2020/Novembre 2020.xls", firstrow clear
	duplicates tag org*, g(tag)
	egen sum=rowtotal(B84BCGNovembre2020-B84VPO3Novembre2020) if tag==1
	drop if tag==1 & sum==0
	drop tag sum 
		rename (PopulationdelAiredeSantéNo-B84PCV133Novembre2020) (popaire_11_20 bcg_11_20 penta1_11_20 penta2_11_20 ///
	penta3_11_20 fullvax_11_20 pcv1_11_20 pcv2_11_20 pcv3_11_20)
	egen rota1_11_20=rowtotal(B84Rota10et11moisAvanc-B84Rota112et23moisMobi)
	egen rota2_11_20=rowtotal(B84Rota20et11moisAvanc-B84Rota212et23moisMobi)
	egen rota3_11_20=rowtotal(B84Rota30et11moisAvanc-B84Rota312et23moisMobi)
	drop B84Rota10et11moisAvanc-B84Rota312et23moisMobi
	rename (B84VAANovembre2020 B84VARNovembre2020) (yf_11_20 mmr_11_20)
	drop B84VAR1RR1Novembre2020 B84VAR2RR2Novembre2020
	rename (B84VPINovembre2020-B84VPO3Novembre2020) (ipv1_11_20 ipv2_11_20 opv0_11_20 ///
	opv1_11_20 opv2_11_20 opv3_11_20)
	merge 1:1 org* using "$user/RAW DATA/DRC/DHIS2/2020/DHIS2_2020"
	drop _merge
	save "$user/RAW DATA/DRC/DHIS2/2020/DHIS2_2020.dta", replace
	
	import excel using "$user/RAW DATA/DRC/DHIS2/2020/Décembre 2020.xls", firstrow clear
	duplicates tag org*, g(tag)
	egen sum=rowtotal(B84BCGDécembre2020-B84VPO3Décembre2020) if tag==1
	drop if tag==1 & sum==0
	drop tag sum 
		rename (PopulationdelAiredeSantéDé-B84PCV133Décembre2020) (popaire_12_20 bcg_12_20 penta1_12_20 penta2_12_20 ///
	penta3_12_20 fullvax_12_20 pcv1_12_20 pcv2_12_20 pcv3_12_20)
	egen rota1_12_20=rowtotal(B84Rota10et11moisAvanc-B84Rota112et23moisMobi)
	egen rota2_12_20=rowtotal(B84Rota20et11moisAvanc-B84Rota212et23moisMobi)
	egen rota3_12_20=rowtotal(B84Rota30et11moisAvanc-B84Rota312et23moisMobi)
	drop B84Rota10et11moisAvanc-B84Rota312et23moisMobi
	rename (B84VAADécembre2020 B84VARDécembre2020) (yf_12_20 mmr_12_20)
	drop B84VAR1RR1Décembre2020 B84VAR2RR2Décembre2020
	rename (B84VPIDécembre2020-B84VPO3Décembre2020) (ipv1_12_20 ipv2_12_20 opv0_12_20 ///
	opv1_12_20 opv2_12_20 opv3_12_20)
	merge 1:1 org* using "$user/RAW DATA/DRC/DHIS2/2020/DHIS2_2020"
	drop _merge
	save "$user/RAW DATA/DRC/DHIS2/2020/DHIS2_2020.dta", replace
	
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
		
		foreach v in 1_20 2_20 3_20 4_20 5_20 6_20 7_20 8_20 9_20 10_20 11_20 12_20  { 
			gen flag_outlier`x'`v'= 1 if `x'`v'>pos_out`x' & `x'`v'<. 
			replace flag_outlier`x'`v' =. if `x'`v' <100 // replaces flag to . if volument < 100
			replace `x'`v'=. if flag_outlier`x'`v'==1 // replaces value to missing if flag is 1
	}
	drop rowmean`x' rowsd`x' pos_out`x'  flag_outlier`x'* 
}
	save "$user/RAW DATA/DRC/DHIS2/2020/DHIS2_2020.dta", replace



	

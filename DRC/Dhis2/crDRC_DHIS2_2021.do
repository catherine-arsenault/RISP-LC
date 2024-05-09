*-------------------------------------------------------------------------------
* 2021
	import excel using "$user/RAW DATA/DRC/DHIS2/2021/Janvier 2021.xls", firstrow clear
	duplicates tag org*, g(tag)
	egen sum=rowtotal(B84BCGJanvier2021-B84VPO3Janvier2021) if tag==1
	drop if tag==1 & sum==0
	drop tag sum 
	rename (PopulationdelAiredeSantéJa-B84PCV133Janvier2021) (popaire_1_21 bcg_1_21 penta1_1_21 penta2_1_21 ///
	penta3_1_21 fullvax_1_21 pcv1_1_21 pcv2_1_21 pcv3_1_21)
	egen rota1_1_21=rowtotal(B84Rota10et11moisAvanc-B84Rota112et23moisMobi)
	egen rota2_1_21=rowtotal(B84Rota20et11moisAvanc-B84Rota212et23moisMobi)
	egen rota3_1_21=rowtotal(B84Rota30et11moisAvanc-B84Rota312et23moisMobi)
	drop B84Rota10et11moisAvanc-B84Rota312et23moisMobi
	rename (B84VAAJanvier2021 B84VARJanvier2021) (yf_1_21 mmr_1_21)
	drop B84VAR1RR1Janvier2021 B84VAR2RR2Janvier2021
	rename (B84VPIJanvier2021-B84VPO3Janvier2021) (ipv1_1_21 ipv2_1_21 opv0_1_21 ///
	opv1_1_21 opv2_1_21 opv3_1_21)
save "$user/RAW DATA/DRC/DHIS2/2021/DHIS2_2021.dta", replace

	import excel using "$user/RAW DATA/DRC/DHIS2/2021/Février 2021.xls", firstrow clear
	duplicates tag org*, g(tag)
	egen sum=rowtotal(B84BCGFévrier2021-B84VPO3Février2021) if tag==1
	drop if tag==1 & sum==0
	drop tag sum 
	rename (PopulationdelAiredeSantéFé-B84PCV133Février2021) (popaire_2_21 bcg_2_21 penta1_2_21 penta2_2_21 ///
	penta3_2_21 fullvax_2_21 pcv1_2_21 pcv2_2_21 pcv3_2_21)
	egen rota1_2_21=rowtotal(B84Rota10et11moisAvanc-B84Rota112et23moisMobi)
	egen rota2_2_21=rowtotal(B84Rota20et11moisAvanc-B84Rota212et23moisMobi)
	egen rota3_2_21=rowtotal(B84Rota30et11moisAvanc-B84Rota312et23moisMobi)
		drop B84Rota10et11moisAvanc-B84Rota312et23moisMobi
	rename (B84VAAFévrier2021 B84VARFévrier2021) (yf_2_21 mmr_2_21)
		drop B84VAR1RR1Février2021 B84VAR2RR2Février2021
	rename (B84VPIFévrier2021-B84VPO3Février2021) (ipv1_2_21 ipv2_2_21 opv0_2_21 ///
	opv1_2_21 opv2_2_21 opv3_2_21)
	merge 1:1 org* using "$user/RAW DATA/DRC/DHIS2/2021/DHIS2_2021"
	drop _merge
	save "$user/RAW DATA/DRC/DHIS2/2021/DHIS2_2021.dta", replace
	
	import excel using "$user/RAW DATA/DRC/DHIS2/2021/Mars 2021.xls", firstrow clear
	duplicates tag org*, g(tag)
	egen sum=rowtotal(B84BCGMars2021-B84VPO3Mars2021) if tag==1
	drop if tag==1 & sum==0
	drop tag sum 
		rename (PopulationdelAiredeSantéMa-B84PCV133Mars2021) (popaire_3_21 bcg_3_21 penta1_3_21 penta2_3_21 ///
	penta3_3_21 fullvax_3_21 pcv1_3_21 pcv2_3_21 pcv3_3_21)
	egen rota1_3_21=rowtotal(B84Rota10et11moisAvanc-B84Rota112et23moisMobi)
	egen rota2_3_21=rowtotal(B84Rota20et11moisAvanc-B84Rota212et23moisMobi)
	egen rota3_3_21=rowtotal(B84Rota30et11moisAvanc-B84Rota312et23moisMobi)
	drop B84Rota10et11moisAvanc-B84Rota312et23moisMobi
	rename (B84VAAMars2021 B84VARMars2021) (yf_3_21 mmr_3_21)
	drop B84VAR1RR1Mars2021 B84VAR2RR2Mars2021
	rename (B84VPIMars2021-B84VPO3Mars2021) (ipv1_3_21 ipv2_3_21 opv0_3_21 ///
	opv1_3_21 opv2_3_21 opv3_3_21)
	merge 1:1 org* using "$user/RAW DATA/DRC/DHIS2/2021/DHIS2_2021"
	drop _merge
	save "$user/RAW DATA/DRC/DHIS2/2021/DHIS2_2021.dta", replace
	
	import excel using "$user/RAW DATA/DRC/DHIS2/2021/Avril 2021.xls", firstrow clear
	duplicates tag org*, g(tag)
	egen sum=rowtotal(B84BCGAvril2021-B84VPO3Avril2021) if tag==1
	drop if tag==1 & sum==0
	drop tag sum 
		rename (PopulationdelAiredeSantéAv-B84PCV133Avril2021) (popaire_4_21 bcg_4_21 penta1_4_21 penta2_4_21 ///
	penta3_4_21 fullvax_4_21 pcv1_4_21 pcv2_4_21 pcv3_4_21)
	egen rota1_4_21=rowtotal(B84Rota10et11moisAvanc-B84Rota112et23moisMobi)
	egen rota2_4_21=rowtotal(B84Rota20et11moisAvanc-B84Rota212et23moisMobi)
	egen rota3_4_21=rowtotal(B84Rota30et11moisAvanc-B84Rota312et23moisMobi)
	drop B84Rota10et11moisAvanc-B84Rota312et23moisMobi
	rename (B84VAAAvril2021 B84VARAvril2021) (yf_4_21 mmr_4_21)
	drop B84VAR1RR1Avril2021 B84VAR2RR2Avril2021
	rename (B84VPIAvril2021-B84VPO3Avril2021) (ipv1_4_21 ipv2_4_21 opv0_4_21 ///
	opv1_4_21 opv2_4_21 opv3_4_21)
	merge 1:1 org* using "$user/RAW DATA/DRC/DHIS2/2021/DHIS2_2021"
	drop _merge
	save "$user/RAW DATA/DRC/DHIS2/2021/DHIS2_2021.dta", replace
	
	import excel using "$user/RAW DATA/DRC/DHIS2/2021/Mai 2021.xls", firstrow clear
	duplicates tag org*, g(tag)
	egen sum=rowtotal(B84BCGMai2021-B84VPO3Mai2021) if tag==1
	drop if tag==1 & sum==0
	drop tag sum 
	merge 1:1 org* using "$user/RAW DATA/DRC/DHIS2/2021/DHIS2_2021"
	drop _merge
		rename (PopulationdelAiredeSantéMa-B84PCV133Mai2021) (popaire_5_21 bcg_5_21 penta1_5_21 penta2_5_21 ///
	penta3_5_21 fullvax_5_21 pcv1_5_21 pcv2_5_21 pcv3_5_21)
	egen rota1_5_21=rowtotal(B84Rota10et11moisAvanc-B84Rota112et23moisMobi)
	egen rota2_5_21=rowtotal(B84Rota20et11moisAvanc-B84Rota212et23moisMobi)
	egen rota3_5_21=rowtotal(B84Rota30et11moisAvanc-B84Rota312et23moisMobi)
	drop B84Rota10et11moisAvanc-B84Rota312et23moisMobi
	rename (B84VAAMai2021 B84VARMai2021) (yf_5_21 mmr_5_21)
	drop B84VAR1RR1Mai2021 B84VAR2RR2Mai2021
	rename (B84VPIMai2021-B84VPO3Mai2021) (ipv1_5_21 ipv2_5_21 opv0_5_21 ///
	opv1_5_21 opv2_5_21 opv3_5_21)
	save "$user/RAW DATA/DRC/DHIS2/2021/DHIS2_2021.dta", replace
	
	import excel using "$user/RAW DATA/DRC/DHIS2/2021/Juin 2021.xls", firstrow clear
	duplicates tag org*, g(tag)
	egen sum=rowtotal(B84BCGJuin2021-B84VPO3Juin2021) if tag==1
	drop if tag==1 & sum==0
	drop tag sum 
		rename (PopulationdelAiredeSantéJu-B84PCV133Juin2021) (popaire_6_21 bcg_6_21 penta1_6_21 penta2_6_21 ///
	penta3_6_21 fullvax_6_21 pcv1_6_21 pcv2_6_21 pcv3_6_21)
	egen rota1_6_21=rowtotal(B84Rota10et11moisAvanc-B84Rota112et23moisMobi)
	egen rota2_6_21=rowtotal(B84Rota20et11moisAvanc-B84Rota212et23moisMobi)
	egen rota3_6_21=rowtotal(B84Rota30et11moisAvanc-B84Rota312et23moisMobi)
	drop B84Rota10et11moisAvanc-B84Rota312et23moisMobi
	rename (B84VAAJuin2021 B84VARJuin2021) (yf_6_21 mmr_6_21)
	drop B84VAR1RR1Juin2021 B84VAR2RR2Juin2021
	rename (B84VPIJuin2021-B84VPO3Juin2021) (ipv1_6_21 ipv2_6_21 opv0_6_21 ///
	opv1_6_21 opv2_6_21 opv3_6_21)
	merge 1:1 org* using "$user/RAW DATA/DRC/DHIS2/2021/DHIS2_2021"
	drop _merge
	save "$user/RAW DATA/DRC/DHIS2/2021/DHIS2_2021.dta", replace
	
	import excel using "$user/RAW DATA/DRC/DHIS2/2021/Juillet 2021.xls", firstrow clear
	duplicates tag org*, g(tag)
	egen sum=rowtotal(B84BCGJuillet2021-B84VPO3Juillet2021) if tag==1
	drop if tag==1 & sum==0
	drop tag sum 
		rename (PopulationdelAiredeSantéJu-B84PCV133Juillet2021) (popaire_7_21 bcg_7_21 penta1_7_21 penta2_7_21 ///
	penta3_7_21 fullvax_7_21 pcv1_7_21 pcv2_7_21 pcv3_7_21)
	egen rota1_7_21=rowtotal(B84Rota10et11moisAvanc-B84Rota112et23moisMobi)
	egen rota2_7_21=rowtotal(B84Rota20et11moisAvanc-B84Rota212et23moisMobi)
	egen rota3_7_21=rowtotal(B84Rota30et11moisAvanc-B84Rota312et23moisMobi)
	drop B84Rota10et11moisAvanc-B84Rota312et23moisMobi
	rename (B84VAAJuillet2021 B84VARJuillet2021) (yf_7_21 mmr_7_21)
	drop B84VAR1RR1Juillet2021 B84VAR2RR2Juillet2021
	rename (B84VPIJuillet2021-B84VPO3Juillet2021) (ipv1_7_21 ipv2_7_21 opv0_7_21 ///
	opv1_7_21 opv2_7_21 opv3_7_21)
	merge 1:1 org* using "$user/RAW DATA/DRC/DHIS2/2021/DHIS2_2021"
	drop _merge
	save "$user/RAW DATA/DRC/DHIS2/2021/DHIS2_2021.dta", replace
	
	import excel using "$user/RAW DATA/DRC/DHIS2/2021/Août 2021.xls", firstrow clear
	duplicates tag org*, g(tag)
	egen sum=rowtotal(B84BCGAoût2021-B84VPO3Août2021) if tag==1
	drop if tag==1 & sum==0
	drop in 23012
	drop tag sum 
		rename (PopulationdelAiredeSantéAo-B84PCV133Août2021) (popaire_8_21 bcg_8_21 penta1_8_21 penta2_8_21 ///
	penta3_8_21 fullvax_8_21 pcv1_8_21 pcv2_8_21 pcv3_8_21)
	egen rota1_8_21=rowtotal(B84Rota10et11moisAvanc-B84Rota112et23moisMobi)
	egen rota2_8_21=rowtotal(B84Rota20et11moisAvanc-B84Rota212et23moisMobi)
	egen rota3_8_21=rowtotal(B84Rota30et11moisAvanc-B84Rota312et23moisMobi)
	drop B84Rota10et11moisAvanc-B84Rota312et23moisMobi
	rename (B84VAAAoût2021 B84VARAoût2021) (yf_8_21 mmr_8_21)
	drop B84VAR1RR1Août2021 B84VAR2RR2Août2021
	rename (B84VPIAoût2021-B84VPO3Août2021) (ipv1_8_21 ipv2_8_21 opv0_8_21 ///
	opv1_8_21 opv2_8_21 opv3_8_21)
	merge 1:1 org* using "$user/RAW DATA/DRC/DHIS2/2021/DHIS2_2021"
	drop _merge
	save "$user/RAW DATA/DRC/DHIS2/2021/DHIS2_2021.dta", replace
	
	import excel using "$user/RAW DATA/DRC/DHIS2/2021/Septembre 2021.xls", firstrow clear
	duplicates tag org*, g(tag)
	egen sum=rowtotal(B84BCGSeptembre2021-B84VPO3Septembre2021) if tag==1
	drop if tag==1 & sum==0
	drop tag sum 
		rename (PopulationdelAiredeSantéSe-B84PCV133Septembre2021) (popaire_9_21 bcg_9_21 penta1_9_21 penta2_9_21 ///
	penta3_9_21 fullvax_9_21 pcv1_9_21 pcv2_9_21 pcv3_9_21)
	egen rota1_9_21=rowtotal(B84Rota10et11moisAvanc-B84Rota112et23moisMobi)
	egen rota2_9_21=rowtotal(B84Rota20et11moisAvanc-B84Rota212et23moisMobi)
	egen rota3_9_21=rowtotal(B84Rota30et11moisAvanc-B84Rota312et23moisMobi)
	drop B84Rota10et11moisAvanc-B84Rota312et23moisMobi
	rename (B84VAASeptembre2021 B84VARSeptembre2021) (yf_9_21 mmr_9_21)
	drop B84VAR1RR1Septembre2021 B84VAR2RR2Septembre2021
	rename (B84VPISeptembre2021-B84VPO3Septembre2021) (ipv1_9_21 ipv2_9_21 opv0_9_21 ///
	opv1_9_21 opv2_9_21 opv3_9_21)
	merge 1:1 org* using "$user/RAW DATA/DRC/DHIS2/2021/DHIS2_2021"
	drop _merge
	save "$user/RAW DATA/DRC/DHIS2/2021/DHIS2_2021.dta", replace
	
	import excel using "$user/RAW DATA/DRC/DHIS2/2021/Octobre 2021.xls", firstrow clear
	duplicates tag org*, g(tag)
	egen sum=rowtotal(B84BCGOctobre2021-B84VPO3Octobre2021) if tag==1
	drop if tag==1 & sum==0
	drop tag sum 
		rename (PopulationdelAiredeSantéOc-B84PCV133Octobre2021) (popaire_10_21 bcg_10_21 penta1_10_21 penta2_10_21 ///
	penta3_10_21 fullvax_10_21 pcv1_10_21 pcv2_10_21 pcv3_10_21)
	egen rota1_10_21=rowtotal(B84Rota10et11moisAvanc-B84Rota112et23moisMobi)
	egen rota2_10_21=rowtotal(B84Rota20et11moisAvanc-B84Rota212et23moisMobi)
	egen rota3_10_21=rowtotal(B84Rota30et11moisAvanc-B84Rota312et23moisMobi)
	drop B84Rota10et11moisAvanc-B84Rota312et23moisMobi
	rename (B84VAAOctobre2021 B84VAROctobre2021) (yf_10_21 mmr_10_21)
	drop B84VAR1RR1Octobre2021 B84VAR2RR2Octobre2021
	rename (B84VPIOctobre2021-B84VPO3Octobre2021) (ipv1_10_21 ipv2_10_21 opv0_10_21 ///
	opv1_10_21 opv2_10_21 opv3_10_21)
	merge 1:1 org* using "$user/RAW DATA/DRC/DHIS2/2021/DHIS2_2021"
	drop _merge
	save "$user/RAW DATA/DRC/DHIS2/2021/DHIS2_2021.dta", replace
	
	import excel using "$user/RAW DATA/DRC/DHIS2/2021/Novembre 2021.xls", firstrow clear
	duplicates tag org*, g(tag)
	egen sum=rowtotal(B84BCGNovembre2021-B84VPO3Novembre2021) if tag==1
	drop if tag==1 & sum==0
	drop tag sum 
		rename (PopulationdelAiredeSantéNo-B84PCV133Novembre2021) (popaire_11_21 bcg_11_21 penta1_11_21 penta2_11_21 ///
	penta3_11_21 fullvax_11_21 pcv1_11_21 pcv2_11_21 pcv3_11_21)
	egen rota1_11_21=rowtotal(B84Rota10et11moisAvanc-B84Rota112et23moisMobi)
	egen rota2_11_21=rowtotal(B84Rota20et11moisAvanc-B84Rota212et23moisMobi)
	egen rota3_11_21=rowtotal(B84Rota30et11moisAvanc-B84Rota312et23moisMobi)
	drop B84Rota10et11moisAvanc-B84Rota312et23moisMobi
	rename (B84VAANovembre2021 B84VARNovembre2021) (yf_11_21 mmr_11_21)
	drop B84VAR1RR1Novembre2021 B84VAR2RR2Novembre2021
	rename (B84VPINovembre2021-B84VPO3Novembre2021) (ipv1_11_21 ipv2_11_21 opv0_11_21 ///
	opv1_11_21 opv2_11_21 opv3_11_21)
	merge 1:1 org* using "$user/RAW DATA/DRC/DHIS2/2021/DHIS2_2021"
	drop _merge
	save "$user/RAW DATA/DRC/DHIS2/2021/DHIS2_2021.dta", replace
	
	import excel using "$user/RAW DATA/DRC/DHIS2/2021/Décembre 2021.xls", firstrow clear
	duplicates tag org*, g(tag)
	egen sum=rowtotal(B84BCGDécembre2021-B84VPO3Décembre2021) if tag==1
	drop if tag==1 & sum==0
	drop tag sum 
		rename (PopulationdelAiredeSantéDé-B84PCV133Décembre2021) (popaire_12_21 bcg_12_21 penta1_12_21 penta2_12_21 ///
	penta3_12_21 fullvax_12_21 pcv1_12_21 pcv2_12_21 pcv3_12_21)
	egen rota1_12_21=rowtotal(B84Rota10et11moisAvanc-B84Rota112et23moisMobi)
	egen rota2_12_21=rowtotal(B84Rota20et11moisAvanc-B84Rota212et23moisMobi)
	egen rota3_12_21=rowtotal(B84Rota30et11moisAvanc-B84Rota312et23moisMobi)
	drop B84Rota10et11moisAvanc-B84Rota312et23moisMobi
	rename (B84VAADécembre2021 B84VARDécembre2021) (yf_12_21 mmr_12_21)
	drop B84VAR1RR1Décembre2021 B84VAR2RR2Décembre2021
	rename (B84VPIDécembre2021-B84VPO3Décembre2021) (ipv1_12_21 ipv2_12_21 opv0_12_21 ///
	opv1_12_21 opv2_12_21 opv3_12_21)
	merge 1:1 org* using "$user/RAW DATA/DRC/DHIS2/2021/DHIS2_2021"
	drop _merge
	save "$user/RAW DATA/DRC/DHIS2/2021/DHIS2_2021.dta", replace
	
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
		
		foreach v in 1_21 2_21 3_21 4_21 5_21 6_21 7_21 8_21 9_21 10_21 11_21 12_21  { 
			gen flag_outlier`x'`v'= 1 if `x'`v'>pos_out`x' & `x'`v'<. 
			replace flag_outlier`x'`v' =. if `x'`v' <100 // replaces flag to . if volument < 100
			replace `x'`v'=. if flag_outlier`x'`v'==1 // replaces value to missing if flag is 1
	}
	drop rowmean`x' rowsd`x' pos_out`x'  flag_outlier`x'* 
}
	save "$user/RAW DATA/DRC/DHIS2/2021/DHIS2_2021.dta", replace

	
	
	
	
	
	
	
	
	
	
	
	
	
	
	

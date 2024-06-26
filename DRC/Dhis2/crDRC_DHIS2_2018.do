	
* Analyses of DHIS2 vaccination data DRC Jan 2018 - December 2023
* Created Jun 7, 2024
*-------------------------------------------------------------------------------
global user "/Users/catherine.arsenault/Dropbox/BMGF RISP Project/Quant analysis/"

*-------------------------------------------------------------------------------
* 2018
* Jan
	import excel using "$user/RAW DATA/DRC/DHIS2/2018/Janvier 2018.xls", firstrow clear
	duplicates tag org*, g(tag)
	egen sum=rowtotal(B84BCGJanvier2018-B84VPO3Janvier2018) if tag==1
	drop if tag==1 & sum==0
	drop tag sum
	rename (PopulationdelAiredeSantéJa-B84PCV133Janvier2018) (popaire_1_18 bcg_1_18 penta1_1_18 penta2_1_18 ///
	penta3_1_18 fullvax_1_18 pcv1_1_18 pcv2_1_18 pcv3_1_18)
	egen rota1_1_18=rowtotal(B84Rota10et11moisAvanc-B84Rota112et23moisMobi)
	egen rota2_1_18=rowtotal(B84Rota20et11moisAvanc-B84Rota212et23moisMobi)
	egen rota3_1_18=rowtotal(B84Rota30et11moisAvanc-B84Rota312et23moisMobi)
	drop B84Rota10et11moisAvanc-B84Rota312et23moisMobi
	rename (B84VAAJanvier2018 B84VARJanvier2018) (yf_1_18 mmr_1_18)
	drop B84VAR1RR1Janvier2018 B84VAR2RR2Janvier2018
	rename (B84VPIJanvier2018-B84VPO3Janvier2018) (ipv1_1_18 ipv2_1_18 opv0_1_18 ///
	opv1_1_18 opv2_1_18 opv3_1_18)
save "$user/RAW DATA/DRC/DHIS2/2018/DHIS2_2018.dta", replace
* Feb
	import excel using "$user/RAW DATA/DRC/DHIS2/2018/Février 2018.xls", firstrow clear
	duplicates tag org*, g(tag)
	egen sum=rowtotal(B84BCGFévrier2018-B84VPO3Février2018) if tag==1
	drop if tag==1 & sum==0
	drop tag sum 
	rename (PopulationdelAiredeSantéFé-B84PCV133Février2018) (popaire_2_18 bcg_2_18 penta1_2_18 penta2_2_18 ///
	penta3_2_18 fullvax_2_18 pcv1_2_18 pcv2_2_18 pcv3_2_18)
	egen rota1_2_18=rowtotal(B84Rota10et11moisAvanc-B84Rota112et23moisMobi)
	egen rota2_2_18=rowtotal(B84Rota20et11moisAvanc-B84Rota212et23moisMobi)
	egen rota3_2_18=rowtotal(B84Rota30et11moisAvanc-B84Rota312et23moisMobi)
		drop B84Rota10et11moisAvanc-B84Rota312et23moisMobi
	rename (B84VAAFévrier2018 B84VARFévrier2018) (yf_2_18 mmr_2_18)
		drop B84VAR1RR1Février2018 B84VAR2RR2Février2018
	rename (B84VPIFévrier2018-B84VPO3Février2018) (ipv1_2_18 ipv2_2_18 opv0_2_18 ///
	opv1_2_18 opv2_2_18 opv3_2_18)
	merge 1:1 org* using "$user/RAW DATA/DRC/DHIS2/2018/DHIS2_2018"
	drop _merge
	save "$user/RAW DATA/DRC/DHIS2/2018/DHIS2_2018.dta", replace
	
* Mar
	import excel using "$user/RAW DATA/DRC/DHIS2/2018/Mars 2018.xls", firstrow clear
	duplicates tag org*, g(tag)
	egen sum=rowtotal(B84BCGMars2018-B84VPO3Mars2018) if tag==1
	drop if tag==1 & sum==0
	drop tag sum 
	rename (PopulationdelAiredeSantéMa-B84PCV133Mars2018) (popaire_3_18 bcg_3_18 penta1_3_18 penta2_3_18 ///
	penta3_3_18 fullvax_3_18 pcv1_3_18 pcv2_3_18 pcv3_3_18)
	egen rota1_3_18=rowtotal(B84Rota10et11moisAvanc-B84Rota112et23moisMobi)
	egen rota2_3_18=rowtotal(B84Rota20et11moisAvanc-B84Rota212et23moisMobi)
	egen rota3_3_18=rowtotal(B84Rota30et11moisAvanc-B84Rota312et23moisMobi)
	drop B84Rota10et11moisAvanc-B84Rota312et23moisMobi
	rename (B84VAAMars2018 B84VARMars2018) (yf_3_18 mmr_3_18)
	drop B84VAR1RR1Mars2018 B84VAR2RR2Mars2018
	rename (B84VPIMars2018-B84VPO3Mars2018) (ipv1_3_18 ipv2_3_18 opv0_3_18 ///
	opv1_3_18 opv2_3_18 opv3_3_18)
	merge 1:1 org* using "$user/RAW DATA/DRC/DHIS2/2018/DHIS2_2018"
	drop _merge
	save "$user/RAW DATA/DRC/DHIS2/2018/DHIS2_2018.dta", replace
* Apr 
	import excel using "$user/RAW DATA/DRC/DHIS2/2018/Avril 2018.xls", firstrow clear
	duplicates tag org*, g(tag)
	egen sum=rowtotal(B84BCGAvril2018-B84VPO3Avril2018) if tag==1
	drop if tag==1 & sum==0
	drop tag sum 
	rename (PopulationdelAiredeSantéAv-B84PCV133Avril2018) (popaire_4_18 bcg_4_18 penta1_4_18 penta2_4_18 ///
	penta3_4_18 fullvax_4_18 pcv1_4_18 pcv2_4_18 pcv3_4_18)
	egen rota1_4_18=rowtotal(B84Rota10et11moisAvanc-B84Rota112et23moisMobi)
	egen rota2_4_18=rowtotal(B84Rota20et11moisAvanc-B84Rota212et23moisMobi)
	egen rota3_4_18=rowtotal(B84Rota30et11moisAvanc-B84Rota312et23moisMobi)
	drop B84Rota10et11moisAvanc-B84Rota312et23moisMobi
	rename (B84VAAAvril2018 B84VARAvril2018) (yf_4_18 mmr_4_18)
	drop B84VAR1RR1Avril2018 B84VAR2RR2Avril2018
	rename (B84VPIAvril2018-B84VPO3Avril2018) (ipv1_4_18 ipv2_4_18 opv0_4_18 ///
	opv1_4_18 opv2_4_18 opv3_4_18)
	merge 1:1 org* using "$user/RAW DATA/DRC/DHIS2/2018/DHIS2_2018"
	drop _merge
	save "$user/RAW DATA/DRC/DHIS2/2018/DHIS2_2018.dta", replace
* May	
	import excel using "$user/RAW DATA/DRC/DHIS2/2018/Mai 2018.xls", firstrow clear
	duplicates tag org*, g(tag)
	egen sum=rowtotal(B84BCGMai2018-B84VPO3Mai2018) if tag==1
	drop if tag==1 & sum==0
	drop tag sum
	rename (PopulationdelAiredeSantéMa-B84PCV133Mai2018) (popaire_5_18 bcg_5_18 penta1_5_18 penta2_5_18 ///
	penta3_5_18 fullvax_5_18 pcv1_5_18 pcv2_5_18 pcv3_5_18)
	egen rota1_5_18=rowtotal(B84Rota10et11moisAvanc-B84Rota112et23moisMobi)
	egen rota2_5_18=rowtotal(B84Rota20et11moisAvanc-B84Rota212et23moisMobi)
	egen rota3_5_18=rowtotal(B84Rota30et11moisAvanc-B84Rota312et23moisMobi)
	drop B84Rota10et11moisAvanc-B84Rota312et23moisMobi
	rename (B84VAAMai2018 B84VARMai2018) (yf_5_18 mmr_5_18)
	drop B84VAR1RR1Mai2018 B84VAR2RR2Mai2018
	rename (B84VPIMai2018-B84VPO3Mai2018) (ipv1_5_18 ipv2_5_18 opv0_5_18 ///
	opv1_5_18 opv2_5_18 opv3_5_18)
	merge 1:1 org* using "$user/RAW DATA/DRC/DHIS2/2018/DHIS2_2018"
	drop _merge
	save "$user/RAW DATA/DRC/DHIS2/2018/DHIS2_2018.dta", replace
* Jun	
	import excel using "$user/RAW DATA/DRC/DHIS2/2018/Juin 2018.xls", firstrow clear
	duplicates tag org*, g(tag)
	egen sum=rowtotal(B84BCGJuin2018-B84VPO3Juin2018) if tag==1
	drop if tag==1 & sum==0
	drop tag sum
	rename (PopulationdelAiredeSantéJu-B84PCV133Juin2018) (popaire_6_18 bcg_6_18 penta1_6_18 penta2_6_18 ///
	penta3_6_18 fullvax_6_18 pcv1_6_18 pcv2_6_18 pcv3_6_18)
	egen rota1_6_18=rowtotal(B84Rota10et11moisAvanc-B84Rota112et23moisMobi)
	egen rota2_6_18=rowtotal(B84Rota20et11moisAvanc-B84Rota212et23moisMobi)
	egen rota3_6_18=rowtotal(B84Rota30et11moisAvanc-B84Rota312et23moisMobi)
	drop B84Rota10et11moisAvanc-B84Rota312et23moisMobi
	rename (B84VAAJuin2018 B84VARJuin2018) (yf_6_18 mmr_6_18)
	drop B84VAR1RR1Juin2018 B84VAR2RR2Juin2018
	rename (B84VPIJuin2018-B84VPO3Juin2018) (ipv1_6_18 ipv2_6_18 opv0_6_18 ///
	opv1_6_18 opv2_6_18 opv3_6_18)
	merge 1:1 org* using "$user/RAW DATA/DRC/DHIS2/2018/DHIS2_2018"
	drop _merge
	save "$user/RAW DATA/DRC/DHIS2/2018/DHIS2_2018.dta", replace
*Jul	
	import excel using "$user/RAW DATA/DRC/DHIS2/2018/Juillet 2018.xls", firstrow clear
	duplicates tag org*, g(tag)
	egen sum=rowtotal(B84BCGJuillet2018-B84VPO3Juillet2018) if tag==1
	drop if tag==1 & sum==0
	drop tag sum 
	rename (PopulationdelAiredeSantéJu-B84PCV133Juillet2018) (popaire_7_18 bcg_7_18 penta1_7_18 penta2_7_18 ///
	penta3_7_18 fullvax_7_18 pcv1_7_18 pcv2_7_18 pcv3_7_18)
	egen rota1_7_18=rowtotal(B84Rota10et11moisAvanc-B84Rota112et23moisMobi)
	egen rota2_7_18=rowtotal(B84Rota20et11moisAvanc-B84Rota212et23moisMobi)
	egen rota3_7_18=rowtotal(B84Rota30et11moisAvanc-B84Rota312et23moisMobi)
	drop B84Rota10et11moisAvanc-B84Rota312et23moisMobi
	rename (B84VAAJuillet2018 B84VARJuillet2018) (yf_7_18 mmr_7_18)
	drop B84VAR1RR1Juillet2018 B84VAR2RR2Juillet2018
	rename (B84VPIJuillet2018-B84VPO3Juillet2018) (ipv1_7_18 ipv2_7_18 opv0_7_18 ///
	opv1_7_18 opv2_7_18 opv3_7_18)
	drop in 23226 // 1 remaining duplicates
	merge 1:1 org* using "$user/RAW DATA/DRC/DHIS2/2018/DHIS2_2018"
	drop _merge
	save "$user/RAW DATA/DRC/DHIS2/2018/DHIS2_2018.dta", replace
*Aug	
	import excel using "$user/RAW DATA/DRC/DHIS2/2018/Août 2018.xls", firstrow clear
	duplicates tag org*, g(tag)
	egen sum=rowtotal(B84BCGAoût2018-B84VPO3Août2018) if tag==1
	drop if tag==1 & sum==0
	drop tag sum
	rename (PopulationdelAiredeSantéAo-B84PCV133Août2018) (popaire_8_18 bcg_8_18 penta1_8_18 penta2_8_18 ///
	penta3_8_18 fullvax_8_18 pcv1_8_18 pcv2_8_18 pcv3_8_18)
	egen rota1_8_18=rowtotal(B84Rota10et11moisAvanc-B84Rota112et23moisMobi)
	egen rota2_8_18=rowtotal(B84Rota20et11moisAvanc-B84Rota212et23moisMobi)
	egen rota3_8_18=rowtotal(B84Rota30et11moisAvanc-B84Rota312et23moisMobi)
	drop B84Rota10et11moisAvanc-B84Rota312et23moisMobi
	rename (B84VAAAoût2018 B84VARAoût2018) (yf_8_18 mmr_8_18)
	drop B84VAR1RR1Août2018 B84VAR2RR2Août2018
	rename (B84VPIAoût2018-B84VPO3Août2018) (ipv1_8_18 ipv2_8_18 opv0_8_18 ///
	opv1_8_18 opv2_8_18 opv3_8_18)
	merge 1:1 org* using "$user/RAW DATA/DRC/DHIS2/2018/DHIS2_2018"
	drop _merge
	save "$user/RAW DATA/DRC/DHIS2/2018/DHIS2_2018.dta", replace
*Sep	
	import excel using "$user/RAW DATA/DRC/DHIS2/2018/Septembre 2018.xls", firstrow clear
	duplicates tag org*, g(tag)
	egen sum=rowtotal(B84BCGSeptembre2018-B84VPO3Septembre2018) if tag==1
	drop if tag==1 & sum==0
	drop tag sum 
	rename (PopulationdelAiredeSantéSe-B84PCV133Septembre2018) (popaire_9_18 bcg_9_18 penta1_9_18 penta2_9_18 ///
	penta3_9_18 fullvax_9_18 pcv1_9_18 pcv2_9_18 pcv3_9_18)
	egen rota1_9_18=rowtotal(B84Rota10et11moisAvanc-B84Rota112et23moisMobi)
	egen rota2_9_18=rowtotal(B84Rota20et11moisAvanc-B84Rota212et23moisMobi)
	egen rota3_9_18=rowtotal(B84Rota30et11moisAvanc-B84Rota312et23moisMobi)
	drop B84Rota10et11moisAvanc-B84Rota312et23moisMobi
	rename (B84VAASeptembre2018 B84VARSeptembre2018) (yf_9_18 mmr_9_18)
	drop B84VAR1RR1Septembre2018 B84VAR2RR2Septembre2018
	rename (B84VPISeptembre2018-B84VPO3Septembre2018) (ipv1_9_18 ipv2_9_18 opv0_9_18 ///
	opv1_9_18 opv2_9_18 opv3_9_18)
	merge 1:1 org* using "$user/RAW DATA/DRC/DHIS2/2018/DHIS2_2018"
	drop _merge
	save "$user/RAW DATA/DRC/DHIS2/2018/DHIS2_2018.dta", replace
*Oct	
	import excel using "$user/RAW DATA/DRC/DHIS2/2018/Octobre 2018.xls", firstrow clear
	duplicates tag org*, g(tag)
	egen sum=rowtotal(B84BCGOctobre2018-B84VPO3Octobre2018) if tag==1
	drop if tag==1 & sum==0
	drop tag sum 
	rename (PopulationdelAiredeSantéOc-B84PCV133Octobre2018) (popaire_10_18 bcg_10_18 penta1_10_18 penta2_10_18 ///
	penta3_10_18 fullvax_10_18 pcv1_10_18 pcv2_10_18 pcv3_10_18)
	egen rota1_10_18=rowtotal(B84Rota10et11moisAvanc-B84Rota112et23moisMobi)
	egen rota2_10_18=rowtotal(B84Rota20et11moisAvanc-B84Rota212et23moisMobi)
	egen rota3_10_18=rowtotal(B84Rota30et11moisAvanc-B84Rota312et23moisMobi)
	drop B84Rota10et11moisAvanc-B84Rota312et23moisMobi
	rename (B84VAAOctobre2018 B84VAROctobre2018) (yf_10_18 mmr_10_18)
	drop B84VAR1RR1Octobre2018 B84VAR2RR2Octobre2018
	rename (B84VPIOctobre2018-B84VPO3Octobre2018) (ipv1_10_18 ipv2_10_18 opv0_10_18 ///
	opv1_10_18 opv2_10_18 opv3_10_18)
	merge 1:1 org* using "$user/RAW DATA/DRC/DHIS2/2018/DHIS2_2018"
	drop _merge
	save "$user/RAW DATA/DRC/DHIS2/2018/DHIS2_2018.dta", replace
* Nov	
	import excel using "$user/RAW DATA/DRC/DHIS2/2018/Novembre 2018.xls", firstrow clear
	duplicates tag org*, g(tag)
	egen sum=rowtotal(B84BCGNovembre2018-B84VPO3Novembre2018) if tag==1
	drop if tag==1 & sum==0
	drop tag sum
	rename (PopulationdelAiredeSantéNo-B84PCV133Novembre2018) (popaire_11_18 bcg_11_18 penta1_11_18 penta2_11_18 ///
	penta3_11_18 fullvax_11_18 pcv1_11_18 pcv2_11_18 pcv3_11_18)
	egen rota1_11_18=rowtotal(B84Rota10et11moisAvanc-B84Rota112et23moisMobi)
	egen rota2_11_18=rowtotal(B84Rota20et11moisAvanc-B84Rota212et23moisMobi)
	egen rota3_11_18=rowtotal(B84Rota30et11moisAvanc-B84Rota312et23moisMobi)
	drop B84Rota10et11moisAvanc-B84Rota312et23moisMobi
	rename (B84VAANovembre2018 B84VARNovembre2018) (yf_11_18 mmr_11_18)
	drop B84VAR1RR1Novembre2018 B84VAR2RR2Novembre2018
	rename (B84VPINovembre2018-B84VPO3Novembre2018) (ipv1_11_18 ipv2_11_18 opv0_11_18 ///
	opv1_11_18 opv2_11_18 opv3_11_18)
	merge 1:1 org* using "$user/RAW DATA/DRC/DHIS2/2018/DHIS2_2018"
	drop _merge
	save "$user/RAW DATA/DRC/DHIS2/2018/DHIS2_2018.dta", replace
*Dec	
	import excel using "$user/RAW DATA/DRC/DHIS2/2018/Décembre 2018.xls", firstrow clear
	duplicates tag org*, g(tag)
	egen sum=rowtotal(B84BCGDécembre2018-B84VPO3Décembre2018) if tag==1
	drop if tag==1 & sum==0
	drop tag sum 
	rename (PopulationdelAiredeSantéDé-B84PCV133Décembre2018) (popaire_12_18 bcg_12_18 penta1_12_18 penta2_12_18 ///
	penta3_12_18 fullvax_12_18 pcv1_12_18 pcv2_12_18 pcv3_12_18)
	egen rota1_12_18=rowtotal(B84Rota10et11moisAvanc-B84Rota112et23moisMobi)
	egen rota2_12_18=rowtotal(B84Rota20et11moisAvanc-B84Rota212et23moisMobi)
	egen rota3_12_18=rowtotal(B84Rota30et11moisAvanc-B84Rota312et23moisMobi)
	drop B84Rota10et11moisAvanc-B84Rota312et23moisMobi
	rename (B84VAADécembre2018 B84VARDécembre2018) (yf_12_18 mmr_12_18)
	drop B84VAR1RR1Décembre2018 B84VAR2RR2Décembre2018
	rename (B84VPIDécembre2018-B84VPO3Décembre2018) (ipv1_12_18 ipv2_12_18 opv0_12_18 ///
	opv1_12_18 opv2_12_18 opv3_12_18)
	merge 1:1 org* using "$user/RAW DATA/DRC/DHIS2/2018/DHIS2_2018"
	drop _merge
	save "$user/RAW DATA/DRC/DHIS2/2018/DHIS2_2018.dta", replace

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
		
		foreach v in 1_18 2_18 3_18 4_18 5_18 6_18 7_18 8_18 9_18 10_18 11_18 12_18  { 
			gen flag_outlier`x'`v'= 1 if `x'`v'>pos_out`x' & `x'`v'<. 
			replace flag_outlier`x'`v' =. if `x'`v' <100 // replaces flag to . if volument < 100
			replace `x'`v'=. if flag_outlier`x'`v'==1 // replaces value to missing if flag is 1
	}
	drop rowmean`x' rowsd`x' pos_out`x'  flag_outlier`x'* 
}
	save "$user/RAW DATA/DRC/DHIS2/2018/DHIS2_2018.dta", replace
















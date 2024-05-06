	
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
	merge 1:1 org* using "$user/RAW DATA/DRC/DHIS2/2019/DHIS2_2019"
	drop _merge
	save "$user/RAW DATA/DRC/DHIS2/2019/DHIS2_2019.dta", replace
*Sep	
	import excel using "$user/RAW DATA/DRC/DHIS2/2019/Septembre 2019.xls", firstrow clear
	duplicates tag org*, g(tag)
	egen sum=rowtotal(B84BCGSeptembre2019-B84VPO3Septembre2019) if tag==1
	drop if tag==1 & sum==0
	drop tag sum 
	merge 1:1 org* using "$user/RAW DATA/DRC/DHIS2/2019/DHIS2_2019"
	drop _merge
	save "$user/RAW DATA/DRC/DHIS2/2019/DHIS2_2019.dta", replace
*Oct	
	import excel using "$user/RAW DATA/DRC/DHIS2/2019/Octobre 2019.xls", firstrow clear
	duplicates tag org*, g(tag)
	egen sum=rowtotal(B84BCGOctobre2019-B84VPO3Octobre2019) if tag==1
	drop if tag==1 & sum==0
	drop tag sum 
	merge 1:1 org* using "$user/RAW DATA/DRC/DHIS2/2019/DHIS2_2019"
	drop _merge
	save "$user/RAW DATA/DRC/DHIS2/2019/DHIS2_2019.dta", replace
* Nov	
	import excel using "$user/RAW DATA/DRC/DHIS2/2019/Novembre 2019.xls", firstrow clear
	duplicates tag org*, g(tag)
	egen sum=rowtotal(B84BCGNovembre2019-B84VPO3Novembre2019) if tag==1
	drop if tag==1 & sum==0
	drop tag sum 
	merge 1:1 org* using "$user/RAW DATA/DRC/DHIS2/2019/DHIS2_2019"
	drop _merge
	save "$user/RAW DATA/DRC/DHIS2/2019/DHIS2_2019.dta", replace
*Dec	
	import excel using "$user/RAW DATA/DRC/DHIS2/2019/Décembre 2019.xls", firstrow clear
	duplicates tag org*, g(tag)
	egen sum=rowtotal(B84BCGDécembre2019-B84VPO3Décembre2019) if tag==1
	drop if tag==1 & sum==0
	drop tag sum 
	merge 1:1 org* using "$user/RAW DATA/DRC/DHIS2/2019/DHIS2_2019"
	drop _merge
	save "$user/RAW DATA/DRC/DHIS2/2019/DHIS2_2019.dta", replace

*-------------------------------------------------------------------------------
* 2020
	import excel using "$user/RAW DATA/DRC/DHIS2/2020/Janvier 2020.xls", firstrow clear
	duplicates tag org*, g(tag)
	egen sum=rowtotal(B84BCGJanvier2020-B84VPO3Janvier2020) if tag==1
	drop if tag==1 & sum==0
	drop tag sum 
save "$user/RAW DATA/DRC/DHIS2/2020/DHIS2_2020.dta", replace

	import excel using "$user/RAW DATA/DRC/DHIS2/2020/Février 2020.xls", firstrow clear
	duplicates tag org*, g(tag)
	egen sum=rowtotal(B84BCGFévrier2020-B84VPO3Février2020) if tag==1
	drop if tag==1 & sum==0
	drop tag sum 
	merge 1:1 org* using "$user/RAW DATA/DRC/DHIS2/2020/DHIS2_2020"
	drop _merge
	
	import excel using "$user/RAW DATA/DRC/DHIS2/2020/Mars 2020.xls", firstrow clear
	duplicates tag org*, g(tag)
	egen sum=rowtotal(B84BCGMars2020-B84VPO3Mars2020) if tag==1
	drop if tag==1 & sum==0
	drop tag sum 
	merge 1:1 org* using "$user/RAW DATA/DRC/DHIS2/2020/DHIS2_2020"
	drop _merge
	
	import excel using "$user/RAW DATA/DRC/DHIS2/2020/Avril 2020.xls", firstrow clear
	duplicates tag org*, g(tag)
	egen sum=rowtotal(B84BCGAvril2020-B84VPO3Avril2020) if tag==1
	drop if tag==1 & sum==0
	drop tag sum 
	merge 1:1 org* using "$user/RAW DATA/DRC/DHIS2/2020/DHIS2_2020"
	drop _merge
	
	import excel using "$user/RAW DATA/DRC/DHIS2/2020/Mai 2020.xls", firstrow clear
	duplicates tag org*, g(tag)
	egen sum=rowtotal(B84BCGMai2020-B84VPO3Mai2020) if tag==1
	drop if tag==1 & sum==0
	drop tag sum 
	merge 1:1 org* using "$user/RAW DATA/DRC/DHIS2/2020/DHIS2_2020"
	drop _merge
	
	import excel using "$user/RAW DATA/DRC/DHIS2/2020/Juin 2020.xls", firstrow clear
	duplicates tag org*, g(tag)
	egen sum=rowtotal(B84BCGJuin2020-B84VPO3Juin2020) if tag==1
	drop if tag==1 & sum==0
	drop tag sum 
	merge 1:1 org* using "$user/RAW DATA/DRC/DHIS2/2020/DHIS2_2020"
	drop _merge
	
	import excel using "$user/RAW DATA/DRC/DHIS2/2020/Juillet 2020.xls", firstrow clear
	duplicates tag org*, g(tag)
	egen sum=rowtotal(B84BCGJuillet2020-B84VPO3Juillet2020) if tag==1
	drop if tag==1 & sum==0
	drop in 23149 // remaining duplicate
	drop tag sum 
	merge 1:1 org* using "$user/RAW DATA/DRC/DHIS2/2020/DHIS2_2020"
	drop _merge
	
	import excel using "$user/RAW DATA/DRC/DHIS2/2020/Août 2020.xls", firstrow clear
	duplicates tag org*, g(tag)
	egen sum=rowtotal(B84BCGAoût2020-B84VPO3Août2020) if tag==1
	drop if tag==1 & sum==0
	drop tag sum 
	merge 1:1 org* using "$user/RAW DATA/DRC/DHIS2/2020/DHIS2_2020"
	drop _merge
	
	import excel using "$user/RAW DATA/DRC/DHIS2/2020/Septembre 2020.xls", firstrow clear
	duplicates tag org*, g(tag)
	egen sum=rowtotal(B84BCGSeptembre2020-B84VPO3Septembre2020) if tag==1
	drop if tag==1 & sum==0
	drop tag sum 
	merge 1:1 org* using "$user/RAW DATA/DRC/DHIS2/2020/DHIS2_2020"
	drop _merge
	
	import excel using "$user/RAW DATA/DRC/DHIS2/2020/Octobre 2020.xls", firstrow clear
	duplicates tag org*, g(tag)
	egen sum=rowtotal(B84BCGOctobre2020-B84VPO3Octobre2020) if tag==1
	drop if tag==1 & sum==0
	drop tag sum 
	merge 1:1 org* using "$user/RAW DATA/DRC/DHIS2/2020/DHIS2_2020"
	drop _merge
	
	import excel using "$user/RAW DATA/DRC/DHIS2/2020/Novembre 2020.xls", firstrow clear
	duplicates tag org*, g(tag)
	egen sum=rowtotal(B84BCGNovembre2020-B84VPO3Novembre2020) if tag==1
	drop if tag==1 & sum==0
	drop tag sum 
	merge 1:1 org* using "$user/RAW DATA/DRC/DHIS2/2020/DHIS2_2020"
	drop _merge
	
	import excel using "$user/RAW DATA/DRC/DHIS2/2020/Décembre 2020.xls", firstrow clear
	duplicates tag org*, g(tag)
	egen sum=rowtotal(B84BCGDécembre2020-B84VPO3Décembre2020) if tag==1
	drop if tag==1 & sum==0
	drop tag sum 
	merge 1:1 org* using "$user/RAW DATA/DRC/DHIS2/2020/DHIS2_2020"
	drop _merge
	
*-------------------------------------------------------------------------------
* 2021
	import excel using "$user/RAW DATA/DRC/DHIS2/2021/Janvier 2021.xls", firstrow clear
	duplicates tag org*, g(tag)
	egen sum=rowtotal(B84BCGJanvier2021-B84VPO3Janvier2021) if tag==1
	drop if tag==1 & sum==0
	drop tag sum 
save "$user/RAW DATA/DRC/DHIS2/2021/DHIS2_2021.dta", replace

	import excel using "$user/RAW DATA/DRC/DHIS2/2021/Février 2021.xls", firstrow clear
	duplicates tag org*, g(tag)
	egen sum=rowtotal(B84BCGFévrier2021-B84VPO3Février2021) if tag==1
	drop if tag==1 & sum==0
	drop tag sum 
	merge 1:1 org* using "$user/RAW DATA/DRC/DHIS2/2021/DHIS2_2021"
	drop _merge
	
	import excel using "$user/RAW DATA/DRC/DHIS2/2021/Mars 2021.xls", firstrow clear
	duplicates tag org*, g(tag)
	egen sum=rowtotal(B84BCGMars2021-B84VPO3Mars2021) if tag==1
	drop if tag==1 & sum==0
	drop tag sum 
	merge 1:1 org* using "$user/RAW DATA/DRC/DHIS2/2021/DHIS2_2021"
	drop _merge
	
	import excel using "$user/RAW DATA/DRC/DHIS2/2021/Avril 2021.xls", firstrow clear
	duplicates tag org*, g(tag)
	egen sum=rowtotal(B84BCGAvril2021-B84VPO3Avril2021) if tag==1
	drop if tag==1 & sum==0
	drop tag sum 
	merge 1:1 org* using "$user/RAW DATA/DRC/DHIS2/2021/DHIS2_2021"
	drop _merge
	
	import excel using "$user/RAW DATA/DRC/DHIS2/2021/Mai 2021.xls", firstrow clear
	duplicates tag org*, g(tag)
	egen sum=rowtotal(B84BCGMai2021-B84VPO3Mai2021) if tag==1
	drop if tag==1 & sum==0
	drop tag sum 
	merge 1:1 org* using "$user/RAW DATA/DRC/DHIS2/2021/DHIS2_2021"
	drop _merge
	
	import excel using "$user/RAW DATA/DRC/DHIS2/2021/Juin 2021.xls", firstrow clear
	duplicates tag org*, g(tag)
	egen sum=rowtotal(B84BCGJuin2021-B84VPO3Juin2021) if tag==1
	drop if tag==1 & sum==0
	drop tag sum 
	merge 1:1 org* using "$user/RAW DATA/DRC/DHIS2/2021/DHIS2_2021"
	drop _merge
	
	import excel using "$user/RAW DATA/DRC/DHIS2/2021/Juillet 2021.xls", firstrow clear
	duplicates tag org*, g(tag)
	egen sum=rowtotal(B84BCGJuillet2021-B84VPO3Juillet2021) if tag==1
	drop if tag==1 & sum==0
	drop tag sum 
	merge 1:1 org* using "$user/RAW DATA/DRC/DHIS2/2021/DHIS2_2021"
	drop _merge
	
	import excel using "$user/RAW DATA/DRC/DHIS2/2021/Août 2021.xls", firstrow clear
	duplicates tag org*, g(tag)
	egen sum=rowtotal(B84BCGAoût2021-B84VPO3Août2021) if tag==1
	drop if tag==1 & sum==0
	drop in 23012
	drop tag sum 
	merge 1:1 org* using "$user/RAW DATA/DRC/DHIS2/2021/DHIS2_2021"
	drop _merge
	
	import excel using "$user/RAW DATA/DRC/DHIS2/2021/Septembre 2021.xls", firstrow clear
	duplicates tag org*, g(tag)
	egen sum=rowtotal(B84BCGSeptembre2021-B84VPO3Septembre2021) if tag==1
	drop if tag==1 & sum==0
	drop tag sum 
	merge 1:1 org* using "$user/RAW DATA/DRC/DHIS2/2021/DHIS2_2021"
	drop _merge
	
	import excel using "$user/RAW DATA/DRC/DHIS2/2021/Octobre 2021.xls", firstrow clear
	duplicates tag org*, g(tag)
	egen sum=rowtotal(B84BCGOctobre2021-B84VPO3Octobre2021) if tag==1
	drop if tag==1 & sum==0
	drop tag sum 
	merge 1:1 org* using "$user/RAW DATA/DRC/DHIS2/2021/DHIS2_2021"
	drop _merge
	
	import excel using "$user/RAW DATA/DRC/DHIS2/2021/Novembre 2021.xls", firstrow clear
	duplicates tag org*, g(tag)
	egen sum=rowtotal(B84BCGNovembre2021-B84VPO3Novembre2021) if tag==1
	drop if tag==1 & sum==0
	drop tag sum 
	merge 1:1 org* using "$user/RAW DATA/DRC/DHIS2/2021/DHIS2_2021"
	drop _merge
	
	import excel using "$user/RAW DATA/DRC/DHIS2/2021/Décembre 2021.xls", firstrow clear
	duplicates tag org*, g(tag)
	egen sum=rowtotal(B84BCGDécembre2021-B84VPO3Décembre2021) if tag==1
	drop if tag==1 & sum==0
	drop tag sum 
	merge 1:1 org* using "$user/RAW DATA/DRC/DHIS2/2021/DHIS2_2021"
	drop _merge
	
*-------------------------------------------------------------------------------
* 2022
	import excel using "$user/RAW DATA/DRC/DHIS2/2022/Janvier 2022.xls", firstrow clear
	duplicates tag org*, g(tag)
	egen sum=rowtotal(B84BCGJanvier2022-B84VPO3Janvier2022) if tag==1
	drop if tag==1 & sum==0
	drop tag sum 
save "$user/RAW DATA/DRC/DHIS2/2022/DHIS2_2022.dta", replace

	import excel using "$user/RAW DATA/DRC/DHIS2/2022/Février 2022.xls", firstrow clear
	duplicates tag org*, g(tag)
	egen sum=rowtotal(B84BCGFévrier2022-B84VPO3Février2022) if tag==1
	drop if tag==1 & sum==0
	drop tag sum 
	merge 1:1 org* using "$user/RAW DATA/DRC/DHIS2/2022/DHIS2_2022"
	drop _merge
	
	import excel using "$user/RAW DATA/DRC/DHIS2/2022/Mars 2022.xls", firstrow clear
	duplicates tag org*, g(tag)
	egen sum=rowtotal(B84BCGMars2022-B84VPO3Mars2022) if tag==1
	drop if tag==1 & sum==0
	drop tag sum 
	merge 1:1 org* using "$user/RAW DATA/DRC/DHIS2/2022/DHIS2_2022"
	drop _merge
	
	import excel using "$user/RAW DATA/DRC/DHIS2/2022/Avril 2022.xls", firstrow clear
	duplicates tag org*, g(tag)
	egen sum=rowtotal(B84BCGAvril2022-B84VPO3Avril2022) if tag==1
	drop if tag==1 & sum==0
	drop tag sum 
	merge 1:1 org* using "$user/RAW DATA/DRC/DHIS2/2022/DHIS2_2022"
	drop _merge
	
	import excel using "$user/RAW DATA/DRC/DHIS2/2022/Mai 2022.xls", firstrow clear
	duplicates tag org*, g(tag)
	egen sum=rowtotal(B84BCGMai2022-B84VPO3Mai2022) if tag==1
	drop if tag==1 & sum==0
	drop tag sum 
	merge 1:1 org* using "$user/RAW DATA/DRC/DHIS2/2022/DHIS2_2022"
	drop _merge
	
	import excel using "$user/RAW DATA/DRC/DHIS2/2022/Juin 2022.xls", firstrow clear
	duplicates tag org*, g(tag)
	egen sum=rowtotal(B84BCGJuin2022-B84VPO3Juin2022) if tag==1
	drop if tag==1 & sum==0
	drop tag sum 
	merge 1:1 org* using "$user/RAW DATA/DRC/DHIS2/2022/DHIS2_2022"
	drop _merge
	
	import excel using "$user/RAW DATA/DRC/DHIS2/2022/Juillet 2022.xls", firstrow clear
	duplicates tag org*, g(tag)
	egen sum=rowtotal(B84BCGJuillet2022-B84VPO3Juillet2022) if tag==1
	drop if tag==1 & sum==0
	drop tag sum 
	merge 1:1 org* using "$user/RAW DATA/DRC/DHIS2/2022/DHIS2_2022"
	drop _merge
	
	import excel using "$user/RAW DATA/DRC/DHIS2/2022/Août 2022.xls", firstrow clear
	duplicates tag org*, g(tag)
	egen sum=rowtotal(B84BCGAoût2022-B84VPO3Août2022) if tag==1
	drop if tag==1 & sum==0
	drop tag sum 
	merge 1:1 org* using "$user/RAW DATA/DRC/DHIS2/2022/DHIS2_2022"
	drop _merge
	
	import excel using "$user/RAW DATA/DRC/DHIS2/2022/Septembre 2022.xls", firstrow clear
	duplicates tag org*, g(tag)
	egen sum=rowtotal(B84BCGSeptembre2022-B84VPO3Septembre2022) if tag==1
	drop if tag==1 & sum==0
	drop tag sum 
	merge 1:1 org* using "$user/RAW DATA/DRC/DHIS2/2022/DHIS2_2022"
	drop _merge
	
	import excel using "$user/RAW DATA/DRC/DHIS2/2022/Octobre 2022.xls", firstrow clear
	duplicates tag org*, g(tag)
	egen sum=rowtotal(B84BCGOctobre2022-B84VPO3Octobre2022) if tag==1
	drop if tag==1 & sum==0
	drop tag sum 
	merge 1:1 org* using "$user/RAW DATA/DRC/DHIS2/2022/DHIS2_2022"
	drop _merge
	
	import excel using "$user/RAW DATA/DRC/DHIS2/2022/Novembre 2022.xls", firstrow clear
	duplicates tag org*, g(tag)
	egen sum=rowtotal(B84BCGNovembre2022-B84VPO3Novembre2022) if tag==1
	drop if tag==1 & sum==0
	drop tag sum 
	merge 1:1 org* using "$user/RAW DATA/DRC/DHIS2/2022/DHIS2_2022"
	drop _merge
	
	import excel using "$user/RAW DATA/DRC/DHIS2/2022/Décembre 2022.xls", firstrow clear
	duplicates tag org*, g(tag)
	egen sum=rowtotal(B84BCGDécembre2022-B84VPO3Décembre2022) if tag==1
	drop if tag==1 & sum==0
	drop tag sum 
	merge 1:1 org* using "$user/RAW DATA/DRC/DHIS2/2022/DHIS2_2022"
	drop _merge
*-------------------------------------------------------------------------------
* 2023
	import excel using "$user/RAW DATA/DRC/DHIS2/2023/Janvier 2023.xls", firstrow clear
	duplicates tag org*, g(tag)
	egen sum=rowtotal(B84BCGJanvier2023-B84VPO3Janvier2023) if tag==1
	drop if tag==1 & sum==0
	drop tag sum 
save "$user/RAW DATA/DRC/DHIS2/2023/DHIS2_2023.dta", replace

	import excel using "$user/RAW DATA/DRC/DHIS2/2023/Février 2023.xls", firstrow clear
	duplicates tag org*, g(tag)
	egen sum=rowtotal(B84BCGFévrier2023-B84VPO3Février2023) if tag==1
	drop if tag==1 & sum==0
	drop tag sum 
	merge 1:1 org* using "$user/RAW DATA/DRC/DHIS2/2023/DHIS2_2023"
	drop _merge
	
	import excel using "$user/RAW DATA/DRC/DHIS2/2023/Mars 2023.xls", firstrow clear
	duplicates tag org*, g(tag)
	egen sum=rowtotal(B84BCGMars2023-B84VPO3Mars2023) if tag==1
	drop if tag==1 & sum==0
	drop tag sum 
	merge 1:1 org* using "$user/RAW DATA/DRC/DHIS2/2023/DHIS2_2023"
	drop _merge
	
	import excel using "$user/RAW DATA/DRC/DHIS2/2023/Avril 2023.xls", firstrow clear
	duplicates tag org*, g(tag)
	egen sum=rowtotal(B84BCGAvril2023-B84VPO3Avril2023) if tag==1
	drop if tag==1 & sum==0
	drop tag sum 
	merge 1:1 org* using "$user/RAW DATA/DRC/DHIS2/2023/DHIS2_2023"
	drop _merge
	
	import excel using "$user/RAW DATA/DRC/DHIS2/2023/Mai 2023.xls", firstrow clear
	duplicates tag org*, g(tag)
	egen sum=rowtotal(B84BCGMai2023-B84VPO3Mai2023) if tag==1
	drop if tag==1 & sum==0
	drop tag sum 
	merge 1:1 org* using "$user/RAW DATA/DRC/DHIS2/2023/DHIS2_2023"
	drop _merge
	
	import excel using "$user/RAW DATA/DRC/DHIS2/2023/Juin 2023.xls", firstrow clear
	duplicates tag org*, g(tag)
	egen sum=rowtotal(B84BCGJuin2023-B84VPO3Juin2023) if tag==1
	drop if tag==1 & sum==0
	drop tag sum 
	merge 1:1 org* using "$user/RAW DATA/DRC/DHIS2/2023/DHIS2_2023"
	drop _merge
	
	import excel using "$user/RAW DATA/DRC/DHIS2/2023/Juillet 2023.xls", firstrow clear
	duplicates tag org*, g(tag)
	egen sum=rowtotal(B84BCGJuillet2023-B84VPO3Juillet2023) if tag==1
	drop if tag==1 & sum==0
	drop tag sum 
	merge 1:1 org* using "$user/RAW DATA/DRC/DHIS2/2023/DHIS2_2023"
	drop _merge
	
	import excel using "$user/RAW DATA/DRC/DHIS2/2023/Août 2023.xls", firstrow clear
	duplicates tag org*, g(tag)
	egen sum=rowtotal(B84BCGAoût2023-B84VPO3Août2023) if tag==1
	drop if tag==1 & sum==0
	drop tag sum 
	merge 1:1 org* using "$user/RAW DATA/DRC/DHIS2/2023/DHIS2_2023"
	drop _merge
	
	import excel using "$user/RAW DATA/DRC/DHIS2/2023/Septembre 2023.xls", firstrow clear
	duplicates tag org*, g(tag)
	egen sum=rowtotal(B84BCGSeptembre2023-B84VPO3Septembre2023) if tag==1
	drop if tag==1 & sum==0
	drop tag sum 
	merge 1:1 org* using "$user/RAW DATA/DRC/DHIS2/2023/DHIS2_2023"
	drop _merge
	
	import excel using "$user/RAW DATA/DRC/DHIS2/2023/Octobre 2023.xls", firstrow clear
	duplicates tag org*, g(tag)
	egen sum=rowtotal(B84BCGOctobre2023-B84VPO3Octobre2023) if tag==1
	drop if tag==1 & sum==0
	drop tag sum 
	merge 1:1 org* using "$user/RAW DATA/DRC/DHIS2/2023/DHIS2_2023"
	drop _merge
	
	import excel using "$user/RAW DATA/DRC/DHIS2/2023/Novembre 2023.xls", firstrow clear
	duplicates tag org*, g(tag)
	egen sum=rowtotal(B84BCGNovembre2023-B84VPO3Novembre2023) if tag==1
	drop if tag==1 & sum==0
	drop tag sum 
	merge 1:1 org* using "$user/RAW DATA/DRC/DHIS2/2023/DHIS2_2023"
	drop _merge
	
	import excel using "$user/RAW DATA/DRC/DHIS2/2023/Décembre 2023.xls", firstrow clear
	duplicates tag org*, g(tag)
	egen sum=rowtotal(B84BCGDécembre2023-B84VPO3Décembre2023) if tag==1
	drop if tag==1 & sum==0
	drop tag sum 
	merge 1:1 org* using "$user/RAW DATA/DRC/DHIS2/2023/DHIS2_2023"
	drop _merge

*-------------------------------------------------------------------------------
* Combining all five years 

	u "$user/RAW DATA/DRC/DHIS2/2019/DHIS2_2019.dta", clear
	merge 1:1 org* using "$user/RAW DATA/DRC/DHIS2/2020/DHIS2_2020.dta"
		drop _merge
	merge 1:1 org* using "$user/RAW DATA/DRC/DHIS2/2021/DHIS2_2021.dta"
		drop _merge
	merge 1:1 org* using "$user/RAW DATA/DRC/DHIS2/2022/DHIS2_2022.dta"
		drop _merge
	merge 1:1 org* using "$user/RAW DATA/DRC/DHIS2/2023/DHIS2_2023.dta"
		drop _merge
	
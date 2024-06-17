global user "/Users/catherine.arsenault/Dropbox/BMGF RISP Project/Quant analysis/"

*-------------------------------------------------------------------------------
* Combining all five years 

	u "$user/RAW DATA/DRC/DHIS2/2018/DHIS2_2018.dta", clear
	merge 1:1 org* using "$user/RAW DATA/DRC/DHIS2/2019/DHIS2_2019.dta"
		drop _merge
	merge 1:1 org* using "$user/RAW DATA/DRC/DHIS2/2020/DHIS2_2020.dta"
		drop _merge
	merge 1:1 org* using "$user/RAW DATA/DRC/DHIS2/2021/DHIS2_2021.dta"
		drop _merge
	merge 1:1 org* using "$user/RAW DATA/DRC/DHIS2/2022/DHIS2_2022.dta"
		drop _merge
	merge 1:1 org* using "$user/RAW DATA/DRC/DHIS2/2023/DHIS2_2023.dta"
		drop _merge
		
	save  "$user/RAW DATA/DRC/DHIS2/DHIS2_2018-2023.dta", replace
	
	
*-------------------------------------------------------------------------------
* Reshape

reshape long popaire_ bcg_ penta1_ penta2_ penta3_ fullvax_ pcv1_ pcv2_ pcv3_ yf_ mmr_ ipv1_ ///
		   ipv2_ opv0_ opv1_ opv2_ opv3_ rota1_ rota2_ rota3_ , i(org*) j(month, string)
		   
*-------------------------------------------------------------------------------
* Label months	   
g year = 2018 if month=="1_18" | month=="2_18"  | month=="3_18" | month=="4_18" ///
			| month=="5_18" | month=="6_18"| month=="7_18"  | month=="8_18" | ///
			month=="9_18" | month=="10_18" | month=="11_18" | month=="12_18"		   
replace year = 2019 if month=="1_19" | month=="2_19"  | month=="3_19" | month=="4_19" ///
			| month=="5_19" | month=="6_19"| month=="7_19"  | month=="8_19" | ///
			month=="9_19" | month=="10_19" | month=="11_19" | month=="12_19"
replace year = 2020 if month=="1_20" | month=="2_20"  | month=="3_20" | month=="4_20" ///
			| month=="5_20" | month=="6_20"| month=="7_20"  | month=="8_20" | ///
			month=="9_20" | month=="10_20" | month=="11_20" | month=="12_20"
replace year = 2021 if month=="1_21" | month=="2_21"  | month=="3_21" | month=="4_21" ///
			| month=="5_21" | month=="6_21"| month=="7_21"  | month=="8_21" | ///
			month=="9_21" | month=="10_21" | month=="11_21" | month=="12_21"
replace year = 2022 if month=="1_22" | month=="2_22"  | month=="3_22" | month=="4_22" ///
			| month=="5_22" | month=="6_22"| month=="7_22"  | month=="8_22" | ///
			month=="9_22" | month=="10_22" | month=="11_22" | month=="12_22"
replace year = 2023 if month=="1_23" | month=="2_23"  | month=="3_23" | month=="4_23" ///
			| month=="5_23" | month=="6_23"| month=="7_23"  | month=="8_23" | ///
			month=="9_23" | month=="10_23" | month=="11_23" | month=="12_23"
	
gen mo =1 if month=="1_18" | month=="1_19" | month=="1_20" 	| month=="1_21" | month=="1_22"  | month=="1_23" 
replace mo = 2 if month=="2_18" | month=="2_19" | month=="2_20" 	| month=="2_21" | month=="2_22"  | month=="2_23" 
replace mo = 3 if month=="3_18" | month=="3_19" | month=="3_20" 	| month=="3_21" | month=="3_22"  | month=="3_23" 
replace mo = 4 if month=="4_18" | month=="4_19" | month=="4_20" 	| month=="4_21" | month=="4_22"  | month=="4_23" 
replace mo = 5 if month=="5_18" | month=="5_19" | month=="5_20" 	| month=="5_21" | month=="5_22"  | month=="5_23" 
replace mo = 6 if month=="6_18" | month=="6_19" | month=="6_20" 	| month=="6_21" | month=="6_22"  | month=="6_23" 
replace mo = 7 if month=="7_18" | month=="7_19" | month=="7_20" 	| month=="7_21" | month=="7_22"  | month=="7_23" 
replace mo = 8 if month=="8_18" | month=="8_19" | month=="8_20" 	| month=="8_21" | month=="8_22"  | month=="8_23" 
replace mo = 9 if month=="9_18" | month=="9_19" | month=="9_20" 	| month=="9_21" | month=="9_22"  | month=="9_23" 
replace mo = 10 if month=="10_18" | month=="10_19" | month=="10_20" 	| month=="10_21" | month=="10_22"  | month=="10_23" 
replace mo = 11 if month=="11_18" | month=="11_19" | month=="11_20" 	| month=="11_21" | month=="11_22"  | month=="11_23" 
replace mo = 12 if month=="12_18" | month=="12_19" | month=="12_20" 	| month=="12_21" | month=="12_22"  | month=="12_23" 


gen rmonth =1 if mo == 1  & year==2018
replace rmonth =2 if mo == 2 & year==2018
replace rmonth =3 if mo == 3 & year==2018
replace rmonth =4 if mo == 4 & year==2018
replace rmonth =5 if mo == 5 & year==2018
replace rmonth =6 if mo == 6 & year==2018
replace rmonth =7 if mo == 7 & year==2018
replace rmonth =8 if mo == 8 & year==2018
replace rmonth =9 if mo == 9 & year==2018
replace rmonth =10 if mo == 10 & year==2018
replace rmonth =11 if mo == 11 & year==2018
replace rmonth =12 if mo == 12 & year==2018
replace rmonth =13 if mo == 1 & year==2019
replace rmonth =14 if mo == 2 & year==2019
replace rmonth =15 if mo == 3 & year==2019
replace rmonth =16 if mo == 4 & year==2019
replace rmonth =17 if mo == 5 & year==2019
replace rmonth =18 if mo == 6 & year==2019
replace rmonth =19 if mo == 7 & year==2019
replace rmonth =20 if mo == 8 & year==2019
replace rmonth =21 if mo == 9 & year==2019
replace rmonth =22 if mo == 10 & year==2019
replace rmonth =23 if mo == 11 & year==2019
replace rmonth =24 if mo == 12 & year==2019
replace rmonth =25 if mo == 1 & year==2020
replace rmonth =26 if mo == 2 & year==2020
replace rmonth =27 if mo == 3 & year==2020
replace rmonth =28 if mo == 4 & year==2020
replace rmonth =29 if mo == 5 & year==2020
replace rmonth =30 if mo == 6 & year==2020
replace rmonth =31 if mo == 7 & year==2020
replace rmonth =32 if mo == 8 & year==2020
replace rmonth =33 if mo == 9 & year==2020
replace rmonth =34 if mo == 10 & year==2020
replace rmonth =35 if mo == 11 & year==2020
replace rmonth =36 if mo == 12 & year==2020
replace rmonth =37 if mo == 1 & year==2021
replace rmonth =38 if mo == 2 & year==2021
replace rmonth =39 if mo == 3 & year==2021
replace rmonth =40 if mo == 4 & year==2021
replace rmonth =41 if mo == 5 & year==2021
replace rmonth =42 if mo == 6 & year==2021
replace rmonth =43 if mo == 7 & year==2021
replace rmonth =44 if mo == 8 & year==2021
replace rmonth =45 if mo == 9 & year==2021
replace rmonth =46 if mo == 10 & year==2021
replace rmonth =47 if mo == 11 & year==2021
replace rmonth =48 if mo == 12 & year==2021
replace rmonth =49 if mo == 1 & year==2022
replace rmonth =50 if mo == 2 & year==2022
replace rmonth =51 if mo == 3 & year==2022
replace rmonth =52 if mo == 4 & year==2022
replace rmonth =53 if mo == 5 & year==2022
replace rmonth =54 if mo == 6 & year==2022
replace rmonth =55 if mo == 7 & year==2022
replace rmonth =56 if mo == 8 & year==2022
replace rmonth =57 if mo == 9 & year==2022
replace rmonth =58 if mo == 10 & year==2022
replace rmonth =59 if mo == 11 & year==2022
replace rmonth =60 if mo == 12 & year==2022
replace rmonth =61 if mo == 1 & year==2023
replace rmonth =62 if mo == 2 & year==2023
replace rmonth =63 if mo == 3 & year==2023
replace rmonth =64 if mo == 4 & year==2023
replace rmonth =65 if mo == 5 & year==2023
replace rmonth =66 if mo == 6 & year==2023
replace rmonth =67 if mo == 7 & year==2023
replace rmonth =68 if mo == 8 & year==2023
replace rmonth =69 if mo == 9 & year==2023
replace rmonth =70 if mo == 10 & year==2023
replace rmonth =71 if mo == 11 & year==2023
replace rmonth =72 if mo == 12 & year==2023

encode orgunitlevel2, g(province)
order province, after(orgunitlevel1)
	save  "$user/RAW DATA/DRC/DHIS2/DHIS2_2018-2023_long.dta", replace

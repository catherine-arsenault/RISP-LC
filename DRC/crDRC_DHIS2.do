	
* Analyses of DHIS2 vaccination data DRC Jan 2019 - December 2023
* Created Mar 22, 2024
*-------------------------------------------------------------------------------
	global user "/Users/catherine.arsenault/Dropbox/BMGF RISP Project/Quant analysis/RAW DATA/DRC"
	
	import excel using "$user/DHIS2/2019/Niveau d'organisation 2019.xls", firstrow clear
	save "$user/DHIS2/2019/DHIS2_2019.dta", replace
	import excel using "$user/DHIS2/2019/Janvier 2019.xls", firstrow clear
	
	merge m:m organisationunitname using "$user/DHIS2/2019/DHIS2_2019.dta"
	
	order orgunitlevel1 orgunitlevel2 orgunitlevel3 orgunitlevel4 orgunitlevel5, before(organisationunitname)


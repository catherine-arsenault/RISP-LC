	global user  "/Users/catherine.arsenault/Dropbox/BMGF RISP Project/Quant analysis/"
	
* DIFF-IN-DIFF ANALYSIS
*---------------------------------------------------------------------------
	
	/* The model includes the following  
		1. Time-varying intervention dummy (MOU had been implemented or not)
			For the purpose of this analysis, we assign MOU in HL and TAN at Jan 2019 onward.
			In Lualaba, Jan 2022 is the beginning of the MOU.
			
		2. Time variable = dummy for each month 1 to 72
		
		3. Province dummy (initial Mashako Provinces + MOU provinces)
		
		The coefficient of interest (effect of the MOU program) is the intervention dummy. 
		
		4. We also control for the Covid period which had different effects in different provinces
		e.g., strikes in Tanganyika. */
		
		* If using the facility-level data, add a random effect for facility.
		* instead the volumes, use relative volume relative to baseline per baseline. 
		* So the data is standardized across small and large facilities.
		* Use the average the volume for Jan 2018 to Dec 2019.
		* Roy recommends: including a year dummy. This is of interest to the MOH.
		
		* or OLS, but convert to RR.
		
		
		* Set up time as relative to the introduction of the intervention?
		
*---------------------------------------------------------------------------
	use "$user/RAW DATA/DRC/DHIS2/DHIS2_2018-2023_long.dta", clear
	
	* keep the 3 MOU provinces and the other 7 initial Mashako plan provinces
	keep if province==4 | province==24 | province==14 | /// 3 MOUs (HL, TAN, LUA)
			province==11 | province==17 | province==26 | province==3 | ///
			province==6 | province==10  | province==13 // Other 7 Mashako provinces
			
	xtset province rmonth
	
	*1. Time-varying mou variable
	gen mou= 1 if province ==4 & rmonth>=13 // MOU in HL starting Jan 2019
	replace mou= 1 if province ==24 & rmonth>=13 // MOU in TAN starting Jan 2019
	replace mou= 1 if province==14 & rmonth>=49 // MOU in LUA starting Jan 2022
	replace mou= 0 if mou==. 
	
	
	xtreg penta3_ eased covid_case i.month, i(palikaid) fe cluster(palikaid)
		
		
	
	



global user  "/Users/catherine.arsenault/Dropbox/BMGF RISP Project/Quant analysis/"
u 	 "$user/RAW DATA/DRC/DHIS2/DHIS2_2019-2023_long.dta", clear

keep if province ==4 | province ==14 | province ==24 | province ==11 | province==17 | province==26 | province==3 | province==6 | province==10  | province==13

recode province (26 3 6 10 13 17 =66)

lab def province 66 "Other 6 initial Mashako Provinces", modify

global vax bcg_ penta1_ penta2_ penta3_ fullvax_ pcv1_ pcv2_ pcv3_ yf_ mmr_ ipv1_ ipv2_ opv0_ opv1_ opv2_ opv3_ rota1_ rota2_ rota3_

foreach x of global vax {
		egen count`x'=count(`x'), by(province orgunitlevel2 orgunitlevel3 orgunitlevel4 orgunitlevel5 organisationunitname year) 
				replace count`x'=. if count`x'==0 // those never reporting are set to missing
				}	
				
collapse (count) bcg_- rota3_ countbcg_- countrota3_ , by(province year mo rmonth)
sort province rmonth

	
	foreach x of global vax {
				gen complete`x'=(`x'/count`x')*100
				egen avg_compl_`x' = mean(complete`x'), by(province year) 
			}
			
keep province year mo rmonth penta3_ mmr_ countpenta3_ countmmr_ completepenta3_ avg_compl_penta3_ completemmr_ avg_compl_mmr_
			 
	
/*	collapse (mean) countpenta3  countmmr  avg_compl_penta3 avg_compl_mmr , by(province year)

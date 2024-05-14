	global user "/Users/catherine.arsenault/Dropbox/BMGF RISP Project/Quant analysis/RAW DATA/DRC"
	
*-------------------------------------------------------------------------------
* DHS 2013-14

import spss using "$user/DHS 2013-14/CDKR61SV/CDKR61FL.SAV", clear


g weight= 	 V005/1000000
recode H7 (1/3=1) (8=.), gen(penta3)
recode H2 (1/3=1) (8=.), gen(bcg)
recode H9 (1/3=1) (8=.), gen(mcv)
recode H8 (1/3=1) (8=.), gen(opv3)
recode H3 (1/3=1) (8=.), gen(dpt1)
recode dpt1 0=1 1=0, g(zdc)
egen fullvax= rowtotal(bcg penta3 opv3 mcv)
recode fullvax 1/3=0 4=1

gen provcat= 1 if SNPROVIN==1 
replace provcat = 2 if SNPROVIN==17
replace provcat = 3 if SNPROVIN==18
replace provcat = 4 if SNPROVIN==19
replace provcat = 5 if SNPROVIN==7 |  SNPROVIN==10 | SNPROVIN==16 | SNPROVIN==24 | SNPROVIN==3 | SNPROVIN==11 
// Mongala, Tshuapa, Haut Katanga, Ituri, Kinsha, Kwilu, Kasaï

lab def provcat 1"Kin" 2"HL" 3"LUA" 4"TAN" 5"Other6"
lab val provcat provcat 


tabstat bcg opv3 penta3 mcv fullvax zdc if B8==1 [aw=weight], by(provcat) stat(mean)

ta mcv [aw=weight] if B8==1
ta SNPROVIN mcv [aw=weight] if B8==1 , nofreq row
ta SNPROVIN penta3 [aw=weight] if B8==1 , nofreq row


keep if B8==1
keep weight provcat penta3 fullvax opv3
gen post=0
save "/Users/catherine.arsenault/Dropbox/BMGF RISP Project/Quant analysis/Data for analysis/DRC1tmp.dta", replace


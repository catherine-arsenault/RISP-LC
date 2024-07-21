
* Forest plots: inequalities in vaccine coverage in the DRC

global user "/Users/catherine.arsenault/Dropbox/9 PAPERS & PROJECTS/RISP folder/Quant analysis/Results"
	
*-------------------------------------------------------------------------------
* FOREST PLOTS SII WEALTH
import delimited using "$user/Equity/wealth7.10.24.csv",  clear
	
replace vax ="Fully vaccinated" if vax=="couvebasecomb"
replace vax ="Penta3" if vax=="penta3combinew"
replace vax ="MCV" if vax=="varcombinew"
replace vax ="OPV3" if vax=="polyo3combinew"
replace vax="ZDC" if vax=="dose0penta"

* Full vax by Province group (non MOU)
metan sii s_lci s_uci if vax=="Fully vaccinated" & (province=="Mongala" | province=="Tshuapa" ///
	| province=="Haut Katanga" | province=="Ituri" | province=="Kwilu" | province=="Kasai"), ///
	by(year) nograph random  

* Manually add the pooled estimate to the dataset 
insobs 5, after(762)
replace province="Other 6 initial Mashako Provinces" in 763/767
replace vax="Fully vaccinated" in 763/767 
replace year= 2017 in 763
replace year= 2020 in 764
replace year= 2021 in 765
replace year= 2022 in 766
replace year= 2023 in 767

replace sii =  0.232  in 763
replace s_lci =  -0.030 in 763
replace s_uci=  0.493  in 763

replace sii =   0.127 in 764
replace s_lci =  0.044  in 764
replace s_uci=    0.209  in 764

replace sii =    0.216 in 765
replace s_lci =   0.158    in 765
replace s_uci=     0.275 in 765

replace sii =  0.271 in 766
replace s_lci =   0.172   in 766
replace s_uci=      0.369 in 766

replace sii =   0.197   in 767
replace s_lci =    0.098    in 767
replace s_uci=     0.295 in 767

gen prov_group = 1 if province=="Haut Lomami"
replace prov_group = 2 if province=="Tanganyika"
replace prov_group = 3 if province=="Lualaba"
replace prov_group = 4 if province=="Other 6 initial Mashako Provinces"
replace prov_group = 5 if province=="Kinshasa"

lab def prov_group 1"Haut Lomami" 2"Tanganyika" 3"Lualaba" 4"Other 6 initial Mashako Provinces" 5 "Kinshasa"
lab val prov_group prov_group

metan sii s_lci s_uci if vax=="Fully vaccinated" & prov_group!=. , by(prov_group)  nosubgroup nooverall nobox random ///
sortby(year) label(namevar=year) forestplot(graphregion(color(white)) ///
xlabel(-1, -0.5, 0, 0.5, 1) xtick (-1, -0.5, 0, 0.5, 1) astext(30) ///
title("Slope index of inequality (SII) in full vaccination according to household wealth", size(vsmall)) ) effect(SII)

sort vax year sii 
gen ord= _n

metan sii s_lci s_uci if vax=="Fully vaccinated" & year==2023 & (province=="Mongala" | province=="Tshuapa" ///
	| province=="Haut Katanga" | province=="Ituri" | province=="Kwilu" | province=="Kasai" ///
	| province=="Kinshasa" | province=="Haut Lomami" | province=="Tanganyika" | province=="Lualaba"), ///
	nosubgroup nooverall nobox random sortby(ord) label(namevar=province) forestplot(graphregion(color(white)) spacing(1)  astext(70) textsize(80)) ///
	xlabel( -0.5, 0, 0.5, 1) xtick ( -0.5, 0, 0.5, 1)  ///
	title("Slope index of inequality (SII) in full vaccination according to household wealth (2023)", size(vsmall)) effect(SII)


*-------------------------------------------------------------------------------
* FOREST PLOTS SII WEALTH
import delimited using "$user/Equity/education7.10.24.csv",  clear
	
replace vax ="Fully vaccinated" if vax=="couvebasecomb"
replace vax ="Penta3" if vax=="penta3combinew"
replace vax ="MCV" if vax=="varcombinew"
replace vax ="OPV3" if vax=="polyo3combinew"
replace vax="ZDC" if vax=="dose0penta"


* Full vax by Province group (non MOU)
metan sii s_lci s_uci if vax=="Fully vaccinated" & (province=="Mongala" | province=="Tshuapa" ///
	| province=="Haut Katanga" | province=="Ituri" | province=="Kwilu" | province=="Kasai"), ///
	by(year) nograph random  
	
* Manually add the pooled estimate to the dataset 
insobs 5, after(762)
replace province="Other 6 initial Mashako Provinces" in 763/767
replace vax="Fully vaccinated" in 763/767 
replace year= 2017 in 763
replace year= 2020 in 764
replace year= 2021 in 765
replace year= 2022 in 766
replace year= 2023 in 767

replace sii =   0.253         in 763
replace s_lci = 0.077    in 763
replace s_uci=    0.429  in 763

replace sii =   0.171 in 764
replace s_lci =      0.048   in 764
replace s_uci=      0.295  in 764

replace sii =     0.181 in 765
replace s_lci =    0.055   in 765
replace s_uci=     0.307  in 765

replace sii =   0.192   in 766
replace s_lci =   0.107   in 766
replace s_uci=    0.276 in 766

replace sii =    0.249       in 767
replace s_lci =   0.161     in 767
replace s_uci=     0.338  in 767

gen prov_group = 1 if province=="Haut Lomami"
replace prov_group = 2 if province=="Tanganyika"
replace prov_group = 3 if province=="Lualaba"
replace prov_group = 4 if province=="Other 6 initial Mashako Provinces"
replace prov_group = 5 if province=="Kinshasa"

lab def prov_group 1"Haut Lomami" 2"Tanganyika" 3"Lualaba" 4"Other 6 initial Mashako Provinces" 5 "Kinshasa"
lab val prov_group prov_group

metan sii s_lci s_uci if vax=="Fully vaccinated" & prov_group!=. , by(prov_group)  nosubgroup nooverall nobox random ///
sortby(year) label(namevar=year) forestplot(graphregion(color(white)) ///
xlabel(-1, -0.5, 0, 0.5, 1) xtick (-1, -0.5, 0, 0.5, 1) astext(30) ///
title("Slope index of inequality (SII) in full vaccination according to maternal education", size(vsmall)) ) effect(SII)

sort vax year sii 
gen ord= _n
metan sii s_lci s_uci if vax=="Fully vaccinated" & year==2023 & (province=="Mongala" | province=="Tshuapa" ///
	| province=="Haut Katanga" | province=="Ituri" | province=="Kwilu" | province=="Kasai" ///
	| province=="Kinshasa" | province=="Haut Lomami" | province=="Tanganyika" | province=="Lualaba"), ///
	nosubgroup nooverall nobox random sortby(ord) label(namevar=province) forestplot(graphregion(color(white)) spacing(1)  astext(70) textsize(80)) ///
	xlabel( -0.5, 0, 0.5, 1) xtick ( -0.5, 0, 0.5, 1)  ///
	title("Slope index of inequality (SII) in full vaccination according to maternal education (2023)", size(vsmall)) effect(SII)

*-------------------------------------------------------------------------------
* FOREST PLOTS RD GEOGRAPHICAL
import delimited using "$user/Equity/education7.10.24.csv",  clear


/* Pooled average by subgroup for Relative measure
metan lnB lnF lnG if A=="`v'" , by(inc_group) random ///
				eform nograph  label(namevar=country) effect(RII)
	
* Pooled average by subgroup for absolute measure
* estimates of inequality at the province level DRCs 
metan SII sii_lcl sii_ucl  if vaccine=="penta3" , by(prov_group) random ///
				 nograph label(namevar=province) */

/*-------------------------------------------------------------------------------
* FOREST PLOTS SII EDUCATION
import delimited using "$user/Equity/education.csv",  clear
drop if mashako=="Other"
drop if year ==2013
drop if vax=="bcgcombinew" | vax=="OPV3"
drop if mashako=="National"
encode mashako, g(provgr)
recode prov 5=2 2=5
lab def prov 1"Haut Lomami" 2"Tanganyika" 3"Lualaba" 4 "Other initial Mashako Provinces" 5"Kinshasa"
lab val prov prov
sort mashako 

replace vax ="Fully vaccinated" if vax=="couvebasecomb"
replace vax ="Penta3" if vax=="penta3combinew"
replace vax ="MCV" if vax=="varcombinew"
replace vax ="OPV3" if vax=="polyo3combinew"
replace vax="ZDC" if vax=="dose0penta"

* Full vax by Province group
metan sii s_lci s_uci if vax=="Fully vaccinated",  by(prov) nosubgroup nooverall nobox ///
sortby(vax year) label(namevar=year) forestplot(graphregion(color(white)) ///
xlabel(-1, -0.5, 0, 0.5, 1) xtick (-1, -0.5, 0, 0.5, 1) astext(30) title("Haut Lomami", size(small)) ) effect(SII)



metan sii s_lci s_uci if mashako=="1. Haut Lomami",  by(vax) nosubgroup nooverall nobox ///
sortby(vax year) label(namevar=year) forestplot(graphregion(color(white)) ///
xlabel(-1, -0.5, 0, 0.5, 1) xtick (-1, -0.5, 0, 0.5, 1) astext(30) title("Haut Lomami", size(small)) ) effect(SII)

metan sii s_lci s_uci if mashako=="2. Tanganyika",  by(vax) nosubgroup nooverall nobox ///
sortby(vax year) label(namevar=year) forestplot(graphregion(color(white)) ///
xlabel(-1, -0.5, 0, 0.5, 1) xtick (-1, -0.5, 0, 0.5, 1) astext(30) title("Tanganyika", size(small)) ) effect(SII)

metan sii s_lci s_uci if mashako=="3. Lualaba",  by(vax) nosubgroup nooverall nobox ///
sortby(vax year) label(namevar=year) forestplot(graphregion(color(white)) ///
xlabel(-1, -0.5, 0, 0.5, 1) xtick (-1, -0.5, 0, 0.5, 1) astext(30) title("Lualaba", size(small)) ) effect(SII)

metan sii s_lci s_uci if mashako=="4. Other Initial Mashako",  by(vax) nosubgroup nooverall nobox ///
sortby(vax year) label(namevar=year) forestplot(graphregion(color(white)) astext(30) ///
title("Other initial Mashako Provinces", size(small)) ) effect(SII)

metan sii s_lci s_uci if mashako=="5. Kinshasa",  by(vax) nosubgroup nooverall nobox ///
sortby(vax year) label(namevar=year) forestplot(graphregion(color(white)) astext(30) ///
title("Kinshasa", size(small)) ) effect(SII)

* FOREST PLOTS SII EDUCATION
import delimited using "$user/Equity/education.csv",  clear
drop if mashako=="Other"
drop if year ==2013
drop if vax=="bcgcombinew"
sort mashako 

replace vax ="Fully vaccinated" if vax=="couvebasecomb"
replace vax ="Penta3" if vax=="penta3combinew"
replace vax ="MCV" if vax=="varcombinew"
replace vax ="OPV3" if vax=="polyo3combinew"
replace vax="ZDC" if vax=="dose0penta"

metan sii s_lci s_uci if mashako=="Haut Lomami",  by(vax) nosubgroup nooverall nobox ///
sortby(vax year) label(namevar=year) forestplot(graphregion(color(white)) ///
xlabel(-1, -0.5, 0, 0.5, 1) xtick (-1, -0.5, 0, 0.5, 1) astext(30) title("Haut Lomami", size(small)) ) effect(SII)

metan sii s_lci s_uci if mashako=="Tanganyika",  by(vax) nosubgroup nooverall nobox ///
sortby(vax year) label(namevar=year) forestplot(graphregion(color(white)) ///
xlabel(-1, -0.5, 0, 0.5, 1) xtick (-1, -0.5, 0, 0.5, 1) astext(30) title("Tanganyika", size(small)) ) effect(SII)

metan sii s_lci s_uci if mashako=="Lualaba",  by(vax) nosubgroup nooverall nobox ///
sortby(vax year) label(namevar=year) forestplot(graphregion(color(white)) ///
xlabel(-1, -0.5, 0, 0.5, 1) xtick (-1, -0.5, 0, 0.5, 1) astext(30) title("Lualaba", size(small)) ) effect(SII)

metan sii s_lci s_uci if mashako=="Other Initial Mashako",  by(vax) nosubgroup nooverall nobox ///
sortby(vax year) label(namevar=year) forestplot(graphregion(color(white)) astext(30) ///
title("Other initial Mashako Provinces", size(small)) ) effect(SII)

metan sii s_lci s_uci if mashako=="Kinshasa",  by(vax) nosubgroup nooverall nobox ///
sortby(vax year) label(namevar=year) forestplot(graphregion(color(white)) astext(30) ///
title("Kinshasa", size(small)) ) effect(SII)

/*
g lnRII=ln(rii)
g lnrii_lcl=ln(r_lci)
g lnrii_ucl=ln(r_uci)


* FOREST PLOT RII 
metan lnRII lnrii_lcl lnrii_ucl if vax=="penta3combinew" , ///
 by(mashako) nosubgroup eform nooverall nobox sortby(mashako year) ///
label(namevar=year) forestplot(graphregion(color(white)) ) xlabel(0.8, 1, 1.5, 2, 3, 4) xtick (0.8, 1,  1.5,  2, 3, 4) effect(RII) */


*-------------------------------------------------------------------------------
* EDUCATION
import excel using "$user/Results/Pakistan.xlsx", sheet("equity_educ") firstrow clear
* FOREST PLOT SII 
metan SII sii_lcl sii_ucl if Vaccine!="ZDC (no penta 1)",  by(Vaccine) nosubgroup  nooverall nobox sortby(SII) ///
label(namevar=Province) graphregion(color(white)) ///
xlabel(-0.2, 0.2, 0.4, 0.6) xtick (-0.2, 0.2, 0.4, 0.6) effect(SII)

g lnRII=ln(RII)
g lnrii_lcl=ln(rii_lcl)
g lnrii_ucl=ln(rii_ucl)

* FOREST PLOT RII 
metan lnRII lnrii_lcl lnrii_ucl if Vaccine!="ZDC (no penta 1)",  by(Vaccine) nosubgroup eform nooverall nobox sortby(RII) ///
label(namevar=Province) graphregion(color(white)) ///
xlabel(0.8, 1, 1.5, 2, 3, 4) xtick (0.8, 1,  1.5,  2, 3, 4) effect(RII)

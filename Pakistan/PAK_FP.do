
* Forest plots

global user "/Users/catherine.arsenault/Dropbox/BMGF RISP Project/Quant analysis"
	

*-------------------------------------------------------------------------------
* WEALTH
import excel using "$user/Results/Pakistan.xlsx", sheet("equity_wealth") firstrow clear
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

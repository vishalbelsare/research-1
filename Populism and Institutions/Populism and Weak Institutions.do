*|==============================================================================
*|POPULISM AND WEAK INSTITUTIONS|===============================================
*|
*|Nicolas Cachanosky | MSU Denver | ncachano@msudenver.edu
*|Alexandre Padilla  | MSU Denver | padilale@msudenver.edu
*|Lucas Sica         | UCEMA      | 

*|==============================================================================

* PACKAGES AND GENERAL SETTINGS
* ==============================================================================
ssc install estout,  replace

set scheme scientific

cd "C:\Users\ncach\OneDrive\My Documents\Research\Working Papers\Paper - Populism and Weak Institutions"


* DOWNLOAD DATASET STRUCTURE (COUNTRIES AND YEARS)
* ==============================================================================
import excel "https://github.com/ncachanosky/research/blob/master/Populism%20and%20Institutions/data.xlsx?raw=true", ///
			sheet("STATA") cellrange(A1:L85) firstrow clear

 
			 
tsset ID N, yearly   // Define dataset as PanelData


* ECOUNTRY SELECTION
* ==============================================================================
/*
01. Argentina
02. Brazil
03. Bolivia
04. Chile
05. Colombia
06. Ecuador
07. Mexico
08. Nicaragua
09. Paraguay
10. Peru
11. Uruguay
12. Venezuela
*/


* LABEL V-DEM (INSTITUTIONAL) DATA
* ==============================================================================
gen     CRISIS = 0
replace CRISIS = 1 if GDP_C <= -1.5

label variable COUNTRY      "Country"
label variable POPULISM     "Populism dummy"
label variable EXTREME      "Ext. Populism dummy"
label variable VDEM_LEVEL   "V-DEM: Level"
label variable VDEM_CHANGE  "V-DEM: Change"
label variable UNEMPLOYMENT "Unemployment"
label variable COMMODITY    "Comm. price index"
label variable CRISIS       "Crisis"

rename COUNTRY      CTY
rename POPULISM     POP
rename EXTREME      EXT
rename VDEM_LEVEL   VDEM_L
rename VDEM_CHANGE  VDEM_C
rename GDP_LEVEL	GDP_L
rename GDP_CHANGE   GDP_C
rename UNEMPLOYMENT U
rename COMMODITY    COMM

gen     CRISIS = 0
replace CRISIS = 1 if GDP_C <= -1.5

format VDEM_L %9.1f


* DESCRIPTIVE PLOTS
* ==============================================================================
* Argentina
twoway line VDEM_L N if ID==1, title("Argentina") 							 ///
			subtitle("V-DEM: Liberal Democracy and populist elections") 	 ///
			xlabel(1(1)7  , grid)											 ///
			ylabel(0(0.1)1, grid)											 ///
			xtitle("Period")											     ///
 ||scatteri 0.659 3 0.634 4 0.600 5 0.615 7,								 ///
			legend(off)
graph export "ARG_Fig_01.png", as(png) replace
 
 * Brazil
twoway line VDEM_L N if ID==2, title("Brazil") 		  						 ///
			subtitle("V-DEM: Liberal Democracy and populist elections") 	 ///
			xlabel(1(1)7  , grid)											 ///
			ylabel(0(0.1)1, grid)											 ///
			xtitle("Period")											     ///
 ||scatteri 0.749 3 0.777 4 0.782 5 0.583 7,								 ///
			legend(off)
graph export "BRA_Fig_01.png", as(png) replace

 * Bolivia
twoway line VDEM_L N if ID==3, title("Bolivia") 							 ///
			subtitle("V-DEM: Liberal Democracy and populist elections") 	 ///
			xlabel(1(1)7  , grid)											 ///
			ylabel(0(0.1)1, grid)											 ///
			xtitle("Period")											     ///
 ||scatteri 0.543 5 0.461 6 0.409 7,										 ///
			legend(off)
graph export "BOL_Fig_01.png", as(png) replace
			
* Chile	
twoway line VDEM_L N if ID==4, title("Chile") 								 ///
			subtitle("V-DEM: Liberal Democracy and populist elections") 	 ///
			xlabel(1(1)7  , grid)											 ///
			ylabel(0(0.1)1, grid)											 ///
			xtitle("Period")											     ///
 ||scatteri 0.793 3 0.818 4,												 ///
			legend(off)			
graph export "CHI_Fig_01.png", as(png) replace

* Ecuador	
twoway line VDEM_L N if ID==6, title("Ecuador") 							 ///
			subtitle("V-DEM: Liberal Democracy and populist elections") 	 ///
			xlabel(1(1)7  , grid)											 ///
			ylabel(0(0.1)1, grid)											 ///
			xtitle("Period")											     ///
 ||scatteri 0.468 2 0.473 3 0.461 4 0.350 5 0.295 6,						 ///
			legend(off)
graph export "ECU_Fig_01.png", as(png) replace
			
* Mexico			
twoway line VDEM_L N if ID==7, title("Mexico") 								 ///
			subtitle("V-DEM: Liberal Democracy and populist elections") 	 ///
			xlabel(1(1)7  , grid)											 ///
			ylabel(0(0.1)1, grid)											 ///
			xtitle("Period")											     ///
 ||scatteri 0.494 5 0.428 7,												 ///
			legend(off)
graph export "MEX_Fig_01.png", as(png) replace
			
* Nicaragua
twoway line VDEM_L N if ID==8, title("Nicaragua") 							 ///
			subtitle("V-DEM: Liberal Democracy and populist elections") 	 ///
			xlabel(1(1)7  , grid)											 ///
			ylabel(0(0.1)1, grid)											 ///
			xtitle("Period")											     ///
 ||scatteri 0.093 1 0.359 5 0.206 6 0.135 7,								 ///
			legend(off)
graph export "NIC_Fig_01.png", as(png) replace

* Paraguay
twoway line VDEM_L N if ID==9, title("Paraguay") 							 ///
			subtitle("V-DEM: Liberal Democracy and populist elections") 	 ///
			xlabel(1(1)7  , grid)											 ///
			ylabel(0(0.1)1, grid)											 ///
			xtitle("Period")											     ///
 ||scatteri 0.451 5,														 ///
			legend(off)
graph export "PAR_Fig_01.png", as(png) replace
			
* Peru
twoway line VDEM_L N if ID==10, title("Peru") 								 ///
			subtitle("V-DEM: Liberal Democracy and populist elections") 	 ///
			xlabel(1(1)7  , grid)											 ///
			ylabel(0(0.1)1, grid)											 ///
			xtitle("Period")											     ///
 ||scatteri 0.465 1 0.429 2 0.168 3 0.624 5 0.638 6,						 ///
			legend(off)
graph export "PER_Fig_01.png", as(png) replace

* Uruguay
twoway line VDEM_L N if ID==11, title("Uruguay")							 ///
			subtitle("V-DEM: Liberal Democracy and populist elections") 	 ///
			xlabel(1(1)7  , grid)											 ///
			ylabel(0(0.1)1, grid)											 ///
			xtitle("Period")											     ///
 ||scatteri 0.803 4,														 ///
			legend(off)
graph export "URU_Fig_01.png", as(png) replace
			
* Venezuela
twoway line VDEM_L N if ID==12, title("Venezuela")							 ///
			subtitle("V-DEM: Liberal Democracy and populist elections") 	 ///
			xlabel(1(1)7  , grid)											 ///
			ylabel(0(0.1)1, grid)											 ///
			xtitle("Period")											     ///
 ||scatteri 0.592 3 0.615 4 0.592 5 0.243 6 0.159 7							 ///
			legend(off)	
graph export "VEN_Fig_01.png", as(png) replace
			

* SUMMARIZE STATISTICS
* ==============================================================================			
summarize VDEM_L if POP==0
summarize VDEM_L if POP==1
summarize VDEM_L if EXT==1

kdensity VDEM_L if POP==0, ///
		 addplot(kdensity VDEM_L if POP==1 || kdensity VDEM_L if EXT==1) ///
		 legend(label(1 "Not populist") label(2 "Populist") label(3 "Extreme")) ///
		 xtitle("V-Dem: Liberal democracy") note("")
		 
graph export "Kernel", as(png) replace


* PANEL DATA REGRESSIONS: REGULAR POPULISM
* ==============================================================================

* Population average | Useufel & No results
local CONTROLS1 VDEM_L CRISIS
xtlogit POP `CONTROLS1', pa vce(robust)
		estimates store PA1, title(Model 1)
		margins, dydx(`CONTROLS1')
		marginsplot, derivlabels yline(0)									 ///
					 title("Average marginal effects with 95% CIs, Model 1")
		
local CONTROLS2 VDEM_L CRISIS VDEM_C		
xtlogit POP `CONTROLS2', pa vce(robust)
		estimates store PA2, title(Model 2)
		margins, dydx(`CONTROLS2')
		marginsplot, derivlabels yline(0)									 ///
					 title("Average marginal effects with 95% CIs, Model 2")
		
local CONTROLS3 VDEM_L CRISIS VDEM_C GDP_L GDP_C COMM
xtlogit POP `CONTROLS3', pa vce(robust)
		estimates store PA3, title(Model 3)
		margins, dydx(`CONTROLS3')
		marginsplot, derivlabels yline(0)									 ///
					 title("Average marginal effects with 95% CIs, Model 3")
		
local CONTROLS4 VDEM_L CRISIS VDEM_C U COMM
xtlogit POP `CONTROLS4', pa vce(robust)
		estimates store PA4, title(Model 4)
		margins, dydx(`CONTROLS4')
		marginsplot, derivlabels yline(0)									 ///
					 title("Average marginal effects with 95% CIs, Model 4")
		
		
local CONTROLS5 VDEM_L CRISIS VDEM_C GDP_L GDP_C U COMM
xtlogit POP `CONTROLS5', pa vce(robust)
		estimates store PA5, title(Model 5)
		margins, dydx(`CONTROLS5')
		marginsplot, derivlabels yline(0)									 ///
					 title("Average marginal effects with 95% CIs, Model 5")

			  
estout PA1 PA2 PA3 PA4 PA5, style(fixed) replace							 ///
	   collabels(none) mlabels(, titles)                                     ///
	   cells(b(star fmt(3)) se(par fmt(2))) legend                           ///
 	   prehead("FE models")			                  						 ///
	   label varlabels(_cons Constant)                                       ///
	   stats(N, fmt(0) label("Observations"))
			  

* Random effects | Useful and crisis (1) | All quadrature checks show stable results
local CONTROLS1 VDEM_L CRISIS
xtlogit POP `CONTROLS1', re vce(robust)
		estimates store RE1, title(Model 1)
		margins, dydx(`CONTROLS1')
		marginsplot, derivlabels yline(0)									 ///
					 title("Average marginal effects with 95% CIs, Model 1")
		
local CONTROLS2 VDEM_L CRISIS VDEM_C
xtlogit POP `CONTROLS2', re vce(robust)
		estimates store RE2, title(Model 2)
		margins, dydx(`CONTROLS2')
		marginsplot, derivlabels yline(0)									 ///
					 title("Average marginal effects with 95% CIs, Model 2")
		
local CONTROLS3 VDEM_L CRISIS VDEM_C GDP_L GDP_C COMM
xtlogit POP `CONTROLS3', re vce(robust)
		estimates store RE3, title(Model 3)
		margins, dydx(`CONTROLS3')
		marginsplot, derivlabels yline(0)									 ///
					 title("Average marginal effects with 95% CIs, Model 3")
		
local CONTROLS4 VDEM_L CRISIS VDEM_C U COMM
xtlogit POP `CONTROLS4', re vce(robust)
		estimates store RE4, title(Model 4)
		margins, dydx(`CONTROLS4')
		marginsplot, derivlabels yline(0)									 ///
					 title("Average marginal effects with 95% CIs, Model 4")
		
local CONTROLS5 VDEM_L CRISIS VDEM_C GDP_L GDP_C U COMM
xtlogit POP `CONTROLS5', re vce(robust)
		estimates store RE5, title(Model 5)
		margins, dydx(`CONTROLS5')
		marginsplot, derivlabels yline(0)									 ///
					 title("Average marginal effects with 95% CIs, Model 5")
		
	
estout RE1 RE2 RE3 RE4 RE5, style(fixed) replace							 ///
	   collabels(none) mlabels(, titles)                                     ///
	   cells(b(star fmt(3)) se(par fmt(2))) legend                           ///
 	   prehead("FE models")			                  						 ///
	   label varlabels(_cons Constant)                                       ///
	   stats(aic bic N N_g, fmt(2 2 0 0)           							 ///
	   label("AIC" "BIC" "Observations" "Groups"))

	   
* Fixed effects [be patient] | Useful & No results
local CONTROLS1 VDEM_L CRISI
xtlogit POP `CONTROLS1', fe
		estimates store FE1, title(Model 1)
		margins, dydx(`CONTROLS1')
		marginsplot, derivlabels yline(0)									 ///
					 title("Average marginal effects with 95% CIs, Model 1")
	
local CONTROLS2 VDEM_L CRISIS VDEM_C
xtlogit POP `CONTROLS2', fe
		estimates store FE2, title(Model 2)
		margins, dydx(`CONTROLS2')
		marginsplot, derivlabels yline(0)									 ///
					 title("Average marginal effects with 95% CIs, Model 2")	
					 
local CONTROLS3 VDEM_L CRISIS VDEM_C GDP_L GDP_C COMM
xtlogit POP `CONTROLS3', fe
		estimates store FE3, title(Model 3)
		margins, dydx(`CONTROLS3')
		marginsplot, derivlabels yline(0)									 ///
					 title("Average marginal effects with 95% CIs, Model 3")
	
local CONTROLS4 VDEM_L CRISIS VDEM_C U COMM
xtlogit POP `CONTROLS4', fe
		estimates store FE4, title(Model 4)
		margins, dydx(`CONTROLS4')
		marginsplot, derivlabels yline(0)									 ///
					 title("Average marginal effects with 95% CIs, Model 4")
					 
local CONTROLS5 VDEM_L CRISIS VDEM_C GDP_L GDP_C U COMM
xtlogit POP `CONTROLS5', fe
		estimates store FE5, title(Model 5)
		margins, dydx(`CONTROLS5')
		marginsplot, derivlabels yline(0)									 ///
					 title("Average marginal effects with 95% CIs, Model 5")
			  
estout FE1 FE2 FE3 FE4 FE5, style(fixed) replace			 				 ///
	   collabels(none) mlabels(, titles)                                     ///
	   cells(b(star fmt(3)) se(par fmt(2))) legend                           ///
 	   prehead("FE models")			                  						 ///
	   label varlabels(_cons Constant)                                       ///
	   stats(aic bic N N_g, fmt(2 2 0 0)           							 ///
	   label("AIC" "BIC" "Observations" "Groups"))
	   
	   
* PANEL DATA REGRESSIONS: EXTREME POPULISM
* ==============================================================================
* Population average | Useful & V-DEM (2)
local CONTROLS1 VDEM_L CRISIS
xtlogit EXT `CONTROLS1', pa vce(robust)
		estimates store PA1, title(Model 1)
		margins, dydx(`CONTROLS1')
		marginsplot, derivlabels yline(0)									 ///
					 title("Average marginal effects with 95% CIs, Model 1")
	
local CONTROLS2 VDEM_L CRISIS VDEM_C
xtlogit EXT `CONTROLS2', pa vce(robust)
		estimates store PA2, title(Model 2)
		margins, dydx(`CONTROLS2')
		marginsplot, derivlabels yline(0)									 ///
					 title("Average marginal effects with 95% CIs, Model 2")	
	
local CONTROLS3 VDEM_L CRISIS VDEM_C GDP_L GDP_C COMM
xtlogit EXT `CONTROLS3', pa vce(robust)
		estimates store PA3, title(Model 3)
		margins, dydx(`CONTROLS3')
		marginsplot, derivlabels yline(0)									 ///
					 title("Average marginal effects with 95% CIs, Model 3")
	
local CONTROLS4 VDEM_L CRISIS VDEM_C U COMM
xtlogit EXT `CONTROLS4', pa vce(robust)
		estimates store PA4, title(Model 4)
		margins, dydx(`CONTROLS4')
		marginsplot, derivlabels yline(0)									 ///
					 title("Average marginal effects with 95% CIs, Model 4")
	
local CONTROLS5 VDEM_L CRISIS VDEM_C GDP_L GDP_C U COMM
xtlogit EXT `CONTROLS5', pa vce(robust)
		estimates store PA5, title(Model 5)
		margins, dydx(`CONTROLS5')
		marginsplot, derivlabels yline(0)									 ///
					 title("Average marginal effects with 95% CIs, Model 5")
			  
estout PA1 PA2 PA3 PA4 PA5, style(fixed) replace							 ///
	   collabels(none) mlabels(, titles)                                     ///
	   cells(b(star fmt(3)) se(par fmt(2))) legend                           ///
 	   prehead("FE models")			                  						 ///
	   label varlabels(_cons Constant)                                       ///
	   stats(N, fmt(0) label("Observations"))
			  

* Random effects | Unstable & V-DEM (1) | Unstable results except model 1
local CONTROLS1 VDEM_L CRISIS
xtlogit EXT `CONTROLS1', re vce(robust) intpoint(26)
		estimates store RE1, title(Model 1)
		margins, dydx(`CONTROLS1')
		marginsplot, derivlabels yline(0)									 ///
					 title("Average marginal effects with 95% CIs, Model 1")
					 
local CONTROLS2 VDEM_L CRISIS VDEM_C
xtlogit EXT `CONTROLS2', re vce(robust) intpoint(26)
		estimates store RE2, title(Model 2)
		margins, dydx(`CONTROLS2')
		marginsplot, derivlabels yline(0)									 ///
					 title("Average marginal effects with 95% CIs, Model 2")
		
local CONTROLS3 VDEM_L CRISIS VDEM_C GDP_L GDP_C COMM
xtlogit EXT `CONTROLS3', re vce(robust) intpoints(26)
		estimates store RE3, title(Model 3)
		margins, dydx(`CONTROLS3')
		marginsplot, derivlabels yline(0)									 ///
					 title("Average marginal effects with 95% CIs, Model 3")
		
local CONTROLS4 VDEM_L CRISIS VDEM_C U COMM
xtlogit EXT `CONTROLS4', re vce(robust) intpoints(26)
		estimates store RE4, title(Model 4)
		margins, dydx(`CONTROLS4')
		marginsplot, derivlabels yline(0)									 ///
					 title("Average marginal effects with 95% CIs, Model 4")

local CONTROLS5 VDEM_L CRISIS VDEM_C GDP_L GDP_C U COMM
xtlogit EXT `CONTROLS5', re vce(robust) intpoints(26)
		estimates store RE5, title(Model 5)
		margins, dydx(`CONTROLS5')
		marginsplot, derivlabels yline(0)									 ///
					 title("Average marginal effects with 95% CIs, Model 5")

estout RE1 RE2 RE3 RE4 RE5, style(fixed) replace							 ///
	   collabels(none) mlabels(, titles)                                     ///
	   cells(b(star fmt(3)) se(par fmt(2))) legend                           ///
 	   prehead("FE models")			                  						 ///
	   label varlabels(_cons Constant)                                       ///
	   stats(aic bic N N_g, fmt(2 2 0 0)           							 ///
	   label("AIC" "BIC" "Observations" "Groups"))


* Fixed effects [be patient] | Useful
local CONTROLS1 VDEM_L CRISIS
xtlogit EXT `CONTROLS1', fe
		estimates store FE1, title(Model 1)
		margins, dydx(`CONTROLS1')
		marginsplot, derivlabels yline(0)									 ///
					 title("Average marginal effects with 95% CIs, Model 1")
					 
local CONTROLS2 VDEM_L CRISIS VDEM_C
xtlogit EXT `CONTROLS2', fe
		estimates store FE2, title(Model 2)
		margins, dydx(`CONTROLS2')
		marginsplot, derivlabels yline(0)									 ///
					 title("Average marginal effects with 95% CIs, Model 2")	
					 
local CONTROLS3 VDEM_L CRISIS VDEM_C GDP_L GDP_C COMM
xtlogit EXT `CONTROLS3', fe
		estimates store FE3, title(Model 3)
		margins, dydx(`CONTROLS3')
		marginsplot, derivlabels yline(0)									 ///
					 title("Average marginal effects with 95% CIs, Model 3")
					 
local CONTROLS4 VDEM_L CRISIS VDEM_C U COMM
xtlogit EXT `CONTROLS4', fe
		estimates store FE4, title(Model 4)
		margins, dydx(`CONTROLS4')
		marginsplot, derivlabels yline(0)									 ///
					 title("Average marginal effects with 95% CIs, Model 4")
					 
local CONTROLS5 VDEM_L CRISIS VDEM_C GDP_L GDP_C U COMM
xtlogit EXT `CONTROLS5', fe
		estimates store FE5, title(Model 5)
		margins, dydx(`CONTROLS5')
		marginsplot, derivlabels yline(0)									 ///
					 title("Average marginal effects with 95% CIs, Model 5")
			  
estout FE1 FE2 FE3 FE4 FE5, style(fixed) replace			 				 ///
	   collabels(none) mlabels(, titles)                                     ///
	   cells(b(star fmt(3)) se(par fmt(2))) legend                           ///
 	   prehead("FE models")			                  						 ///
	   label varlabels(_cons Constant)                                       ///
	   stats(aic bic N N_g, fmt(2 2 0 0)             						 ///
	   label("AIC" "BIC" "Observations" "Groups"))
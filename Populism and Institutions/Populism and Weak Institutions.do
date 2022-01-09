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
label variable COUNTRY      "Country"
label variable POPULISM     "Populism dummy"
label variable EXTREME      "Ext. Populism dummy"
label variable VDEM_LEVEL   "V-DEM: Level"
label variable VDEM_CHANGE  "V-DEM: Change"
label variable UNEMPLOYMENT "Unemployment"
label variable COMMODITY    "Commodity price index"

rename COUNTRY      CTY
rename POPULISM     POP
rename EXTREME      EXT
rename VDEM_LEVEL   VDEM_L
rename VDEM_CHANGE  VDEM_C
rename UNEMPLOYMENT U
rename COMMODITY    COMM


* Argentina
twoway xtline   VDEM_L if ID==1, ///
			    title("Argentina") subtitle("") ///
			    xlabel(1(1)7, grid) ///
			    ylabel(0.5(0.10)1.00, grid) ///
	|| scatteri 0.66 3 ///
				byopts(note(""))



POP if id==1,  i(COUNTRY) t(YEAR) saving(Fig_1_01, replace)			 ///
	   title("Argentina") subtitle("")										 ///
	   xlabel(1995(2)2018, grid)											 ///
	   ylabel(0(2)10, grid)													 ///
	   xline(2003 2015)														 ///
	   byopts(note(""))






* LABEL ECONOMIC (WORLD BANK) DATA
* ==============================================================================
label variable G_SIZ     "Gov. size (%GDP)"
label variable NATRE     "Nat. res. (%GDP)"
label variable X_TAX     "Avg. tariff on exports"
label variable UNEMP     "Unemployment rate"
label variable POPULIST  "Populist country dummy"
label variable CRISIS_5  "Crisis (5 years)"
label variable CRISIS_98 "Tequila crisis"
label variable CRISIS_08 "2008 crisis"
label variable gGDP_Cap  "% Chg. in GDP per capita"
label variable P_COMM    "Comm. price index"
label variable TRADE     "Trade opennes (%GDP)"
label variable US_RGDP   "% Chg. in US RGDP"
label variable US_NGDP   "% Chg. in US NGDP"


* SET RANGE FROM 0 TO 10 (LESS TO MORE POPULISM)
* ==============================================================================
replace VDEM_FOP = (4 - VDEM_FOP) * (10/4)
replace VDEM_JUD = (1 - VDEM_JUD) * 10
replace VDEM_CLI = VDEM_CLI * 10
replace VDEM_COR = VDEM_COR * 10
replace EFW_PROP = 10 - (EFW_PROP)/10


* BUILD GENERAL CRISIS DUMMY
* ==============================================================================
gen CRISIS = CRISIS_5 + CRISIS_98 + CRISIS_08
label variable CRISIS "Any crisis (5 years)"
replace CRISIS = 1 if CRISIS>=2


* BUILD POPULISM "INDEX"
* ==============================================================================
gen POP = (VDEM_FOP + VDEM_JUD + VDEM_COR + EFW_PROP) / 4
label variable POP "Populism index"


* PLOT AND SAVE POPULISTM "INDEX" FOR ALL COUNTRIES
* ==============================================================================

* Argentina
xtline POP if id==1,  i(COUNTRY) t(YEAR) saving(Fig_1_01, replace)			 ///
	   title("Argentina") subtitle("")										 ///
	   xlabel(1995(2)2018, grid)											 ///
	   ylabel(0(2)10, grid)													 ///
	   xline(2003 2015)														 ///
	   byopts(note(""))

graph export "Fig 1_01.png", as(png) replace
	
* Bolivia
xtline POP if id==2,  i(COUNTRY) t(YEAR) saving(Fig_1_02, replace) 	         ///
	   title("Bolivia") subtitle("") 										 ///
	   xlabel(1995(2)2018, grid)											 ///
	   ylabel(0(2)10, grid)													 ///
	   xline(2006)															 ///
	   byopts(note(""))
	   
graph export "Fig 1_02.png", as(png) replace

* Brazil
xtline POP if id==3,  i(COUNTRY) t(YEAR) saving(Fig_1_03, replace)		     ///
	   title("Brazil") subtitle("") 										 ///
	   xlabel(1995(2)2018, grid)											 ///
	   ylabel(0(2)10, grid)													 ///
	   byopts(note(""))
	   
graph export "Fig 1_03.png", as(png) replace
	   
* Colombia
xtline POP if id==4,  i(COUNTRY) t(YEAR) saving(Fig_1_04, replace)		     ///
	   title("Colombia") subtitle("") 										 ///
	   xlabel(1995(2)2018, grid)											 ///
	   ylabel(0(2)10, grid)													 ///
	   byopts(note(""))
	   
graph export "Fig 1_04.png", as(png) replace

* Ecuador
xtline POP if id==5,  i(COUNTRY) t(YEAR) saving(Fig_1_05, replace)		     ///
	   title("Ecuador") subtitle("") 										 ///
	   xlabel(1995(2)2018, grid)											 ///
	   ylabel(0(2)10, grid)													 ///
	   xline(2007 2017)														 ///
	   byopts(note(""))
	   
graph export "Fig 1_05.png", as(png) replace

* Mexico
xtline POP if id==6,  i(COUNTRY) t(YEAR) saving(Fig_1_06, replace)		     ///
	   title("Mexico") subtitle("") 									 	 ///
	   xlabel(1995(2)2018, grid)											 ///
	   ylabel(0(2)10, grid)													 ///
	   byopts(note(""))
	   
graph export "Fig 1_06.png", as(png) replace
	   
* Nicaragua
xtline POP if id==7,  i(COUNTRY) t(YEAR) saving(Fig_1_07, replace) 	         ///
	   title("Nicaragua") subtitle("") 										 ///
	   xlabel(1995(2)2018, grid)											 ///
	   ylabel(0(2)10, grid)													 ///
	   xline(2007)															 ///
	   byopts(note(""))
	   
graph export "Fig 1_07.png", as(png) replace
   
* Paraguay
xtline POP if id==8,  i(COUNTRY) t(YEAR) saving(Fig_1_08, replace)		     ///
	   title("Paraguay") subtitle("") 									 	 ///
	   xlabel(1995(2)2018, grid)											 ///
	   ylabel(0(2)10, grid)													 ///
	   byopts(note(""))
	   
graph export "Fig 1_08.png", as(png) replace
	  
* Peru
xtline POP if id==9,  i(COUNTRY) t(YEAR) saving(Fig_1_09, replace) 	         ///
	   title("Peru") subtitle("") 										 	 ///
	   xlabel(1995(2)2018, grid)											 ///
	   ylabel(0(2)10, grid)													 ///
	   byopts(note(""))
	   
graph export "Fig 1_09.png", as(png) replace
	   
* Venezuela | YES
xtline POP if id==10, i(COUNTRY) t(YEAR) saving(Fig_1_10, replace)	         ///
	   title("Venezuela") subtitle("") 										 ///
	   xlabel(1995(2)2018, grid)											 ///
	   ylabel(0(2)10, grid)													 ///
	   xline(1998)															 ///
	   byopts(note(""))
				   
graph export "Fig 1_10.png", as(png) replace
	
 
 * PLOT COMMODITY PRICE VS POPULIST REGIMES
* ==============================================================================
format P_COMM %9.0f
			   
// Argentina
twoway line POP YEAR if id==1,  title("Argentina") subtitle("") 			 ///
	   xlabel(1995(2)2018, grid) ylabel(0(2)10, grid) xline(2003 2015)		 ///
	 ||line P_COMM YEAR if id==1, yaxis(2) legend(position(6) rows(1))	
graph export "Fig 2_1.png", as(png) replace
	 
// Bolivia
twoway line POP YEAR if id==2,  title("Bolivia") subtitle("") 				 ///
	   xlabel(1995(2)2018, grid) ylabel(0(2)10, grid) xline(2006)			 ///
	 ||line P_COMM YEAR if id==1, yaxis(2) legend(position(6) rows(1))
graph export "Fig 2_2.png", as(png) replace

//Ecuador
twoway line POP YEAR if id==5,  title("Ecuador") subtitle("") 				 ///
	   xlabel(1995(2)2018, grid) ylabel(0(2)10, grid) xline(2007 2017)		 ///
	 ||line P_COMM YEAR if id==1, yaxis(2) legend(position(6) rows(1))
graph export "Fig 2_3.png", as(png) replace	 
	 
//Nicaragua
twoway line POP YEAR if id==7,  title("Nicaragua") subtitle("") 			 ///
	   xlabel(1995(2)2018, grid) ylabel(0(2)10, grid) xline(2007)			 ///
	 ||line P_COMM YEAR if id==1, yaxis(2) legend(position(6) rows(1))
graph export "Fig 2_4.png", as(png) replace	 

//Venezuela
twoway line POP YEAR if id==10, title("Venezuela") subtitle("") 			 ///
	   xlabel(1995(2)2018, grid) ylabel(0(2)10, grid) xline(1998)			 ///
	 ||line P_COMM YEAR if id==1, yaxis(2) legend(position(6) rows(1))
graph export "Fig 2_5.png", as(png) replace	 
	 
 
* CREATE INTERATION TERMS
*	1: POPULIST REGIME AND COMMOTIDIES
*	2: POPULIST REGIME AND UNEMPLOYMENT
* ==============================================================================

// Interaction terms //
gen            COMM_POP = P_COMM*POPULIST                            
label variable COMM_POP "Comm. & Populism"

gen            U_POP = UNEMP*POPULIST
label variable U_POP "Int. (Unemp. & Pop.)"


* FE EFFECT REGRESSION
* ==============================================================================
quietly{
local CONTROLS1 P_COMM COMM_POP CRISIS_5 CRISIS_98 CRISIS_08
local CONTROLS2 P_COMM COMM_POP CRISIS_5 CRISIS_98 CRISIS_08 US_NGDP US_RGDP UNEMP
local CONTROLS3 P_COMM COMM_POP CRISIS
local CONTROLS4 P_COMM COMM_POP CRISIS US_NGDP US_RGDP UNEMP
  
xtreg POP `CONTROLS1', fe vce(cluster id)
	  estimates store FE1, title(Model 1)
xtreg POP `CONTROLS2', fe vce(cluster id)
	  estimates store FE2, title(Model 2)
xtreg POP `CONTROLS3', fe vce(cluster id)
	  estimates store FE3, title(Model 3)
xtreg POP `CONTROLS4', fe vce(cluster id)
	  estimates store FE4, title(Model 4)
}

// OUTPUT TABLE
estout FE1 FE2 FE3 FE4 using table2.txt , style(fixed) replace				 ///
	   collabels(none) mlabels(, titles)                                     ///
	   cells(b(star fmt(3)) se(par fmt(2))) legend                           ///
 	   prehead("FE models")			                  						 /// 
	   label varlabels(_cons Constant)                                       ///
	   stats(rmse r2_a r2_w r2_o r2_b N N_g, fmt(4 4 4 4 4 0 0)              ///
	   label("RMSE" "Adj. R2" "R2 Within" "R2 Overall" "R2 Between"          ///
	         "Observations" "Groups"))
			 
 	 
* LINEAR REGRESSION WITH PANEL-CORRECTED STANDARD ERRORS
* ==============================================================================			 
quietly{
local CONTROLS1 P_COMM COMM_POP CRISIS_5 CRISIS_98 CRISIS_08
local CONTROLS2 P_COMM COMM_POP CRISIS_5 CRISIS_98 CRISIS_08 US_NGDP US_RGDP UNEMP
local CONTROLS3 P_COMM COMM_POP CRISIS
local CONTROLS4 P_COMM COMM_POP CRISIS US_NGDP US_RGDP UNEMP
 
xtpcse POP `CONTROLS1', correlation(psar1) 
	   estimates store PCSE1, title(Model 1)
xtpcse POP `CONTROLS2', correlation(psar1) 
	   estimates store PCSE2, title(Model 2)
xtpcse POP `CONTROLS3', correlation(psar1) 
	   estimates store PCSE3, title(Model 3)
xtpcse POP `CONTROLS4', correlation(psar1) 
	   estimates store PCSE4, title(Model 4)
}

//OUTPUT TABLE
estout PCSE1 PCSE2 PCSE3 PCSE4 using table3.txt, style(fixed) replace		 /// 
	   collabels(none) mlabels(, titles)                                     ///
	   cells(b(star fmt(3)) se(par fmt(2))) legend                           ///
 	   prehead("Panel-corrected standard errors (PCSE)")					 /// 
	   label varlabels(_cons Constant)                                       ///
	   stats(rmse N N_g, fmt(4 0 0) label("RMSE" "Observations" "Groups"))   
			 
			 
* ARELLANO-BOND ESTIMATION
* ==============================================================================
quietly{
local CONTROLS1 P_COMM COMM_POP CRISIS_5 CRISIS_98 CRISIS_08
local CONTROLS2 P_COMM COMM_POP CRISIS_5 CRISIS_98 CRISIS_08 US_NGDP US_RGDP UNEMP
local CONTROLS3 P_COMM COMM_POP CRISIS
local CONTROLS4 P_COMM COMM_POP CRISIS US_NGDP US_RGDP UNEMP
 
xtabond POP `CONTROLS1', lags(1) 
	    estimates store AB1, title(Model 1)
xtabond POP `CONTROLS2', lags(1)
	    estimates store AB2, title(Model 2)
xtabond POP `CONTROLS3', lags(1)
	    estimates store AB3, title(Model 3)
xtabond POP `CONTROLS4', lags(1)
	    estimates store AB4, title(Model 4)
}

//OUTPUT TABLE
estout AB1 AB2 AB3 AB4 using table4.txt, style(fixed) replace				 ///
	   collabels(none) mlabels(, titles)                                     ///
	   cells(b(star fmt(3)) se(par fmt(2))) legend                           ///
 	   prehead("Arellano-Bond models") /// 
	   label varlabels(_cons Constant)                                       ///
	   stats(N N_g, fmt(4 4 4 0 0) label("Observations" "Groups"))
			 

* ARELLANO-BOVER/BLUNDEL-BOND ESTIMATION
* ==============================================================================			 
quietly{
local CONTROLS1 P_COMM COMM_POP CRISIS_5 CRISIS_98 CRISIS_08
local CONTROLS2 P_COMM COMM_POP CRISIS_5 CRISIS_98 CRISIS_08 US_NGDP US_RGDP UNEMP
local CONTROLS3 P_COMM COMM_POP CRISIS
local CONTROLS4 P_COMM COMM_POP CRISIS US_NGDP US_RGDP UNEMP
 
xtdpdsys POP `CONTROLS1', lags(1) 
	     estimates store ABBB1, title(Model 1)
xtdpdsys POP `CONTROLS2', lags(1)
	     estimates store ABBB2, title(Model 2)
xtdpdsys POP `CONTROLS3', lags(1)
	     estimates store ABBB3, title(Model 3)
xtdpdsys POP `CONTROLS4', lags(1)
	     estimates store ABBB4, title(Model 4)
}

//OUTPUT TABLE
estout ABBB1 ABBB2 ABBB3 ABBB4 using table5.txt, style(fixed) replace		 ///
	   collabels(none) mlabels(, titles)                                     ///
	   cells(b(star fmt(3)) se(par fmt(2))) legend                           ///
 	   prehead("Arellano-Bover/Blundell-Bond models")						 ///
	   label varlabels(_cons Constant)                                       ///
	   stats(N N_g, fmt(0 0) label("Observations" "Groups"))  

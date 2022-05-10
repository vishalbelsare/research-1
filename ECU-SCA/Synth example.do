*|============================================================================|*
*|ECONOMIC POLICY ANALYSIS|===================================================|*
*|
*|Synthetic Control Analysis example
*|============================================================================|*

//Install Synthetic Control for STATA
ssc install synth, replace				
help synth

//Download data for example
sysuse synth_smoking
tsset  state year

//Example
synth cigsale beer lnincome retprice age15to24 cigsale(1988) 				 ///
      cigsale(1980) cigsale(1975), trunit(3) trperiod(1989) fig keep(resout)
	  
	  //cigsale:   The variable to be controled by the synthetic group
	  //beer, etc: Predictoin variables
	  //trunit:    Unit being treated (3 = California)
	  //trperiod:  Year of event (1989)


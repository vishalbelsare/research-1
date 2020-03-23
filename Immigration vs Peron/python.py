"|===========================================================================|"
"|===========================================================================|"
"|IMMIGRATNON VS PERONISM: ARGENTINA                                         |"
"|Nicolas Cachanosky                                                         |"
"|Metropolitan State University of Denver                                    |"
"|ncachano@msudenver.edu                                                     |"
"|http://www.ncachanosky.com                                                 |"
"|                                                                           |"
"|Alexandre Padilla                                                          |"
"|Metropolitan State University of Denver                                    |"
"|padilale@msudenver.edu                                                     |"
"|http://www.ncachanosky.com                                                 |"
"|===========================================================================|"
"|===========================================================================|"

"|===========================================================================|"
#%% IMPORT PACKAGES
import pandas            as pd
import matplotlib.pyplot as plt
import statsmodels.api   as sm

#%% IMPORT DATA
sheet = 'DATA'
file = r'\data.xlsx'

# Home
path1 = r'C:\Users\ncach\OneDrive\My Documents\Research\Working Papers'
path2 = r'\Paper - Immigrants vs Peron'

xlsx = pd.ExcelFile(path1 + path2 + file)
X    = pd.read_excel(xlsx, sheet_name='DATA', header = 2)

# Office
path1 = r'C:\Users\ncachano\OneDrive\My Documents\Research\Working Papers'
path2 = r'\Paper - Immigrants vs Peron'

xlsx = path1 + path2 + file
X = pd.read_excel(xlsx, sheet_name='DATA', header = 2)

#-----------------------------------------------------------------------------#
X.columns = ['YEAR'      ,   # 01
             'ARG1'      ,   # 02
             'AUS1'      ,   # 03
             'SAMPLE'    ,   # 04
             'ARG2'      ,   # 05
             'AUS2'      ,   # 06
             'POP(TOT)'  ,   # 07
             'POP(URB)'  ,   # 08
             'POP(RUR)'  ,   # 09
             'INF'       ,   # 10
             'INF_1'     ,   # 11
             'INF_2'     ,   # 12
             'TRADE'     ,   # 13
             'ILLIT'     ,   # 14
             'GDP_AGR'   ,   # 15
             'GDP_CATTLE',   # 16
             'GDP_IND'   ,   # 17
             'GDP_CONST' ,   # 18
             'GDP_TRADE' ,   # 19
             'GDP_OTHER' ,   # 20
             'GDP_TOTAL' ,   # 21
             'POP_TOTAL' ,   # 22
             'POP_ARG'   ,   # 23
             'POP_FOR'   ,   # 24
             'POP_EXT%'  ,   # 25
             'NET_IMM'   ,   # 26
             'NET_IMMILL',   # 27
             'POP_INDEX' ,   # 28
             'INST_INDEX']   # 29

#%% **** FIGURE 1 **** | GDP PER CAPITA PERCENTILE

plt.figure(figsize=(14,12), dpi=300)
axrange = [1880, 2016, 0, 100]
#  PLOT 1: ALL COUNTRIES
## Left-axis: Percentiles
plt.subplot(2,1,1)
plt.title("ALL COUNTRIES")
plt.plot(X['YEAR'], X['ARG1']  , "b-" , alpha=0.7, label="Argentina")
plt.plot(X['YEAR'], X['AUS1']  , "r--", alpha=0.7, label="Australia")
plt.ylabel("Percentile")
plt.grid()
plt.axis(axrange)
## Historical events
plt.axvspan(1914, 1918, color = "grey", alpha=0.25)          ## WWI
plt.axvspan(1939, 1945, color = "grey", alpha=0.25)          ## WWII
plt.axvline(1946, color = "black")                           ## Peron
plt.plot(1914, X['ARG1'][34], 'bo')                          ## Panama Canal
plt.plot(1930, X['ARG1'][50], 'bo')                          ## 1930 coup
plt.plot(1943, X['ARG1'][63], 'bo')                          ## 1943 coup
plt.plot(1949, X['ARG1'][69], 'bo')                          ## Const. Reform
plt.text(1947, 2, 'PERON')
plt.text(1914, 2, 'WWI')
plt.text(1940, 2, 'WWII')
plt.text(1902, 75, 'Panama Canal'              , color="b")
plt.text(1920, 86, 'Military coup'             , color="b")
plt.text(1933, 80, 'Military coup'             , color="b")
plt.text(1948, 94, '1949 Constitutional reform', color='b')
plt.legend(loc=4)
## Right-axis: Sample size
plt.twinx()
plt.plot(X['YEAR'], X['SAMPLE'], "k:" , alpha=0.75, label="Sample size")
plt.ylabel("Sample size")
plt.text(1885, 47, "Sample size", color="black", alpha=0.75)
#  PLOT 2: 1880 SAMPLE
plt.subplot(2,1,2)
plt.title("1880 SAMPLE")
plt.plot(X['YEAR'], X['ARG2'], "b-"  , alpha=0.75, label="Argentina")
plt.plot(X['YEAR'], X['AUS2'], "r--" , alpha=0.75, label="Australia")
plt.ylabel("Percentile")
plt.grid()
plt.axis(axrange)
## Historical events
plt.axvspan(1914, 1918, color = "grey", alpha=0.25)          ## WWI
plt.axvspan(1939, 1945, color = "grey", alpha=0.25)          ## WWII
plt.axvline(1946, color = "black")                           ## Peron
plt.plot(1914, X['ARG2'][34], 'bo')                          ## Panama Canal
plt.plot(1930, X['ARG2'][50], 'bo')                          ## 1930 coup
plt.plot(1943, X['ARG2'][63], 'bo')                          ## 1943 coup
plt.plot(1949, X['ARG2'][69], 'bo')                          ## Const. Reform
plt.text(1947, 2, 'PERON')
plt.text(1914, 2, 'WWI')
plt.text(1940, 2, 'WWII')
plt.text(1902, 70, 'Panama Canal'              , color="b")
plt.text(1920, 79, 'Military coup'             , color="b")
plt.text(1933, 73, 'Military coup'             , color="b")
plt.text(1948, 84, '1949 Constitutional reform', color='b')
plt.legend(loc=4)
#  BUILD PLOT
plt.show()


#%% **** FIGURE 2 **** | TRADE OPENNESS AND INFLATION

plt.figure(figsize=(14,12), dpi=300)
axrange1 = [1880, 2016,   0, 70]
axrange2 = [1880, 2016, -15, 120]
#  PLOT 1: TRADE OPENNESS
plt.subplot(2,1,1)
plt.title("Trade openness")
plt.plot(X['YEAR'], X['TRADE'], "b-", alpha=0.7, label="Trade openness")
plt.ylabel(r'(X+M)/GDP')
plt.grid()
plt.axis(axrange1)
#  Historical events
plt.axvspan(1914, 1918, color = "grey", alpha=0.25)          ## WWI
plt.axvspan(1939, 1945, color = "grey", alpha=0.25)          ## WWII
plt.axvline(1946, color = "black")                           ## Peron
plt.text(1914, 2, 'WWI')
plt.text(1940, 2, 'WWII')
plt.text(1947, 2, 'PERON')
#  PLOT 2: INFLATION
plt.subplot(2,1,2)
plt.title("Inflation")
plt.plot(X['YEAR'], X['INF']  , "b-" , alpha=0.7, label="Inflation")
plt.plot(X['YEAR'], X['INF_1'], "b--", alpha=0.5)
plt.plot(X['YEAR'], X['INF_2'], "b--", alpha=0.5)
plt.ylabel("Inflation")
plt.axhline(0, color="black")
plt.grid()
plt.axis(axrange2)
#  Historical events
plt.axvspan(1914, 1918, color = "grey", alpha=0.25)          ## WWI
plt.axvspan(1939, 1945, color = "grey", alpha=0.25)          ## WWII
plt.axvline(1946, color = "black")                           ## Peron
plt.text(1914, -12, 'WWI')
plt.text(1940, -12, 'WWII')
plt.text(1947, -12, 'Peron')
#  BUILD PLOT
plt.show()


#%% **** FIGURE 3 **** | INSTITUTIONAL AND POPULISM INDEX

#  EXTRACT HP TREND FROM THE INDEX SERIS
cycle_inst, trend_inst = sm.tsa.filters.hpfilter(X['INST_INDEX'][0:129], 6.25)
X['INST_CYCLE'] = cycle_inst
X['INST_TREND'] = trend_inst

cycle_pop , trend_pop  = sm.tsa.filters.hpfilter(X['POP_INDEX'][34:127], 6.25)
X['POP_CYCLE'] = cycle_pop
X['POP_TREND'] = trend_pop


labels = ["Institutional index", "Populism index"]

plt.figure(figsize=(12, 7), dpi=300)
axrange = [1880, 2016, 0, 10]
#  PLOT 2: INSTITUTIONAL INDEX WITH TREND
plt.plot(X['YEAR'], X['INST_INDEX'], "b-" , alpha=0.7, label=labels[0])
plt.plot(X['YEAR'], X['INST_TREND'], "b--", alpha=0.5)
plt.plot(X['YEAR'], X['POP_INDEX'] , "r-" , alpha=0.7, label=labels[1])
plt.plot(X['YEAR'], X['POP_TREND'] , "r--", alpha=0.5)
plt.grid()
plt.legend(loc=3)
plt.axis(axrange)
#  Historical events
plt.axvline(1930, color="black")                             ## 1930 coup
plt.axvline(1943, color="black")                             ## 1943 coup
plt.axvline(1946, color="black")                             ## Peron
plt.axvline(1955, color="black")
plt.axvspan(1946, 1955, color="grey", alpha=0.5)
plt.axvline(1973, color="black")
plt.axvline(1976, color="black")
plt.axvspan(1973, 1976, color="grey", alpha=0.5)
plt.text(1919  , 0.25, '1930 coup')
plt.text(1932  , 0.25, '1943 coup')
plt.text(1950.5, 9.50, 'Peron', horizontalalignment="center")
plt.text(1977  , 9.5 , "Peron")
#  BUILD PLOT
plt.show()


#%% **** FIGURE 4 **** | NET IMMIGRANTS

plt.figure(figsize=(12,7), dpi=300)
#  PLOT 1: NET IMMIGRANTS
plt.bar(X['YEAR'], X['NET_IMM'], color="green", alpha=0.7)
plt.axhline(0, color="black")
#  Historical events
plt.axvspan(1914, 1918, color = "grey", alpha=0.25)          ## WWI
plt.text(1916, 220000, "WWI", horizontalalignment="center")
plt.text(1895, 100000, "Baring Crisis")
plt.arrow(1895, 95000, -5, -55000)
#  BUILD PLOT
plt.show()


#%% **** FIGURE 5 **** | SHARE OF URBAN POPULATION

X['SHARE'] = X['POP(URB)']/X['POP(TOT)'] * 100

plt.figure(figsize=(12,7), dpi=300)
axrange=[1880, 2016, 0, 100]
#  PLOT: SHARE OF URBAN POPULIATION
plt.plot(X['YEAR'], X['SHARE'], "b-", alpha=0.7)
plt.grid()
plt.axis(axrange)
## Historical events
plt.axvspan(1914, 1918, color = "grey", alpha=0.25)          ## WWI
plt.axvspan(1939, 1945, color = "grey", alpha=0.25)          ## WWII
plt.axvline(1946, color = "black")                           ## Peron
plt.text(1914,  2, 'WWI')
plt.text(1940,  2, 'WWII')
plt.text(1947, 95, 'Peron')
#  BUILD PLOT
plt.show()




labels = ["Rural population", "Urban population"]

plt.figure(figsize=(12,7), dpi=300)
plt.stackplot(X['YEAR'], X['POP(RUR)'], X['POP(URB)'], labels=labels)
plt.grid()
plt.legend()



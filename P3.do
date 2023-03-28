** Question 3 
* getting data
clear
use "panel_muni_week.dta"

* a
generate trans = 0
replace trans = 1 if week > 36
replace trans = 0 if week > 112

generate pos = 0
replace pos = 1 if week > 111

egen id = group(comuna_id bus cash)
xtset id week
arima crime trans pos
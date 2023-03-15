** Question 3 
* getting data
clear
use "data_p3_adapted.dta"

* a
generate trans = 0
replace trans = 1 if week > 36
replace trans = 0 if week > 112

generate pos = 0
replace pos = 1 if week > 111

sum if pos == 0 & cash == 1 & bus == 1
generate crimes_av = crimes/20.87

reg crimes_av trans pos if cash == 1 & bus == 1

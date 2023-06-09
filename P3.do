** Question 3 
* getting data
clear
use "data_p3_adapted_v1.dta"

* b
generate trans = 0
replace trans = 1 if week > 41
replace trans = 0 if week > 109

generate pos = 0
replace pos = 1 if week > 109


quietly sum crimes if cash == 0 & bus == 1 & trans == 0 & pos == 0

gen crimes_av1 = crimes/r(mean)

global controls control*

reg crimes_av1 pos trans if cash == 0 & bus == 1

reg crimes_av1 pos trans $controls if cash == 0 & bus == 1, noconstant

reg crimes_av1 pos trans $controls street if cash == 0 & bus == 1, noconstant

sum crimes if cash == 1 & bus == 1 & trans == 0 & pos == 0

gen crimes_av2 = crimes/r(mean)

reg crimes_av2 pos trans if cash == 1 & bus == 1

reg crimes_av2 pos trans $controls if cash == 1 & bus == 1, noconstant

reg crimes_av2 pos trans $controls street if cash == 1 & bus == 1, noconstant

* c

poisson crimes pos trans if cash == 0 & bus == 1

poisson crimes pos trans $controls if cash == 0 & bus == 1, noconstant

poisson crimes pos trans $controls street if cash == 0 & bus == 1, noconstant

poisson crimes pos trans if cash == 1 & bus == 1

poisson crimes pos trans $controls if cash == 1 & bus == 1, noconstant

poisson crimes pos trans $controls street if cash == 1 & bus == 1, noconstant

nbreg crimes pos trans if cash == 0 & bus == 1

nbreg crimes pos trans $controls if cash == 0 & bus == 1, noconstant

nbreg crimes pos trans $controls street if cash == 0 & bus == 1, noconstant

nbreg crimes pos trans if cash == 1 & bus == 1

nbreg crimes pos trans $controls if cash == 1 & bus == 1, noconstant

nbreg crimes pos trans $controls street if cash == 1 & bus == 1, noconstant



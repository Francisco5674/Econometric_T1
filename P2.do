** Question 2
* a...

* b
cd "C:\Users\franc\OneDrive\Escritorio\registros UC\Econometric_T1"
* getting data
clear

use "AEJMicro-2009-0153_data.dta"

generate y1 = 1
replace y1 = 0 if decision_type=="No Change"

* probit table 5
probit y1 complaints firm_age emp_size ad_spending chicago comp_sq age_sq ///
emp_sq ad_sq

margins, dydx(complaints firm_age emp_size ad_spending chicago comp_sq ///
age_sq emp_sq ad_sq)

* c

generate y2 = 0
replace y2 = 1 if decision_type=="Name Change"
replace y2 = 2 if decision_type=="Exit Market"

* probit table 6
mprobit y2 complaints firm_age emp_size ad_spending chicago comp_sq age_sq ///
emp_sq ad_sq

mprobit y2 complaints firm_age emp_size ad_spending chicago comp_sq age_sq ///
emp_sq ad_sq comp_chicago age_chicago comp_ad age_ad comp_emp age_emp

mprobit y2 complaints firm_age emp_size ad_spending chicago comp_sq age_sq ///
emp_sq ad_sq comp_chicago age_chicago comp_ad age_ad comp_emp age_emp ///
ad_chicago comp_ad_chicago age_ad_chicago

* d
* logit of table 5
logit y1 complaints firm_age emp_size ad_spending chicago comp_sq age_sq ///
emp_sq ad_sq

margins, dydx(complaints firm_age emp_size ad_spending chicago comp_sq ///
age_sq emp_sq ad_sq)

* logit of table 6

mlogit y2 complaints firm_age emp_size ad_spending chicago comp_sq age_sq ///
emp_sq ad_sq

mlogit y2 complaints firm_age emp_size ad_spending chicago comp_sq age_sq ///
emp_sq ad_sq comp_chicago age_chicago comp_ad age_ad comp_emp age_emp

mlogit y2 complaints firm_age emp_size ad_spending chicago comp_sq age_sq ///
emp_sq ad_sq comp_chicago age_chicago comp_ad age_ad comp_emp age_emp ///
ad_chicago comp_ad_chicago 

* e
* probit of table 7
probit drop_name complaints firm_age emp_size ad_spending chicago comp_sq ///
age_sq emp_sq ad_sq

margins, dydx(complaints firm_age emp_size ad_spending chicago comp_sq ///
age_sq emp_sq ad_sq)

* probit of table 8
probit multiple_names complaints firm_age emp_size ad_spending chicago comp_sq ///
age_sq emp_sq ad_sq

margins, dydx(complaints firm_age emp_size ad_spending chicago comp_sq ///
age_sq emp_sq ad_sq)
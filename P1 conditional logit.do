** Question 1 conditional and mixed logit
cd "C:\Users\franc\OneDrive\Escritorio\registros UC\Econometric_T1"
* getting data
clear

use "data_p1_adapted.dta"

* e
cmset mrun tipo
cmclogit alt distancia p_prioritario simce_let simce_mat, noconstant
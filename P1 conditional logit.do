** Question 1 conditional and mixed logit
* getting data
clear

use "data_p1_adapted.dta"

* e
cmset mrun tipo
cmclogit alt distancia p_prioritario simce_let simce_mat

* f
cmclogit alt distancia p_prioritario simce_let simce_mat, ///
casevars(cod_nivel prioridad_h es_mujer prioritario alto_rendimiento)
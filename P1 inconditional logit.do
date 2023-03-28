** Question 1
* a
use "data_pregunta1.dta"
logit municipal cod_nivel prioridad_hermano es_mujer prioritario ///
 alto_rendimiento
 
vce 

* b
margins, dydx(cod_nivel prioridad_hermano es_mujer prioritario alto_rendimiento)

* c
table convenio_pie tipo

* d
mlogit tipo cod_nivel prioridad_hermano es_mujer prioritario ///
alto_rendimiento, baseoutcome(1)

margins,dydx(cod_nivel prioridad_hermano es_mujer prioritario alto_rendimiento)
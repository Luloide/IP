module Practica6 where
import Test.HUnit 
import Practica5 
import Practica4
-- practico con HUnit para los ejercicios 3, 4 , 5 y 6 de la guia 6
run = runTestTT tests3
run2 = runTestTT tests4
run3 = runTestTT tests5
run4 = runTestTT tests6a
run5 = runTestTT test6b
run6 = runTestTT test6c
--Ejercicio 3 
tests3 = test [
        " entero y positivo" ~: (parteEntera 1 ) ~?= 1,

        " entero y negativo" ~: (parteEntera (-1)) ~?= -1,

        " decimal y positivo" ~: (parteEntera 0.1) ~?= 0,
        " decimal y negativo" ~: (parteEntera (-0.1)) ~?= 0
        ]
--Ejercicio 4
tests4 = test [
        " e pertenece a s y aparece muchas veces" ~: (quitarTodos 2 [1,2,3,2,6]) ~?= [1,3,6],

        " e pertenece a s y aparece una sola ves " ~: (quitarTodos 2 [1,2,3]) ~?= [1,3],

        " e no pertenece a s" ~: (quitarTodos 2 []) ~?= []
        ]
--Ejercicio 5
tests5 = test [
        " s vacio" ~: (sumarN 2 []) ~?= [],

        " n neg y s no vacio " ~: (sumarN (-1) [1,2,3]) ~?= [0,1,2],

        " n pos y s vacio" ~: (sumarN 1 [4,5,6]) ~?= [5,6,7]
        ]
--Ejercico6
tests6a = test [
        " xs vacio" ~: (multiplosDeN 1 []) ~?= [],
        " n neg y xs no vacio " ~: (multiplosDeN (-1) [1,2,3]) ~?= [1,2,3],
        " n = 1 y xs" ~: (multiplosDeN 1 [1,2]) ~?= [1,2],
        "n pos y xs multiplos " ~: (multiplosDeN 2 [4,6,2]) ~?= [4,6,2],
        "n pos y xs no multiplos" ~: (multiplosDeN 2 [3,5,7] ~?= []),
        " n pos y xs todos distintos" ~: (multiplosDeN 2 [2,3,4] ~?= [2,4])
        ]

test6b = test [
        " l no tiene elementos" ~: (ordenar []) ~?= [],
        " l esta ordenada " ~: (ordenar [1,2,3]) ~?= [1,2,3],
        " l no esta ordenada" ~: (ordenar [8,4,6,2]) ~?= [2,4,6,8]
        ]

test6c = test [
        " n=0 y hay 1 palabra" ~: (aplanarConNBlancos ["gato"] 0) ~?= "gato",
        " n=0 y no hay palabras " ~: (aplanarConNBlancos [] 0) ~?= "",
        " n= 0 y hay mas de 1 palabra" ~: (aplanarConNBlancos ["gato","michi"] 0) ~?= "gatomichi",
        " n>0 y hay 1 palabra" ~: (aplanarConNBlancos ["gato"] 1) ~?= "gato",
        " n>0 y hay 0 palabra" ~: (aplanarConNBlancos [] 1) ~?= "",
        " n>0 y hay mas de 1 palabra" ~: (aplanarConNBlancos ["gato","michi"] 2) ~?= "gato  michi"
        ]
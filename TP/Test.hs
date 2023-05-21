module Test where
    import Solucion
    import Test.HUnit
    main = runTestTT tests
    tests = test[testsuite1, testsuite2 ,testsuite3 ,testsuite4 ,testsuite5 ,testsuite6 ,testsuite7 ,testsuite8 ,testsuite9 ,testsuite10]
    -- Test suite Ejercicio 1
    testsuite1 = test [
        " Ej1: dos usuarios tienen el mismo nombre" ~: (nombresDeUsuarios red1) ~?= ["horax64","luloide","antobascoy","mila"],
        " Ej1: todos los usuarios tienen distinto nombre" ~: (nombresDeUsuarios red1_2) ~?= ["horax64","luloide","antobascoy","mila"],
        " Ej1: caso en el cual la red no tiene usuarios" ~: (nombresDeUsuarios red_vacia) ~?= []
        ] 
    -- Test suite Ejercicio 2 
    testsuite2 = test [
        " Ej2: usuario u no tiene amigos" ~: (amigosDe red2 usuario8) ~?= [],
        " Ej2: usuario u tiene uno o más amigos " ~: (amigosDe red2 usuario6) ~?= [(7,"luloide"),(9,"mila")]
        ]
    -- Test suite Ejercicio 3
    testsuite3 = test [
        " Ej3: el usuario u no tiene amigos" ~: (cantidadDeAmigos red2 usuario8) ~?= 0,
        " Ej3: el usuario u tiene uno o mas amigos" ~: (cantidadDeAmigos red2 usuario6) ~?= 2
        ]
    -- Test suite Ejercicio 4
    testsuite4 = test [
        " Ej4: en la red hay solo un usuario" ~: (usuarioConMasAmigos red_usuario_unico) ~?= usuario6,
        " Ej4: usuarios tienen la misma cantidad de amigos" ~: (usuarioConMasAmigos red4) ~?= usuario6,
        " Ej4: hay un usuario que tiene mas amigos que los demas" ~: (usuarioConMasAmigos red4_2) ~?= usuario7
        ]
    -- Test suite Ejercicio 5
    testsuite5 = test [
        " Ej5: Hay un usuario con más de 10 amigos (es Roberto Carlos)" ~: (estaRobertoCarlos red5) ~?= True,
        " Ej5: Ningún usuario tiene más de 10 amigos (no está Roberto Carlos)" ~: (estaRobertoCarlos red4) ~?= False
        ]
    -- Test suite Ejercicio 6
    testsuite6 = test[
        " Ej6: usuario no publico nada" ~: (publicacionesDe red1 usuario9) ~?= [],
        " Ej6: usuario tiene publicaciones" ~: ((publicacionesDe red1 usuario6)) ~?= [((6,"horax64"),"somos todos montiel",[(6,"horax64"),(7,"luloide")]),((6,"horax64"),"bokita el mas grande",[(7,"luloide"),(8,"antobascoy")])]
        ]
    -- Test suite Ejercicio 7
    testsuite7 = test[
        " Ej7: un usuario le dio like dos veces a una publicación, vemos si no se repite" ~: (publicacionesQueLeGustanA red7 usuario8) ~?= [((6,"horax64"),"bokita el mas grande",[(7,"luloide"),(8,"antobascoy")]),((7,"luloide"),"Algo 1 o IP?",[(6,"horax64"),(8,"antobascoy"),(8,"antobascoy")])],
        " Ej7: el usuario no le dio likes a ninguna publicación" ~: (publicacionesQueLeGustanA red1_2 usuario9) ~?= [],
        " Ej7: el usuario le dio likes a publicaciones" ~: (publicacionesQueLeGustanA red1_2 usuario7) ~?= [((6,"horax64"),"somos todos montiel",[(6,"horax64"),(7,"luloide")]),((6,"horax64"),"bokita el mas grande",[(7,"luloide"),(8,"antobascoy")])]
        ] 
    -- Test suite Ejercicio 8
    testsuite8 = test[
        " Ej8: los usuarios tienen los mismos likes" ~: (lesGustanLasMismasPublicaciones red8 usuario7 usuario8) ~?= True,
        " Ej8: los usuarios no le gustan ninguna publicacion en la red" ~: (lesGustanLasMismasPublicaciones red8 usuario9 usuario11) ~?= True,
        " Ej8: los usuarios comparten likes de ciertas publicaciones pero no todas" ~:  (lesGustanLasMismasPublicaciones red1_2 usuario6 usuario7) ~?= False,
        " Ej8: los usuarios le dieron likes a diferentes cosas" ~: (lesGustanLasMismasPublicaciones red1_2 usuario6 usuario8) ~?= False
        ]
    -- Test suite Ejercicio 9
    testsuite9 = test[
        " Ej9: En todas las publicaciones del usuario 1, hay un usuario 2 que le dió like" ~: (tieneUnSeguidorFiel red1_2 usuario6) ~?= True,
        " Ej9: El usuario 1 no tiene publicaciones" ~: (tieneUnSeguidorFiel red2 usuario7) ~?= False,
        " Ej9: No hay usuario 2 que aparezca dando un like en todas las publicaciones del usuario 1" ~: (tieneUnSeguidorFiel red9 usuario9) ~?= False
        ]
    -- Test suite Ejercicio 10   
    testsuite10 = test[
        "Ej10: Hay una secuencia entre usuario 1 y usuario 2 (no son amigos directos)" ~: (existeSecuenciaDeAmigos red10 usuario6 usuario12) ~?= True,
        "Ej10: Usuario 1 y usuario 2 son amigos directos" ~: (existeSecuenciaDeAmigos red1_2 usuario6 usuario7) ~?= True,
        "Ej10: No existe una secuencia entre usuario 1 y usuario 2" ~: (existeSecuenciaDeAmigos red10_2 usuario6 usuario12) ~?= False
        ]
    -- Usuarios
    usuario1 = (1, "Juan")
    usuario2 = (2, "Natalia")
    usuario3 = (3, "Pedro")
    usuario4 = (4, "Mariela")
    usuario5 = (5, "Natalia")
    usuario6 = (6, "horax64")
    usuario7 = (7, "luloide")
    usuario8 = (8, "antobascoy")
    usuario9 = (9, "mila")
    usuario10 = (10, "horax64") -- horax se registro 2 veces
    usuario11 = (11,"robertcharles")
    usuario12 = (12,"fede")
    usuario13 = (13,"paula")
    --relaciones
    relacion6_7 = (usuario6, usuario7)
    relacion8_9 = (usuario8, usuario9)
    relacion6_8 = (usuario6, usuario8)
    relacion7_8 = (usuario7, usuario8)
    relacion7_9 = (usuario7, usuario9)
    relacion6_9 = (usuario6, usuario9)
    relacion8_11 = (usuario8, usuario11)
    relacion9_12 = (usuario9, usuario12)

    --publicaciones
    publicacion6_1 = (usuario6, "somos todos montiel", [usuario6, usuario7])
    publicacion6_2 = (usuario6, "bokita el mas grande", [usuario7, usuario8])
    publicacion7_1 = (usuario7, "Algo 1 o IP?", [usuario6, usuario8, usuario8])
    publicacion9_1 = (usuario9, "776.420 la recaudacion para esta nueva edicion del superclasico del futbol argentino.. MARTEEEEEEN ", [usuario7, usuario8])
    publicacion9_2 = (usuario9, "Aguante el te con leche", [usuario6])
    -- Redes 
    -- redes ejercicio 1
    usuarios1 = [usuario6, usuario7, usuario8, usuario9, usuario10]
    relaciones1 = [relacion6_7, relacion8_9, relacion7_8]
    publicaciones1 = [publicacion6_1, publicacion6_2]
    red_vacia = ([],[],[])
    red1 = (usuarios1,relaciones1,publicaciones1)
    usuarios1_2 = [usuario6, usuario7, usuario8, usuario9]
    red1_2 = (usuarios1_2, relaciones1, publicaciones1)

    -- redes ejercicio 2
    usuarios2 = [usuario6, usuario7, usuario8, usuario9,usuario11]
    relaciones2 = [relacion6_7,relacion6_9,relacion7_9]
    red2 = (usuarios2,relaciones2, publicaciones1)

    -- redes ejercicio 3
    -- usamos la red del ejercicio 2

    -- redes ejercicio 4
    usuarios3 = [usuario6]
    usuarios3_2 = [usuario6, usuario7]
    relaciones3 = [(usuario7, usuario6)]
    publicaciones3 = [publicacion6_1]
    red_usuario_unico = (usuarios3, [], []) -- red con solo un usuario
    red4 = (usuarios3_2, relaciones3, publicaciones3)
    relaciones4 = [(usuario7, usuario6), (usuario7, usuario9), (usuario7, usuario11), (usuario9, usuario11)]
    red4_2 = (usuarios2, relaciones4, publicaciones3)

    -- redes ejercicio 5 
    usuarios5 = [usuario1, usuario2, usuario3, usuario4, usuario5, usuario6, usuario7, usuario8, usuario9, usuario11, usuario12]
    relaciones5 = [(usuario11, usuario1), (usuario11, usuario2),(usuario11, usuario3), (usuario11, usuario4),(usuario11, usuario5),(usuario11, usuario6),(usuario11, usuario7),(usuario11, usuario8),(usuario11, usuario9),(usuario11, usuario12),(usuario11, usuario13)]
    red5 = (usuarios5, relaciones5, publicaciones3)

    -- redes ejercicio 6 
    -- usamos redes de otros ejercicios

    -- redes ejercicio 7
    publicaciones7 = [publicacion6_1,publicacion6_2,publicacion7_1]
    red7 = (usuarios1_2, relaciones1, publicaciones7)

    -- redes ejercicio 8
    publicaciones8 = [publicacion6_2, publicacion9_1]
    red8 = (usuarios1_2, relaciones1, publicaciones8)
    red8_2 = (usuarios2,relaciones1,publicaciones8)

    -- redes ejercicio 9
    publicaciones9 = [publicacion9_1,publicacion9_2]
    red9 = (usuarios1_2,relaciones1,publicaciones9)

    -- Redes ejercicio 10
    relaciones10 = [relacion6_7,relacion6_8,relacion7_8,relacion7_9,relacion9_12]
    usuarios10 = [usuario6, usuario7,usuario8, usuario9, usuario12]
    red10 = (usuarios10, relaciones10, publicaciones1)
    relaciones10_2 = [relacion6_7, relacion6_8 , relacion7_8, relacion9_12]
    red10_2 = (usuarios10, relaciones10_2, publicaciones1)



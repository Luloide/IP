module Solucion where
-- Nombre de Grupo: Overflow 'em all
-- Integrante 1: Lucia Silva, lucia.silva.alberto@gmail.com , 209/22
-- Integrante 2: Horacio Garcia Crespo, horaciogarciacr@gmail.com, 203/20
-- Integrante 3: Antonella Manzoni Bascoy, antonellapilar23@yahoo.com, 1603/21
-- Integrante 4: Ludmila Krasnozhon, ludkra2@gmail.com, 252/22
type Usuario = (Integer, String) -- (id, nombre)
type Relacion = (Usuario, Usuario) -- usuarios que se relacionan
type Publicacion = (Usuario, String, [Usuario]) -- (usuario que publica, texto publicacion, likes)
type RedSocial = ([Usuario], [Relacion], [Publicacion])

-- Funciones basicas pre-definidas:

usuarios :: RedSocial -> [Usuario]
usuarios (us, _, _) = us

relaciones :: RedSocial -> [Relacion]
relaciones (_, rs, _) = rs

publicaciones :: RedSocial -> [Publicacion]
publicaciones (_, _, ps) = ps

idDeUsuario :: Usuario -> Integer
idDeUsuario (id, _) = id 

nombreDeUsuario :: Usuario -> String
nombreDeUsuario (_, nombre) = nombre 

usuarioDePublicacion :: Publicacion -> Usuario
usuarioDePublicacion (u, _, _) = u

likesDePublicacion :: Publicacion -> [Usuario]
likesDePublicacion (_, _, us) = us

-- Ejercicios:

-- Ejercicio 1:
-- Describir qué hace la función: retorna la lista de los nombres de todos los usuarios de la red, garantizando que no hay nombres repetidos.

nombresDeUsuarios :: RedSocial -> [String]
nombresDeUsuarios red = eliminarRepetidos (proyectarNombres (usuarios red))


proyectarNombres :: [Usuario] -> [String]
proyectarNombres [] = []
proyectarNombres (x:xs) = nombreDeUsuario x : proyectarNombres xs

eliminarRepetidos :: (Eq t) => [t] -> [t]
eliminarRepetidos [] = []
eliminarRepetidos (x:xs) | pertenece x xs = [x] ++ quitarTodos x (eliminarRepetidos xs)
                         | otherwise = [x] ++ eliminarRepetidos xs

quitarTodos :: (Eq t) => t -> [t] -> [t]
quitarTodos x xs | xs == [] = []
            | x == head xs = [] ++ quitarTodos x (tail xs)
            | otherwise = [head xs] ++ quitarTodos x (tail xs)

pertenece :: (Eq t) => t -> [t] -> Bool
pertenece e l | longitud l == 0 = False
              | e == head l = True
              | otherwise = pertenece e (tail l)
   
longitud :: [t] -> Int
longitud [] = 0
longitud (x:xs) = 1 + longitud xs

--Ejercicio 2 
-- describir qué hace la función: devuelve la lista de usuarios que pertenecen a una relación con u.
amigosDe :: RedSocial -> Usuario -> [Usuario]
amigosDe red n = amigos n (relaciones red)


amigos :: Usuario -> [Relacion] -> [Usuario]
amigos _ [] = []
amigos n (x:xs) | n == fst x = [snd x] ++ amigos n xs 
                 | n == snd x = [fst x] ++ amigos n xs 
                 | otherwise = amigos n xs

--Ejercicio 3 
-- describir qué hace la función: devuelve la cantidad de amigos del usuario u.
cantidadDeAmigos :: RedSocial -> Usuario -> Int
cantidadDeAmigos red n = longitud (amigosDe red n)

-- Ejercicio 4
-- describir qué hace la función: compara los usuarios de la red, devolviendo al que tiene mas amigos.
usuarioConMasAmigos :: RedSocial -> Usuario
usuarioConMasAmigos red = elQueTieneMasAmigos red (usuarios red) (head (usuarios red))


elQueTieneMasAmigos :: RedSocial -> [Usuario] -> Usuario -> Usuario
elQueTieneMasAmigos red (x:xs) n | xs == [] && cantidadDeAmigos red x > cantidadDeAmigos red n = x
                                 | xs == [] = n 
                                 | cantidadDeAmigos red x >= cantidadDeAmigos red n = elQueTieneMasAmigos red xs x
                                 | otherwise = elQueTieneMasAmigos red xs n
-- Ejercicio 5                
-- describir qué hace la función: .....
estaRobertoCarlos :: RedSocial -> Bool
estaRobertoCarlos red = if (cantidadDeAmigos red (usuarioConMasAmigos red)) > 10 then True else False

-- Ejercicio 6
-- describir qué hace la función: devuelve las publicaciones de la red en las cuales el usuario u aparece como autor.
publicacionesDe :: RedSocial -> Usuario -> [Publicacion]
publicacionesDe red u = postsDe (publicaciones red) u

postsDe :: [Publicacion] -> Usuario -> [Publicacion]
postsDe [] u = []
postsDe (x:xs) u | usuarioDePublicacion x == u = x : postsDe xs u
                 | otherwise = postsDe xs u

-- Ejercicio 7
-- describir qué hace la función: se fija en que publicaciones de la red, el usuario u aparece en los likes.
publicacionesQueLeGustanA :: RedSocial -> Usuario -> [Publicacion]
publicacionesQueLeGustanA red u = likesDeU (publicaciones red) u

likesDeU :: [Publicacion] -> Usuario -> [Publicacion]
likesDeU [] _ = []
likesDeU (x:xs) u | pertenece u (likesDePublicacion x) = x : likesDeU xs u 
                  | otherwise = likesDeU xs u 

-- Ejercicio 8
-- describir qué hace la función: comparamos los likes de a y b, tienen que tener exactamente los mismos.
lesGustanLasMismasPublicaciones :: RedSocial -> Usuario -> Usuario -> Bool
lesGustanLasMismasPublicaciones red a b = if publicacionesQueLeGustanA red a == publicacionesQueLeGustanA red b then True else False

-- Ejercicio 9
-- describir qué hace la función: para que u tenga un seguidor fiel, nos fijamos si las publicaciones de u estan incluidas en los likes de algun usuario de la red.
tieneUnSeguidorFiel :: RedSocial -> Usuario -> Bool
tieneUnSeguidorFiel red u = if  publicacionesDe red u == [] then False else esSeguidorFielDeU red u (usuarios red) 

esSeguidorFielDeU ::RedSocial -> Usuario -> [Usuario] -> Bool
esSeguidorFielDeU red u [] = False  
esSeguidorFielDeU red u (x:xs) | perteneceTodaslasPubDeUALosLikesDeU2 (publicacionesDe red u) (publicacionesQueLeGustanA red x) && u /= x = True
                               | otherwise = esSeguidorFielDeU red u xs
                               
perteneceTodaslasPubDeUALosLikesDeU2 :: [Publicacion] -> [Publicacion] -> Bool
perteneceTodaslasPubDeUALosLikesDeU2 [] l = True
perteneceTodaslasPubDeUALosLikesDeU2 (x:xs) l | not (pertenece x l) = False
                                              | otherwise = perteneceTodaslasPubDeUALosLikesDeU2 xs l
-- Ejercicio 10
-- describir qué hace la función: con comunidad nos referimos a los usuarios con las cuales el usuario u1 tiene una secuencia de amigos, para ver si tiene una secuencia con u2, creamos la comunidad de u1 y nos fijamos si u2 pertenece o no.
existeSecuenciaDeAmigos :: RedSocial -> Usuario -> Usuario -> Bool
existeSecuenciaDeAmigos red u1 u2 = pertenece u2 (comunidad red [u1] [u1])


comunidad :: RedSocial -> [Usuario] -> [Usuario] -> [Usuario]
comunidad red uc [] = uc 
comunidad red uc (x:xs) = comunidad red ((usuariosAConocer (amigosDe red x) uc) ++ uc) (xs ++ (usuariosAConocer (amigosDe red x) uc))


usuariosAConocer :: [Usuario] -> [Usuario] -> [Usuario]
usuariosAConocer [] xs = []
usuariosAConocer (x:xs) ls | pertenece x ls = usuariosAConocer xs ls 
                           | otherwise = x : usuariosAConocer xs ls
                 

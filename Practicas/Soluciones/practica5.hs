module Practica5 where
{-# OPTIONS_GHC -Wno-incomplete-patterns #-}
-- Ejercicio 1
--1.1
longitud :: [t] -> Int
longitud [] = 0
longitud (x:xs) = 1 + longitud xs

-- 1.2
ultimo :: [t] -> t
ultimo (x:xs) | longitud (x:xs) == 1 = x
              | otherwise = ultimo xs

-- 1.3
principio :: [t] -> [t]
principio (x:xs) | longitud (x:xs) == 1 = []
                 | otherwise = x : principio xs


-- 1.4
reverso :: (Eq t) => [t] -> [t]
reverso (x:xs) | xs == [] = [x]
               | otherwise = reverso xs ++ [x]

-- Ejercico 2
-- 2.1
pertenece :: (Eq t) => t -> [t] -> Bool
pertenece e l | longitud l == 0 = False
              | e == head l = True
              | otherwise = pertenece e (tail l)

-- 2.2
todosIguales :: (Eq t) => [t] -> Bool
todosIguales (x:xs) | longitud xs == 0 = True
                    | x /= head xs = False
                    | otherwise = todosIguales xs

-- 2.3
todosDistintos :: (Eq t) => [t] -> Bool
todosDistintos (x:xs) | (tail xs) == [] = True
                      | pertenece x xs = False
                      | otherwise = todosDistintos xs

-- 2.4
hayRepetidos :: (Eq t) => [t] -> Bool
hayRepetidos l | todosDistintos l == True = False
               | otherwise = True
--2.5
quitar :: (Eq t) => t -> [t] -> [t]
quitar x xs | x == head xs = [] ++ tail xs
            | otherwise = [head xs] ++ quitarTodos x (tail xs)


--2.6
quitarTodos :: (Eq t) => t -> [t] -> [t]
quitarTodos x xs | xs == [] = []
            | x == head xs = [] ++ quitarTodos x (tail xs)
            | otherwise = [head xs] ++ quitarTodos x (tail xs)

-- 2.7
eliminarRepetidos :: (Eq t) => [t] -> [t]
eliminarRepetidos (x:xs) | xs == [] = []
                         | pertenece x xs = [x] ++ quitarTodos x (eliminarRepetidos xs)
                         | otherwise = [x] ++ eliminarRepetidos xs

-- 2.8
mismosElementos :: (Eq t) => [t] -> [t] -> Bool
mismosElementos (x:xs) (l:ls) | xs == []  && ls ==[] = True
                              | pertenece x (l:ls) && pertenece l (x:xs) = mismosElementos xs ls
                              | otherwise = False

-- 2.9
capicua :: (Eq t) => [t] -> Bool
capicua (x:xs) | longitud xs == 1 = True
               | x /= ultimo xs = False
               | otherwise = capicua (tail (reverso xs))

-- Ejercicio 3
--3.1
sumatoria :: [Integer] -> Integer
sumatoria [] = 0
sumatoria (x:xs) = x + sumatoria xs

--3.2
productoria :: [Integer] -> Integer
productoria [] = 1
productoria (x:xs) = x * productoria xs

--3.3
maximo :: [Integer] -> Integer
maximo (x:xs) = maximoAux x xs

maximoAux :: Integer -> [Integer] -> Integer
maximoAux n (x:xs) | null xs && x > n = x
                   | null xs = n
                   | x >= n = maximoAux x xs
                   | otherwise = maximoAux n xs

-- 3.4
sumarN :: Integer -> [Integer] -> [Integer]
sumarN n [] = []
sumarN n (x:xs) | null xs = [x+n]
                | otherwise = (x+n) : sumarN n xs

-- 3.5
sumarElPrimero :: [Integer] -> [Integer]
sumarElPrimero (x:xs) = sumarN x (x:xs)

-- 3.6
sumarElUltimo :: [Integer] -> [Integer]
sumarElUltimo l = sumarN (head (reverso l)) l

-- 3.7
pares :: [Integer] -> [Integer]
pares [] = []
pares (x:xs) | even x = x : pares xs
             | otherwise = pares xs

-- 3.8
multiplosDeN :: Integer -> [Integer] -> [Integer]
multiplosDeN n [] = []
multiplosDeN n (x:xs) | n == 0 =  multiplosDeN n xs
                      | mod x n == 0 = x : multiplosDeN n xs
                      | otherwise = multiplosDeN n xs

--3.9
ordenar :: [Integer] -> [Integer]
ordenar []  = []
ordenar [x] = [x]
ordenar xs  = juntar (ordenar ys) (ordenar zs)
  where
  (ys,zs)     = partirALaMitad xs

partirALaMitad :: [Integer] -> ([Integer],[Integer])
partirALaMitad l = splitAt (div (longitud l) 2) l

juntar :: [Integer] -> [Integer] -> [Integer]
juntar xs [] = xs
juntar [] ys = ys
juntar (x:xs) (y:ys)
  | x <= y = x : juntar xs (y:ys)
  | otherwise = y : juntar (x:xs) ys

--Ejercicio 4 
-- 4.1
sacarBlancosRepetidos :: [Char] -> [Char]
sacarBlancosRepetidos [] = []
sacarBlancosRepetidos (x:xs) | x == ' ' && head xs == ' ' = sacarBlancosRepetidos xs
                             | otherwise = x : sacarBlancosRepetidos xs

--4.2
contarPalabras :: [Char] -> Integer
contarPalabras l = contarPalabrasSinBlancosRep (empiezaConUnBlanco (sacarBlancosRepetidos l))

contarPalabrasSinBlancosRep :: [Char] -> Integer 
contarPalabrasSinBlancosRep [] = 0
contarPalabrasSinBlancosRep [x] = 1
contarPalabrasSinBlancosRep (x:xs) | x == ' ' = 1 + contarPalabrasSinBlancosRep xs
                                   | otherwise = contarPalabrasSinBlancosRep xs

empiezaConUnBlanco :: [Char] -> [Char] -- Esta funcion ayuda para los casos en el cual la lista de char arranca con blacos
empiezaConUnBlanco x | head x == ' ' = tail x
                     | otherwise = x
 -- 4.3
palabraMasLarga :: [Char] -> [Char]
palabraMasLarga x = comparoPalabras (palabras x) (head (palabras x))

comparoPalabras :: [[Char]] -> [Char] -> [Char]
comparoPalabras (x:xs) l | xs == [] = if longitudPalabra l > longitudPalabra x then l else x
                         | longitudPalabra x > longitudPalabra l = comparoPalabras xs x
                         | otherwise = comparoPalabras xs l

longitudPalabra :: [Char] -> Int
longitudPalabra [] = 0
longitudPalabra (x:xs) | x == ' ' = 0
                       | otherwise = 1 + longitudPalabra xs

-- 4.4
palabras :: [Char] -> [[Char]]
palabras x = palabrasAux x x

palabrasAux :: [Char] -> [Char] -> [[Char]]
palabrasAux [] l = [palabra l]
palabrasAux (x:xs) l | x == ' ' = palabra l : palabrasAux xs xs 
                     | otherwise = palabrasAux xs l

palabra :: [Char] ->  [Char]
palabra [] = []
palabra (x:xs) | x == ' ' = []
                | otherwise = x : palabra xs

-- 4.5
aplanar :: [[Char]] -> [Char]
aplanar [] = []
aplanar (x:xs) = x ++ aplanar xs
-- 4.6

aplanarConBlancos :: [[Char]] -> [Char]
aplanarConBlancos [] = []
aplanarConBlancos (x:xs) | xs == [] = x
                         | otherwise = x ++ [' '] ++ aplanar xs
-- 4.7 
aplanarConNBlancos :: [[Char]] -> Integer -> [Char]
aplanarConNBlancos [] _ = []
aplanarConNBlancos (x:xs) n | xs == [] = x
                            | otherwise = x ++ generaNBlancos n ++ aplanarConNBlancos xs n 

generaNBlancos :: Integer -> [Char]
generaNBlancos 0 = []
generaNBlancos n = ' ' : generaNBlancos (n-1)

-- Ejercicio 5
-- 5.1
nat2bin :: Integer -> [Integer]
nat2bin 1 = [1]
nat2bin 0 = [0]
nat2bin n | mod n 2 == 1 =  nat2bin (div n 2) ++ [1]
          | mod n 2 == 0 = nat2bin (div n 2) ++ [0]

-- 5.2
bin2nat :: [Integer] -> Integer
bin2nat [] = 0
bin2nat (x:xs) = x * (2^(longitud (x:xs) - 1)) + bin2nat xs

-- 5.3
nat2hex :: Integer -> [Char]
nat2hex n = cambiaAletras (nat2Base16 n)

nat2Base16 :: Integer -> [Integer]
nat2Base16 0 = []
nat2Base16 n = nat2Base16 (div n 16) ++ [mod n 16]

cambiaAletras :: [Integer] -> [Char]
cambiaAletras [] = []
cambiaAletras (x:xs) | x == 0 = '0' : cambiaAletras xs
                     | x == 1 = '1' : cambiaAletras xs
                     | x == 2 = '2' : cambiaAletras xs
                     | x == 3 = '3' : cambiaAletras xs
                     | x == 4 = '4' : cambiaAletras xs
                     | x == 5 = '5' : cambiaAletras xs
                     | x == 6 = '6' : cambiaAletras xs
                     | x == 7 = '7' : cambiaAletras xs
                     | x == 8 = '8' : cambiaAletras xs
                     | x == 9 = '9' : cambiaAletras xs
                     | x == 10 = 'A' : cambiaAletras xs
                     | x == 11 = 'B' : cambiaAletras xs
                     | x == 12 = 'C' : cambiaAletras xs
                     | x == 13 = 'D' : cambiaAletras xs
                     | x == 14 = 'E' : cambiaAletras xs
                     | x == 15 = 'F' : cambiaAletras xs

-- 5.4

sumaAcumulada :: (Num t) => [t] -> [t]
sumaAcumulada [] = []
sumaAcumulada l = sumaAcumulada (quitarUltimo l) ++ [sumaAnteriores l]

sumaAnteriores :: Num p => [p] -> p
sumaAnteriores [] = 0
sumaAnteriores (x:xs) = x + sumaAnteriores xs

quitarUltimo :: (Num t) => [t] -> [t]
quitarUltimo (x:xs) | null xs = []
                    | otherwise = x : quitarUltimo xs

-- 5.5

descomponerEnPrimos :: [Integer] -> [[Integer]]
descomponerEnPrimos [] = []
descomponerEnPrimos (x:xs) = primosQueDividen x 2 : descomponerEnPrimos xs

primosQueDividen :: Integer -> Integer-> [Integer]
primosQueDividen n q | n == 0 || n == 1 = []
                     | esPrimo n = [n]
                     | mod n (proxPrimo q) == 0 = q : primosQueDividen (div n q) (proxPrimo q)
                     | otherwise = primosQueDividen n ((proxPrimo q) + 1)

proxPrimo :: Integer -> Integer
proxPrimo p | esPrimo p = p
            | otherwise = proxPrimo (p+1)

--funciones auxiliares para hacer esPrimo
menorDivisor :: Integer ->Integer
menorDivisor n = menorDivisorHasta n 2

menorDivisorHasta :: Integer -> Integer -> Integer -- se requiere que q == 2
menorDivisorHasta n q | mod n q == 0 = q
                      | otherwise = menorDivisorHasta n (q+1)

esPrimo :: Integer ->Bool
esPrimo n | menorDivisor n == n = True
          | otherwise = False

-- Ejercicio 6
--6.1
type Set a = [a]
               
agregarATodos :: Integer -> Set(Set Integer) -> Set(Set Integer)
agregarATodos n m | m == [] = []
                  | otherwise = agregar n (head m) : agregarATodos (n) (tail m)

agregar :: Integer -> Set Integer -> Set Integer
agregar n m | m == [] = [n]
            | elem n m = m
            | otherwise = n : m

-- 6.2
partes :: Integer -> Set(Set Integer)
partes 0 = [[]]
partes n = union (partes (n-1)) (agregarATodos n (partes (n-1)))

union :: Set(Set Integer) -> Set(Set Integer) -> Set(Set Integer)
union [] m = m
union (n:nx) m | elem n m == True = union nx m
               | otherwise = n : union nx m 

--6.3
productoCartesiano :: Set Integer -> Set Integer -> Set (Integer, Integer)
productoCartesiano [] m = []
productoCartesiano x m= producto (head x) m ++ productoCartesiano (tail x) m
 
producto :: Integer -> Set Integer -> Set (Integer, Integer)
producto n [] = []
producto n (x:xs) = [(n , x)] ++ producto n xs

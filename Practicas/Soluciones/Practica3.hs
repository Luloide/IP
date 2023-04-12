{-# OPTIONS_GHC -Wno-incomplete-patterns #-}
dobleMe x = x + x
-- Ejercicio 1 (hecho en clase)
--1A
f :: Integer -> Integer
f 1 = 8
f 4 = 131
f 16 = 16
-- 1B
g ::  Integer -> Integer
g 8 = 16
g 16 = 4
g 131 = 1
-- 1C
h :: Integer -> Integer
h x = f (g x)

k :: Integer -> Integer
k x = g (f x)

-- Ejercicio 2 
-- 2a
absoluto :: Int -> Int
absoluto x | x >= 0 = x
           | otherwise = -x
--2b
maximoabsoluto :: Int -> Int -> Int
maximoabsoluto x y | (absoluto x ) >= (absoluto y) = x
                   | otherwise = y
-- 2c
maximo3 :: Integer -> Integer -> Integer -> Integer
maximo3 x y z | x >= y && x >= z = x
              | y >= x && y >= z = y
              | otherwise = z
-- 2d
-- sin usar pattern matching
algunoEs0 :: Float -> Float -> Bool
algunoEs0 x y | x == 0 || y == 0 = True
              | otherwise = False
--usando pattern matching 
algunoEs0p :: Float -> Float -> Bool
algunoEs0p 0 y = True
algunoEs0p x 0 = True
algunoEs0p x y = False
 -- 2e
 --sin pattern matching
ambosSon0 :: Float -> Float -> Bool
ambosSon0 x y | x == 0 && y == 0 = True
              | otherwise = False

 --con pattern matcing 
ambosSon0p :: Float -> Float -> Bool
ambosSon0p 0 0 = True
ambosSon0p x y = False

-- 2f
mismoIntervalo :: Float -> Float -> Bool
mismoIntervalo x y | x <= 3 && y <= 3 = True
                   | (x > 3 && x <= 7) && (y > 3 && y <= 7) = True
                   | x > 7 && y > 7 = True
                   | otherwise = False
-- 2g
sumaDistintos :: Int -> Int -> Int -> Int
sumaDistintos x y z | (x == y) && (x == z) = x
                    | x == y = x + z
                    | x == z = x + y
                    | y == z = x + y
                    | otherwise = x + y + z
-- 2h
esMultiploDe :: Int -> Int -> Bool
esMultiploDe x y | mod x y == 0 = True
                 | otherwise = False
-- 2i
digitoUnidades :: Int -> Int
digitoUnidades x = mod x 10
--2j
digitoDecenas :: Int -> Int
digitoDecenas x = mod (div x 10) 10
-- Ejercicio 3 
estanRelacionados :: Integer -> Integer -> Bool
estanRelacionados a b | a == 0 && b == 0 = False
                      | mod a b == 0 = True
                      | otherwise = False
-- Ejercicio 4 
-- 4a
prodInt :: (Integer, Integer)-> (Integer, Integer) -> (Integer, Integer)
prodInt (ax,ay) (bx, by) = (ax * bx , ay * by)

-- 4b
todoMenor ::(Float, Float)-> (Float, Float) -> Bool
todoMenor (ax,ay) (bx, by) | ax < bx && ay < by = True
                           | otherwise = False
-- 4c
distanciaPuntos :: (Float, Float)-> (Float, Float) -> Float
distanciaPuntos (ax,ay) (bx, by) = sqrt(((bx - ax)**2)+((by - ay)**2))

-- 4d
sumaTerna :: (Integer, Integer, Integer) -> Integer
sumaTerna (a, b, c) = a + b + c

-- 4e
sumarSoloMultiplos :: (Integer, Integer, Integer) -> Integer -> Integer
sumarSoloMultiplos (a,b,c) k | mod a k == 0 && mod b k == 0 && mod c k == 0 = a+b+c
                             | mod a k == 0 && mod b k == 0 = a+b
                             | mod a k == 0 &&  mod c k == 0 = a+c
                             | mod b k == 0 && mod c k == 0 = b+c
                             | mod a k == 0 = a
                             | mod b k == 0 = b
                             | mod c k == 0 = c
                             | otherwise = 0
--4f
posPrimerPar :: (Integer, Integer, Integer) -> Integer
posPrimerPar (a,b,c) | mod a 2 == 0 = 0
                     | mod b 2 == 0 = 1
                     | mod c 2 == 0 = 2
                     | otherwise = 4

-- 4g
crearPar :: a ->b ->(a, b)
crearPar a b = (a,b)

-- 4h
invertir :: (a, b) ->(b, a)
invertir (a,b) = (b,a)

-- Ejercicio 5 
todosMenores :: (Integer, Integer, Integer) -> Bool
todosMenores (a,b,c) | f5 a > g5 a && f5 b > g5 b && f5 c > g5 c = True
                     | otherwise = False
-- funciones auxiliares
f5 :: Integer -> Integer
f5 x | x <= 7 = x^2
     | otherwise = (2*x)-1

g5 :: Integer -> Integer
g5 n = if mod n 2 == 0 then div n 2 else 3*n + 1
-- Ejercicio 6
bisiesto :: Integer -> Bool
bisiesto a | (mod a 4 /= 0) || (mod a 100 == 0 && mod a 400 /= 0) = False
           | otherwise = True

-- Ejercicio 7
distanciaManhattan :: (Float,Float,Float) -> (Float,Float,Float) -> Float
distanciaManhattan (a,b,c) (d,e,f) = abs((a-d) + (b - e) + (c-f))

-- Ejercicio 8
comparar :: Integer -> Integer -> Integer
comparar a b | sumaUltimosDigitos a < sumaUltimosDigitos b = 1
             | sumaUltimosDigitos a > sumaUltimosDigitos b = -1
             | otherwise = 0
             where sumaUltimosDigitos x = mod x 10 + mod (div x 10) 10
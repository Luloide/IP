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
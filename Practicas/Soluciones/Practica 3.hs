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
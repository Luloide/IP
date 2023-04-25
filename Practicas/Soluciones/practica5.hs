{-# OPTIONS_GHC -Wno-incomplete-patterns #-}
import GHC.Natural (naturalFromInteger)
-- Ejercicio 1
--1.1
longitud :: [t] -> Int
longitud xs = foldr (\ x -> (+) 1) 0 xs

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
reverso (x:xs) | null xs = [x]
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
todosDistintos (x:xs) | null (tail xs) = True
                      | pertenece x xs = False
                      | otherwise = todosDistintos xs

-- 2.4
hayRepetidos :: (Eq t) => [t] -> Bool
hayRepetidos l | todosDistintos l = False
               | otherwise = True
--2.5
quitar :: (Eq t) => t -> [t] -> [t]
quitar x xs | x == head xs = tail xs
            | otherwise = head xs : quitarTodos x (tail xs)


--2.6
quitarTodos :: (Eq t) => t -> [t] -> [t]
quitarTodos x xs | null xs = []
            | x == head xs = quitarTodos x (tail xs)
            | otherwise = head xs : quitarTodos x (tail xs)

-- 2.7
eliminarRepetidos :: (Eq t) => [t] -> [t]
eliminarRepetidos (x:xs) | null xs = []
                         | pertenece x xs = x : quitarTodos x (eliminarRepetidos xs)
                         | otherwise = x : eliminarRepetidos xs

-- 2.8
mismosElementos :: (Eq t) => [t] -> [t] -> Bool
mismosElementos (x:xs) (l:ls) | null xs  && null ls = True
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
sumatoria xs = foldr (+) 0 xs

--3.2
productoria :: [Integer] -> Integer
productoria xs = foldr (*) 1 xs

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
multiplosDeN n (x:xs) | mod x n == 0 = x : multiplosDeN n xs
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
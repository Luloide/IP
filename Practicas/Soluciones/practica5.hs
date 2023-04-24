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

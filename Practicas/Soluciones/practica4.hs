-- Ejercicio 1
fibonacci :: Integer -> Integer
fibonacci n | n == 0 = 0
            | n == 1 = 1
            | n >= 1 = (fibonacci (n-1) + fibonacci (n-1))
            | otherwise = undefined

--Ejercico 2 
parteEntera :: Float -> Integer
parteEntera n | 0 <= n && n < 1 = 0
              | n > -1  && n < 0 = -1
              | n >=1 = 1 + parteEntera (n-1)
              | otherwise = (-1) + parteEntera (n+1)

-- Ejercico 3 
esDivisible :: Integer -> Integer -> Bool
esDivisible n x | n == 0 = True
                | n < x = False
                | x < 0 = esDivisible (n+x) x
                | otherwise = esDivisible (n-x) x
-- Ejercicio 4 
sumaImpares :: Integer -> Integer
sumaImpares n | n == 0 = 0
              | even n = sumaImpares (n-1)
              | otherwise = (sumaImpares (n-1)) + n
-- Ejercicio 5 
medioFact :: Integer ->Integer
medioFact n | n == 0  || n == (-1) = 1
            | otherwise = n * (medioFact (n-2))
    
--Ejercicio 6
sumaDigitos :: Integer ->Integer
sumaDigitos 0 = 0
sumaDigitos n = mod n 10 + sumaDigitos (div n 10)

-- Ejercicio 7
todosDigitosIguales :: Integer -> Bool
todosDigitosIguales n | n == mod n 10 = True
                      | mod (div n 10) 10 /= mod n 10 = False
                      | otherwise = todosDigitosIguales (div n 10)

-- Ejercico 8 
iesimoDigito :: Integer -> Integer -> Integer
iesimoDigito n i = mod (div n (10^(cantDigitos n - i))) 10

cantDigitos :: Integer -> Integer
cantDigitos x | x == 0 = 0
              | otherwise = 1 + cantDigitos (div x 10)

-- Ejercicio 9
esCapicua :: Integer -> Bool
esCapicua n | mod n 10 == iesimoDigito n 1 = True
            | otherwise = False

-- Ejercicio 10
-- 10 a
f1 :: Integer -> Integer
f1 0 = 0
f1 n = 2^n + f1 (n-1)

-- 10 b 
f2 :: Integer -> Integer -> Integer
f2 n q | n == 0 = 0
       | otherwise = q^n + f2 (n-1) q

-- 10 c 
f3 :: Integer -> Integer -> Integer
f3 n q = f2 (2 * n) q

-- 10 d
f4 :: Integer -> Integer -> Integer
f4 n q = f2 (2*n) q - f2 (n-1) q

-- Ejercico 11c
eAprox :: Integer -> Float 
eAprox x | x == 0 = 0
         | otherwise = eAprox (x - 1) + (1 / factorial x) 

factorial :: Integer -> Float 
factorial 0 = 1.0
factorial n = fromIntegral n * factorial (n-1) 

-- Ejercicio 12
raizDe2Aprox :: Integer -> Float
raizDe2Aprox n = sucecionA n - 1

sucecionA :: Integer -> Float
sucecionA n | n == 0 = 2
            | otherwise = 2 + (1 / raizDe2Aprox (n-1))
 -- Ejercico 13
f :: Integer -> Integer -> Integer
f n m | n == 0 = 0
      | otherwise = sumatoriaInterna (n-1) m + sumatoriaInterna n m

sumatoriaInterna :: Integer -> Integer -> Integer
sumatoriaInterna n m | m == 0 = 0
                     | otherwise = n^m + sumatoriaInterna n (m-1)

-- Ejercicio 14
sumaPotencias :: Integer -> Integer -> Integer -> Integer
sumaPotencias q n m | n == 0 = 0
                    | otherwise = sumatoriaDeM q n m + sumatoriaDeM q (n-1) m

sumatoriaDeM :: Integer -> Integer -> Integer -> Integer
sumatoriaDeM q n m | m == 0 = 0
                   | otherwise = q^(n+m) + sumatoriaDeM q n (m-1)

--Ejercico 15
sumaRacionales :: Integer -> Integer -> Float
sumaRacionales n m | n == 0 = 0
                   | otherwise = sumaInternaRacionales n m + sumaInternaRacionales (n-1) m

sumaInternaRacionales :: Integer -> Integer -> Float
sumaInternaRacionales n m | m == 0 = 0
                          | otherwise = (fromIntegral n / fromIntegral m) + sumaInternaRacionales n (m-1)
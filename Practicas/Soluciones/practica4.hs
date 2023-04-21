{-# OPTIONS_GHC -Wno-incomplete-patterns #-}
import GHC.Natural (naturalFromInteger)
import Distribution.PackageDescription (mkFlagAssignment)
import Language.Haskell.TH (SumAlt)
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
f2 n q | n == 1 = 1
       | otherwise = q^n + f2 (n-1) q

-- 10 c 
f3 :: Integer -> Integer -> Integer
f3 n q = f2 (2 * n) q

-- 10 d
f4 :: Integer -> Integer -> Integer
f4 n q = f3 n q - f2 (n-1) q

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
sumaRacionales n m | n == 0 =  0
                   | otherwise = sumaInternaRacionales n m + sumaInternaRacionales (n-1) m

sumaInternaRacionales :: Integer -> Integer -> Float
sumaInternaRacionales n m | m == 1 = fromIntegral n
                          | otherwise = (fromIntegral n / fromIntegral m) + sumaInternaRacionales n (m-1)

-- Ejercicio 16
-- 16 a
menorDivisor :: Integer ->Integer
menorDivisor n = menorDivisorHasta n 2

menorDivisorHasta :: Integer -> Integer -> Integer -- se requiere que q == 2
menorDivisorHasta n q | mod n q == 0 = q
                      | otherwise = menorDivisorHasta n (q+1)

--16 b 
esPrimo :: Integer ->Bool
esPrimo n | menorDivisor n == n = True
          | otherwise = False

--16 c
sonCoprimos :: Integer ->Integer ->Bool
sonCoprimos a b | b == 1 = True -- caso base si a > b
                | a == 1 = True -- caso base si b > a
                | esPrimo a && esPrimo b = True
                | (mod a b == 0) || (mod b a == 0 )= False
                | a > b = sonCoprimos a (b-1)
                | b > a = sonCoprimos (a-1) b
 -- 16 d
-- version 1
nEsimoPrimo :: Integer -> Integer
nEsimoPrimo n = nEsimoPrimoAux n 2 0

nEsimoPrimoAux :: Integer -> Integer -> Integer -> Integer
nEsimoPrimoAux n i k | n == k = i-1
                     | esPrimo i = nEsimoPrimoAux n (i+1) (k+1)
                     | otherwise = nEsimoPrimoAux n (i+1) k
{- nEsimoPrimoAux toma 3 valores n que seria el n-esimo primo que buscamos , i el indice que atraviesa los Z y k que seria el contador de los primos que vamos encontrando -}
-- version 2 (consultar)
nEsimoPrimoV2 :: Integer -> Integer
nEsimoPrimoV2 1 = 2
nEsimoPrimoV2 n = proxPrimo (nEsimoPrimoV2 (n-1))

proxPrimo :: Integer -> Integer
proxPrimo p | esPrimo p = p
            | otherwise = proxPrimo (p+1)

--Ejercico 17
esFibonacci :: Integer -> Bool
esFibonacci n = esFibonacciAux n 0

esFibonacciAux :: Integer -> Integer -> Bool
esFibonacciAux n i | n == fibonacci i = True
                   | fibonacci i > n = False
                   | otherwise = esFibonacciAux n (i+1)

-- Ejercicio 18
mayorDigitoPar :: Integer ->Integer
mayorDigitoPar n | n < 10 && par n = n
                 | n < 10 = -1
                 | par ultimoDigito = max ultimoDigito resultadoRecursion
                 | otherwise = resultadoRecursion
            where
                  ultimoDigito = mod n 10
                  par a = mod a 2 == 0
                  resultadoRecursion = mayorDigitoPar (div n 10)

-- Ejercicio 19 

esSumaInicialDePrimos :: Integer ->Bool
esSumaInicialDePrimos n = esSumaInicialDePrimosAux n 2

esSumaInicialDePrimosAux :: Integer -> Integer -> Bool
esSumaInicialDePrimosAux n q | n == sumaPrimosHasta 2 q = True
                             | n < sumaPrimosHasta 2 q = False
                             | otherwise = esSumaInicialDePrimosAux n (q+1)

sumaPrimosHasta :: Integer -> Integer -> Integer
sumaPrimosHasta m n  | esPrimo n && n == m = m
                     | n == m = 0
                     | esPrimo m = m + sumaPrimosHasta (m + 1) n
                     | otherwise = sumaPrimosHasta (m+1) n

-- Ejercicio 20 (NO LO TERMINE OJO!)
tomaValorMax :: Integer -> Integer -> Integer
tomaValorMax n1 n2 | sumaDivisores n2 == comparaValores n1 n2 = n2
                   | otherwise = tomaValorMax n1 (n2 -1)

comparaValores :: Integer -> Integer -> Integer -- se requiere que a=>1 y b=>a
comparaValores a b | b == a = b
                   | otherwise = max (sumaDivisores b) (sumaDivisores (comparaValores a (b-1))) 


sumaDivisores :: Integer -> Integer
sumaDivisores n = sumaDivisoresHasta n n

sumaDivisoresHasta :: Integer -> Integer -> Integer 
sumaDivisoresHasta n i | i == 0 = 0
                       | mod n i == 0 = i + sumaDivisoresHasta n (i-1)
                       | otherwise = sumaDivisoresHasta n (i-1)

--Ejercico 21
pitagoras :: Integer -> Integer -> Integer -> Integer
pitagoras m n r | n == 0 = sumaTernas m 0 r
                | otherwise = sumaTernas m n r + pitagoras m (n-1) r

sumaTernas :: Integer -> Integer -> Integer -> Integer
sumaTernas m n r | m == 0 && esTernaPitagorica m n r = 1
                 | m == 0 = 0
                 | esTernaPitagorica m n r = 1 + sumaTernas (m-1) n r
                 | otherwise = sumaTernas (m-1) n r
            where
                  esTernaPitagorica a b c = a^2 + b^2 <= c^2



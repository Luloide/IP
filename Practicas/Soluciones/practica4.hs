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
sumaDigitos n = (mod n 10) + sumaDigitos (n - (mod n 10)) -- esta mal 


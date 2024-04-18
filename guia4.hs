-- Introduccion que me perdí
factorial :: Integer -> Integer
factorial 0 = 1
factorial n = n * factorial (n - 1)

-- Ejercicio 1
fibonacci :: Integer -> Integer
fibonacci 0 = 0
fibonacci 1 = 1
fibonacci n = fibonacci (n - 1) + fibonacci (n - 2)

-- Ejercicio 2
parteEntera :: Float -> Integer
parteEntera x
    | (-1) < x && x < 1 = 0
    | x < 0 = parteEntera (x + 1) - 1
    | otherwise = parteEntera (x - 1) + 1

-- Ejercicio 3
esDivisible :: Integer -> Integer -> Bool
esDivisible n d 
    | abs(n) == d = True
    | abs(n) < d = False
    | otherwise = esDivisible (abs(n) - d) d


-- Ejercicio 7
todosDigitosIguales :: Integer -> Bool
todosDigitosIguales n
    | 0 <= abs(n) && abs(n) < 10 = True
    | otherwise = digitoUnidades (sacarUnidad n) == digitoUnidades n 
    && todosDigitosIguales (sacarUnidad n)

 ---- Son de la guía 3 en realidad, pero buen.
digitoUnidades :: Integer -> Integer
digitoUnidades n = mod (abs(n)) 10

sacarUnidad :: Integer -> Integer
sacarUnidad n = div (abs(n)) 10

-- Ejercicio 8
iesimoDigito :: Integer -> Integer -> Integer
iesimoDigito n i
--    | i == 1 = digitoUnidades n
    | cantDigitos n == 1 = div n 10^((cantDigitos n) - 1)
    | otherwise = digitoUnidades (div n (10^((cantDigitos n) - i)))

cantDigitos :: Integer -> Integer
cantDigitos n
    | 0 <= n && n < 10 = 1
    | otherwise = 1 + cantDigitos (sacarUnidad n)

-- Ejercicio 13
dobleSumaDePotencias :: Integer -> Integer -> Integer
dobleSumaDePotencias 1 m = sumaDePotencias 1 m
dobleSumaDePotencias n m = sumaDePotencias n m + dobleSumaDePotencias (n - 1) m

sumaDePotencias :: Integer -> Integer -> Integer
sumaDePotencias n 1 = n
sumaDePotencias n m = n^m + sumaDePotencias n (m - 1)

-- Ejercicio 16
-- a)
menorDivisor :: Integer -> Integer
menorDivisor 1 = 1
menorDivisor n = menorDivisorPasoRecursivo n 2

menorDivisorPasoRecursivo :: Integer -> Integer -> Integer
menorDivisorPasoRecursivo n i
    | esDivisible n i = i
    | otherwise = menorDivisorPasoRecursivo n (i + 1)

-- b)
esPrimo :: Integer -> Bool
esPrimo n = menorDivisor n == n

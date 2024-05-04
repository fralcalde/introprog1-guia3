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
    | abs n == d = True
    | abs n < d = False
    | otherwise = esDivisible (abs n  - d) d

-- Ejercicio 4
sumaImpares :: Integer -> Integer
sumaImpares n
  | n <= 0 = 0
  | otherwise = sumaImparesRec 1 n

sumaImparesRec :: Integer -> Integer -> Integer
sumaImparesRec n 1 = n
sumaImparesRec n cant = n + sumaImparesRec (n + 2) (cant - 1)

-- Ejercicio 5
medioFac :: Integer -> Integer 
medioFac 0 = 1
medioFac 1 = 1
medioFac n = n * medioFac (n - 2)

-- Ejercicio 6
sumaDigitos :: Integer -> Integer
sumaDigitos n
  | n < 10 = n
  | otherwise = digitoUnidades n + sumaDigitos (sacarUnidad n)

-- Ejercicio 7
todosDigitosIguales :: Integer -> Bool
todosDigitosIguales n
    | 0 <= abs n && abs n  < 10 = True
    | otherwise = digitoUnidades (sacarUnidad n) == digitoUnidades n 
    && todosDigitosIguales (sacarUnidad n)

 ---- Son de la guía 3 en realidad, pero buen.
digitoUnidades :: Integer -> Integer
digitoUnidades n = mod (abs n ) 10

sacarUnidad :: Integer -> Integer
sacarUnidad n = div (abs n ) 10

-- Ejercicio 8
iesimoDigito :: Integer -> Integer -> Integer
iesimoDigito n i
--    | i == 1 = digitoUnidades n
    | cantDigitos n == 1 = div n 10^( cantDigitos n  - 1)
    | otherwise = digitoUnidades (div n (10^( cantDigitos n  - i)))

cantDigitos :: Integer -> Integer
cantDigitos n
    | 0 <= n && n < 10 = 1
    | otherwise = 1 + cantDigitos (sacarUnidad n)

-- Ejercicio 9
esCapicua :: Integer -> Bool
esCapicua n
  | cantDigitos n == 1 = True
  | otherwise = primerDigito n == digitoUnidades n && esCapicua (sacarUnidad (colaDigitos n))

primerDigito :: Integer -> Integer
primerDigito n
  | div n 10 == 0 = n
  | otherwise = primerDigito (div n 10)

colaDigitos :: Integer -> Integer
colaDigitos n = mod n (10^(cantDigitos n - 1))

-- Ejercicio 10
-- a)
ej10f1 :: Integer -> Integer
ej10f1 0 = 1
ej10f1 n = 2^n + ej10f1 (n - 1)

-- b)
ej10f2 :: Integer -> Integer -> Integer
ej10f2 1 q = q^1
ej10f2 n q = q^n + ej10f2 (n - 1) q

-- c)
ej10f3 :: Integer -> Integer -> Integer
ej10f3 1 q = q + q^2
ej10f3 n q = q^(2 * n) + q^(2 * n - 1) + ej10f3 (n - 1) q

-- d)
ej10f4 :: Integer -> Integer -> Integer
ej10f4 n q = ej10f1_hasta (2 * n) n q

ej10f1_hasta :: Integer -> Integer -> Integer -> Integer
ej10f1_hasta desde hasta base
  | desde == hasta = base^hasta
  | otherwise = base^desde + ej10f1_hasta (desde - 1) hasta base

-- Ejercicio 11
-- a)
eAprox :: Integer -> Float
eAprox 0 = 1 / fromIntegral (factorial 0)
eAprox n = 1 / fromIntegral (factorial n) + eAprox (n - 1)

-- b)
e :: Float
e = eAprox 10

-- Ejercicio 12
raizDe2Aprox :: Integer -> Float
raizDe2Aprox n = sucesionEj12 n - 1

sucesionEj12 :: Integer -> Float
sucesionEj12 1 = 2
sucesionEj12 n = 2 + 1 / sucesionEj12 (n - 1)

-- Ejercicio 13
dobleSumaDePotencias :: Integer -> Integer -> Integer
dobleSumaDePotencias 1 m = sumaDePotencias 1 m
dobleSumaDePotencias n m = sumaDePotencias n m + dobleSumaDePotencias (n - 1) m

sumaDePotencias :: Integer -> Integer -> Integer
sumaDePotencias n 1 = n
sumaDePotencias n m = n^m + sumaDePotencias n (m - 1)

-- Ejercicio 14
sumaPotencias :: Integer -> Integer -> Integer -> Integer 
sumaPotencias 1 b base = sumaPotenciasPasoRecB 1 b base
sumaPotencias a b base = sumaPotenciasPasoRecB a b base + sumaPotencias (a - 1) b base

sumaPotenciasPasoRecB :: Integer -> Integer -> Integer -> Integer
sumaPotenciasPasoRecB a 1 base = base^(a + 1)
sumaPotenciasPasoRecB a b base = base^(a + b) + sumaPotenciasPasoRecB a (b - 1) base

-- Ejercicio 15
sumaRacionales :: Integer -> Integer -> Float
sumaRacionales p 1 = sumaRacionalesPasoRecP p 1
sumaRacionales p q = sumaRacionalesPasoRecP p q + sumaRacionales p (q - 1)

sumaRacionalesPasoRecP :: Integer -> Integer -> Float
sumaRacionalesPasoRecP 1 q = 1 / fromIntegral q
sumaRacionalesPasoRecP p q = fromIntegral p / fromIntegral q + sumaRacionalesPasoRecP (p - 1) q

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

-- Ejercicio 17
esFibonacci :: Integer -> Bool
esFibonacci n = esFibonacciSearch n 1

esFibonacciSearch :: Integer -> Integer -> Bool
esFibonacciSearch n i
  | fibonacci i == n = True
  | fibonacci i > n = False
  | otherwise = esFibonacciSearch n (i + 1)

-- Ejercicio 18
mayorDigitoPar :: Integer -> Integer
mayorDigitoPar n = mayorDigito (sacarImpares n)

sacarImpares :: Integer -> Integer
sacarImpares n
  | div n 10 == 0 && even n = n
  | div n 10 == 0 && odd n = -1
  | even (digitoUnidades n) = sacarImpares (sacarUnidad n) * 10 + digitoUnidades n
  | otherwise = sacarImpares (sacarUnidad n)

mayorDigitoEnUltimoPar :: Integer -> Integer
mayorDigitoEnUltimoPar n
  | digitoUnidades n >= digitoUnidades (sacarUnidad n) = digitoUnidades n
  | otherwise = digitoUnidades (sacarUnidad n)

mayorDigito :: Integer -> Integer
mayorDigito n
  | n == (- 1) = - 1
  | digitoUnidades n == n = n
  | div n 10 >= 1 && div n 10 < 10 = mayorDigitoEnUltimoPar n
  | otherwise = mayorDigito (div n 100 * 10 + mayorDigitoEnUltimoPar n)



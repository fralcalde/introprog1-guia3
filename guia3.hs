-- Ejercicio 4
-- b)
todoMenor :: (Float, Float) -> (Float, Float) -> Bool
-- todoMenor (a, b) (c, d) = (a < c) && (b < d)
todoMenor t1 t2 = (fst t1 < fst t2) && (snd t1 < snd t2)

-- f)
posPrimerPar :: (Int, Int, Int) -> Int
posPrimerPar (a, b, c) 
    | mod a 2 == 0 = 0
    | mod b 2 == 0 = 1
    | mod c 2 == 0 = 2
    | otherwise = 4

-- Ejercicio 6
bisiesto :: Int -> Bool
bisiesto y = not (mod y 4 /= 0 || (mod y 100 == 0 && mod y 400 /= 0))

-- Ejercicio 7
distanciaManhattan :: (Float, Float, Float) -> (Float, Float, Float) -> Float
distanciaManhattan (a1, a2, a3) (b1, b2, b3) = abs(a1 - b1) + abs(a2 - b2) + abs(a3 - b3)

-- Ejercicio 8
digitoUnidad :: Int -> Int 
digitoUnidad x 
    | x < 0 = mod (-x) 10
    | otherwise = mod x 10

digitoDecena :: Int -> Int 
digitoDecena x 
    | x < 0 = digitoDecena(-x)
    | otherwise = digitoUnidad (div x 10)

sumaUltimosDosDigitos :: Int -> Int
sumaUltimosDosDigitos a = digitoDecena a + digitoUnidad a

comparar :: Int -> Int -> Int
comparar a b 
    | sumaUltimosDosDigitos a < sumaUltimosDosDigitos b = 1
--    | sumaUltimosDosDigitos a == sumaUltimosDosDigitos b = 0
-- No porque el LSP se queja de que las guardas no son exhaustivas
    | sumaUltimosDosDigitos a > sumaUltimosDosDigitos b = -1
    | otherwise = 0

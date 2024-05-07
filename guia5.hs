-- Ejercicio 1
-- 1)
longitud :: [t] -> Integer
longitud [] = 0
longitud (x:xs) = 1 + longitud xs

-- 2)
ultimo :: [t] -> t
ultimo [x] = x
ultimo (x:xs) = ultimo xs

-- 3)
principio :: [t] -> [t]
principio [x] = []
principio (x:xs) = x:principio xs

-- 4)
reverso :: [t] -> [t]
reverso [] = []
reverso (x:xs) = reverso xs ++ [x]
 
-- Ejercicio 2
-- 1)
pertenece :: (Eq t) => t -> [t] -> Bool
pertenece e [] = False
pertenece e (x:xs)
    | e == x = True
    | otherwise = pertenece e xs

-- 2)
todosIguales :: (Eq t) => [t] -> Bool
todosIguales [] = True
todosIguales [x] = True
todosIguales (x1:x2:xs) = x1 == x2 && todosIguales xs

-- 3)
todosDistintos :: (Eq t) => [t] -> Bool
todosDistintos [] = True
todosDistintos [x] = True
todosDistintos (x:xs) = not (pertenece x xs) && todosDistintos xs

-- 4)
hayRepetidos :: (Eq t) => [t] -> Bool
hayRepetidos [] = False
hayRepetidos (x:xs)
    | pertenece x xs = True
    | otherwise = hayRepetidos xs
-- hayRepetidos (x:xs) = pertenece x xs || hayRepetidos xs

-- 5)
quitar :: (Eq t) => t -> [t] -> [t]
quitar _ [] = []
quitar e (x:xs)
    | e == x = xs
    | otherwise = x:quitar e xs

-- 6)
quitarTodos :: (Eq t) => t -> [t] -> [t]
quitarTodos _ [] = []
quitarTodos e (x:xs)
  | e == x = quitarTodos e xs
  | otherwise = x:quitarTodos e xs

-- 7)
eliminarRepetidos :: (Eq t) => [t] -> [t]
eliminarRepetidos [] = []
eliminarRepetidos (x:xs) = x:eliminarRepetidos (quitarTodos x xs)

-- 8)
mismosElementos :: (Eq t) => [t] -> [t] -> Bool
mismosElementos l1 l2 = todosPertenecen (eliminarRepetidos l1) (eliminarRepetidos l2) 
  && todosPertenecen (eliminarRepetidos l2) (eliminarRepetidos l1)

todosPertenecen :: (Eq t) => [t] -> [t] -> Bool
todosPertenecen [x] ys = pertenece x ys
todosPertenecen (x:xs) ys = pertenece x ys && todosPertenecen xs ys

-- 9)
capicua :: (Eq t) => [t] -> Bool
capicua [] = True
capicua [x] = True
capicua (x:xs) = x == ultimo xs && capicua (principio xs)

-- Ejercicio 2
-- 1)
sumatoria :: [Integer] -> Integer
sumatoria [] = 0
sumatoria (x:xs) = x + sumatoria xs

-- 2)
productoria :: [Integer] -> Integer
productoria [] = 1
productoria (x:xs) = x * productoria xs

-- 3)
maximo :: (Eq t, Ord t) => [t] -> t
maximo [x] = x
maximo (x1:x2:xs)
    | x1 >= x2 = maximo (x1:xs)
    | otherwise = maximo (x2:xs)

--maximo (x:xs)
--    | x >= head xs = maximo (x:quitar (head xs) xs)
--    | otherwise = maximo xs

-- 4)
sumarN :: Integer -> [Integer] -> [Integer]
sumarN _ [] = []
sumarN n (x:xs) = (n + x):sumarN n xs

-- 5)
sumarElPrimero :: [Integer] -> [Integer]
sumarElPrimero xs = sumarN (head xs) xs

-- 6)
sumarElUltimo :: [Integer] -> [Integer]
sumarElUltimo xs = sumarN (ultimo xs) xs

-- 7)
pares :: [Integer] -> [Integer]
pares [] = []
pares (x:xs)
  | even x = x:pares xs
  | otherwise = pares xs

-- 8)
multiplosDeN :: Integer -> [Integer] -> [Integer]
multiplosDeN _ [] = []
multiplosDeN n (x:xs)
  | mod x n == 0 = x:multiplosDeN n xs
  | otherwise = multiplosDeN n xs

-- 9)
ordenar :: [Integer] -> [Integer]
ordenar [] = []
ordenar xs = ordenar (quitar (maximo xs) xs) ++ [maximo xs]

ordenarDesc :: [Integer] -> [Integer]
ordenarDesc [] = []
ordenarDesc xs = maximo xs:ordenarDesc (quitar (maximo xs) xs)

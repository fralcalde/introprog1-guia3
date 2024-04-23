pertenece :: (Eq t) => t -> [t] -> Bool
pertenece e [] = False
pertenece e (x:xs)
    | e == x = True
    | otherwise = pertenece e xs

hayRepetidos :: (Eq t) => [t] -> Bool
hayRepetidos [] = False
hayRepetidos (x:xs)
    | pertenece x xs = True
    | otherwise = hayRepetidos xs
-- hayRepetidos (x:xs) = pertenece x xs || hayRepetidos xs

quitar :: (Eq t) => t -> [t] -> [t]
quitar _ [] = []
quitar e (x:xs)
    | e == x = xs
    | otherwise = x:quitar e xs

maximo :: (Eq t, Ord t) => [t] -> t
maximo [x] = x
maximo (x1:x2:xs)
    | x1 >= x2 = maximo (x1:xs)
    | otherwise = maximo (x2:xs)

--maximo (x:xs)
--    | x >= head xs = maximo (x:quitar (head xs) xs)
--    | otherwise = maximo xs

ordenarDesc :: [Integer] -> [Integer]
ordenarDesc [] = []
ordenarDesc xs = ordenarDesc (quitar (maximo xs) xs) ++ [maximo xs]
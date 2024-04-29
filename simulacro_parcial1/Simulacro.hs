module Simulacro where

    -- Ejercicio 1
    esReflexiva :: (Eq t) => (t, t) -> Bool
    esReflexiva (a, b)
        | a == b = True
        | otherwise = False

    sonEquivalentes :: (Eq t) => (t, t) -> (t, t) -> Bool
    sonEquivalentes (a, b) (c, d)
        | (a == c && b == d) || (a == d && b == c) = True
        | otherwise = False

    inRelaciones :: (Eq t) => (t, t) -> [(t, t)] -> Bool
    --pertenece :: (Eq t) => t -> [t] -> Bool
    inRelaciones _ [] = False
    inRelaciones elem (x:xs) 
        | sonEquivalentes elem x = True
        | otherwise = inRelaciones elem xs

    relacionesValidas :: [(String, String)] -> Bool
    relacionesValidas [] = True
    relacionesValidas (rel:relaciones)
        | esReflexiva rel || inRelaciones rel relaciones = False
        | otherwise = relacionesValidas relaciones
    
    -- Ejercicio 2
    pertenece :: (Eq t) => t -> [t] -> Bool
    pertenece _ [] = False
    pertenece elem (x:xs)
        | elem == x = True
        | otherwise = pertenece elem xs

    addPersona :: String -> [String] -> [String]
    addPersona p [] = [p]
    addPersona p xs
        | pertenece p xs = xs
        | otherwise = p:xs

    personas :: [(String, String)] -> [String]
    personas [] = []
    personas ((p1, p2):xs) = addPersona p1 (addPersona p2 (personas xs))

    -- Ejercicio 3
    amigosDe :: String -> [(String, String)] -> [String]
    amigosDe _ [] = []
    amigosDe p ((a1, a2):relaciones) 
        | p == a1 = addPersona (a2) (amigosDe p relaciones)
        | p == a2 = addPersona (a1) (amigosDe p relaciones)
        | otherwise = amigosDe p relaciones

    -- Ejercicio 4
    contarAmigos :: String -> [(String, String)] -> Integer
    contarAmigos _ [] = 0
    contarAmigos p ((a1, a2):xs)
        | p == a1 || p == a2 = 1 + contarAmigos p xs
        | otherwise = contarAmigos p xs 

    personaConMasAmigos :: [(String, String)] -> String
    personaConMasAmigos rs = pConMasAmigos (personas rs) (cantidadesDeAmigos (personas rs) rs)

    cantidadesDeAmigos :: [String] -> [(String, String)] -> [Integer]
    cantidadesDeAmigos [] _ = []
    cantidadesDeAmigos (p1:ps) rs = contarAmigos p1 rs:cantidadesDeAmigos ps rs

    pConMasAmigos :: [String] -> [Integer] -> String
    pConMasAmigos [p1] [c1] = p1
    pConMasAmigos (p1:p2:ps) (c1:c2:cs)
        | c1 >= c2 = pConMasAmigos (p1:ps) (c1:cs)
        | otherwise = pConMasAmigos (p2:ps) (c2:cs)
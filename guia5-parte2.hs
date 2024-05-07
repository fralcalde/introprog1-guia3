-- Ejercicio 1
-- a)
type Punto2D = (Float, Float)

prodInt :: Punto2D -> Punto2D -> Punto2D
prodInt (a, b) (c, d) =  (a * c, b * d)

-- b)
todoMenor :: Punto2D -> Punto2D -> Bool
todoMenor (a, b) (c, d) = a < c && b < d

-- c)
distanciaPuntos :: Punto2D -> Punto2D -> Float
distanciaPuntos a b = sqrt((fst a - fst b)^2 + (snd a - snd b)^2)

-- d)
type Coordenada = Punto2D

crearPar :: Float -> Float -> Coordenada
crearPar a b = (a, b)

-- Ejercicio 2
type Año = Integer
type EsBisiesto = Bool

bisiesto :: Año -> EsBisiesto
bisiesto y = not (mod y 4 /= 0 || (mod y 100 == 0 && mod y 400 /= 0))

-- Ejercicio 3
type Coordenada3d = (Float, Float, Float)

distanciaManhattan :: Coordenada3d -> Coordenada3d -> Float
distanciaManhattan (a1, a2, a3) (b1, b2, b3) = abs(a1 - b1) + abs(a2 - b2) + abs(a3 - b3)

-- Ejercicio 4

type Texto = [Char]
type Nombre = Texto
type Telefono = Texto
type Contacto = (Nombre, Telefono)
type ContactosTel = [Contacto]

elNombre :: Contacto -> Nombre
elNombre c = fst c

elTelefono :: Contacto -> Telefono
elTelefono c = snd c

enLosContactos :: Nombre -> ContactosTel -> Bool
enLosContactos _ [] = False
enLosContactos nombre (contacto:lista)
  | nombre == elNombre contacto = True
  | otherwise = enLosContactos nombre lista

agregarContacto :: Contacto -> ContactosTel -> ContactosTel
agregarContacto c l 
  | enLosContactos (fst c) l = actualizarNumero c l
  | otherwise = c:l

actualizarNumero :: Contacto -> ContactosTel -> ContactosTel
actualizarNumero _ [] = []
actualizarNumero c (e:l)
  | fst c == fst e = c:l
  | otherwise = e:actualizarNumero c l

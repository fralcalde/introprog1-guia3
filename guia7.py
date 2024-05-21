# Ejercicio 1
# 1.
def pertenece1(l: list[int], elem: int) -> int:
    pertenece: bool = False
    for e in l:
        if e == elem:
            pertenece = True
    
    return pertenece

def pertenece2(l: list[int], elem: int) -> int:
    pertenece: bool = False
    for i in range(len(l)):
        if l[i] == elem:
            pertenece = True
    
    return pertenece

def pertenece3(l: list[int], elem: int) -> int:
    pertenece: bool = False
    indice: int = 0
    
    while indice < len(l):
        pertenece = pertenece or l[indice] == elem
        indice = indice + 1

    return pertenece
# 2.
def divide_a_todos(l: list[int], e: int) -> bool:
    divide: bool = True
    
    for elem in l:
        divide = divide and elem % e == 0
    
    return divide
# 3.
def suma_total(l: list[int]) -> int:
    suma: int = 0
    indice: int = 0
    
    while indice < len(l):
        suma = suma + l[indice]
        indice = indice + 1

    return suma

# 4.
def ordenados(l: list[int]) -> bool:
    ordenados: bool = True
    indice: int = 0

    while indice < len(l) - 1:
        ordenados = ordenados and l[indice] <= l[indice + 1]
        indice = indice + 1

    return ordenados

# 5.
def contiene_palabra_larga(l: list[str]) -> bool:
    larga: bool = False
    for i in range(len(l)):
        larga = larga or len(l[i]) > 7

    return larga

# 6.
def es_palindromo(texto: str) -> bool:
    palindromo: bool = True
    indice: int = 0

    while indice < len(texto):
        palindromo = palindromo and texto[indice] == texto[len(texto) - 1 - indice]
        indice = indice + 1

    return palindromo
    
# 7.
def fortaleza(clave: str) -> str:
    indice: int = 0
    fuerza: str = "AMARILLA"
    
    tiene_minus: bool = False
    tiene_mayus: bool = False
    tiene_num: bool = False
    
    while indice < len(clave):
        c: chr = clave[indice]
        tiene_minus = tiene_minus or es_minus(c)
        tiene_mayus = tiene_mayus or es_mayus(c)
        tiene_num = tiene_num or es_num(c)

        indice = indice + 1

    if len(clave) < 5:
        fuerza = "ROJA"
    
    if len(clave) > 8 and tiene_minus and tiene_mayus and tiene_num:
        fuerza = "VERDE"

    return fuerza

def es_minus(c: chr) -> bool:
    return 'a' <= c and c <= 'z'

def es_mayus(c: chr) -> bool:
    return 'A' <= c and c <= 'Z'

def es_num(c: chr) -> bool:
    return '0' <= c and c <= '9'

# 8.
def saldo_actual(movimientos: list[tuple[str, int]]) -> int:
    indice: int = 0
    saldo_actual: int = 0
    
    while indice < len(movimientos):
        mov: tuple[str, int] = movimientos[indice]

        if mov[0] == "I":
            saldo_actual = saldo_actual + mov[1]
        else:
            saldo_actual = saldo_actual - mov[1]

        indice = indice + 1

    return saldo_actual
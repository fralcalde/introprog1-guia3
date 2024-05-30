import random
import typing
# Ejercicio 1
# 1.

def contar_lineas(path: str) -> int:
    f: typing.IO = open(path, 'r')
    lines: list[str] = f.readlines()
    f.close() 

    return len(lines)

# 2.
def contiene_substring(sub: str, s: str) -> bool:
    contiene: bool = False

    for pos in range(len(s)):
        if s[pos] == sub[0]:
            contiene = True
            for sub_pos in range(len(sub)):
                contiene = contiene and s[pos + sub_pos] == sub[sub_pos]

    return contiene

def existe_palabra(palabra: str, path: str) -> bool:
    f: typing.IO = open(path, 'r')
    existe: bool = False
    lines: str = f.readlines()
    f.close() 

    for line in lines:
        existe = contiene_substring(palabra, line)

        if existe: break

    return existe

# Ejercicio 2
def es_comentario(line: str) -> bool:
    res: bool = False
    index: int = 0

    while line[index] == ' ':
        index = index + 1

    res = line[index] == '#'
    return res

def clonar_sin_comentarios(path: str) -> None:
    f: typing.IO = open(path, 'r')
    new_f: typing.IO = open(path + "sin_comentarios", 'w')
    lines: list[str] = f.readlines()
    f.close()

    for line in lines:
        if not es_comentario(line):
            new_f.write(line)

    new_f.close()

clonar_sin_comentarios("guia8/archivo1")

# Ejercicio 8
from queue import LifoQueue as Pila

def copiar_pila(pila: Pila) -> Pila:
    nueva: Pila = Pila()
    pila_temp: Pila = Pila()

    while not pila.empty():
        elem = pila.get()
        pila_temp.put(elem)
        
    while not pila_temp.empty():
        elem = pila_temp.get()
        pila.put(elem)
        nueva.put(elem)

    return nueva

# Es super lenta porque cada vez que insertamos, contamos de nuevo todos los elementos
def generar_nros_al_azar(cant: int, desde: int, hasta: int) -> Pila[int]:
    pila: Pila[int] = Pila()

    while contar_elementos(pila) <= cant:
        elem: int = random.randint(desde, hasta)
        pila.put(elem)

    return pila

def generar_nros_al_azar2(cant: int, desde: int, hasta: int) -> Pila[int]:
    pila: Pila[int] = Pila()

    for _ in range(cant):
        elem: int = random.randint(desde, hasta)
        pila.put(elem)

    return pila

# Ejercicio 9
def contar_elementos(pila: Pila) -> int:
    cantidad: int = 0
    p: Pila = copiar_pila(pila)
    
    while not p.empty():
        p.get()
        cantidad = cantidad + 1

    return cantidad

# Ejercicio 10
def buscar_el_maximo(p: Pila[int]) -> int:
    p_aux: Pila[int] = copiar_pila(p)
    max: int = p_aux.get()

    while not p_aux.empty():
        elem: int = p_aux.get()

        if elem > max:
            max = elem

    return max
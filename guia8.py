import random
import typing
from queue import LifoQueue as Pila
from queue import Queue as Cola
from guia7 import pertenece2 as pertenece
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

        if existe:
            break

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


# Es super lenta porque cada vez que insertamos,
# contamos de nuevo todos los elementos
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


# Ejercicio 11
def esta_bien_balanceada(formula: str) -> bool:
    # A partir de un '(' llamar recursivamente buscar el ')'.
    # Pero no puedo hacer slicing me parece.
    # Capaz se puede resolver con Pilas y Colas
    return False


# Ejercicio 12

def evaluar_expresion(expresion: str) -> float:
    tokens: list[str] = []


def split_string(s: str, sep: chr) -> list[str]:
    res: list[str] = [""]
    index: int = 0

    for character in s:
        if character == ' ':
            res.append("")
            index = index + 1
        else:
            res[index] = res[index] + character

    return res


# Ejercicio 13

def generar_cola_nros_al_azar(cantidad: int, desde: int, hasta: int) -> Cola[int]:
    cola: Cola[int] = Cola()

    for _ in range(cantidad):
        elem: int = random.randint(desde, hasta)
        cola.put(elem)

    return cola


# Ejercicio 16
# No puede haber repetidos
# 1.
def armar_secuencia_de_bingo() -> Cola[int]:
    secuencia: list[int] = []
    cola: Cola[int] = Cola()

    while len(secuencia) < 100:
        elem: int = random.randint(0, 99)
        if not pertenece(secuencia, elem):
            secuencia.append(elem)
            cola.put(elem)

    return cola


# 2.
def jugar_carton_de_bingo(carton: list[int], bolillero: Cola[int]) -> int:
    extracciones: int = 0
    aciertos: int = 0
    # bolillero: Cola[int] = copiar_cola(bolillero)

    while not bolillero.empty() and aciertos < len(carton):
        extraccion: int = bolillero.get()
        if pertenece(carton, extraccion):
            aciertos = aciertos + 1

        extracciones = extracciones + 1

    return extracciones


def nuevo_carton(size: int) -> list[int]:
    carton: list[int] = []

    while len(carton) < size: 
        elem: int = random.randint(0, 99)
        if not pertenece(carton, elem):
            carton.append(elem)

    return carton


# Ejercicio mio porque si:
def test_esperanza_bingo(test_size: int, carton_size: int) -> float:
    acum = 0
    for i in range(test_size):
        carton = nuevo_carton(carton_size)
        bolillero = armar_secuencia_de_bingo()

        cant = jugar_carton_de_bingo(carton, bolillero)

        acum = acum + cant

    esp: float = acum / test_size
    print("esperanza empirica: ", esp)
    return esp


# Ejercicio 19
def agrupar_por_longitud(path: str) -> dict[int, int]:
    f: typing.IO = open(path, 'r')
    words: list[str] = palabras_en_archivo(f)
    distrib: dict[int, int] = dict()
    print(words)

    for word in words:
        size: int = len(word)
        if pertenece(list(distrib.keys()), size):
            distrib[size] = distrib[size] + 1
        else:
            distrib[size] = 1

    return distrib


def palabras_en_archivo(f: typing.IO) -> list[str]:
    lista: list[str] = []

    for line in f.readlines():
        line = line.replace('\n', '')
        palabras: list[str] = split_string(line, ' ')

        lista = lista + palabras

    return lista


# Ejercicio 21
def palabra_mas_frecuente(path: str) -> str:
    f: typing.IO = open(path, 'r')
    words: list[str] = palabras_en_archivo(f)
    frec: dict[str, int] = frecuencias(words)

    best_word: str = ""
    apariciones: int = 0

    for key in frec.keys():
        if apariciones < frec[key]:
            best_word = key
            apariciones = frec[key]

    return best_word


def frecuencias(words: list[str]) -> dict[str, int]:
    res: dict[str, int] = dict()

    for word in words:
        if pertenece(list(res.keys()), word):
            res[word] = res[word] + 1
        else:
            res[word] = 1

    return res

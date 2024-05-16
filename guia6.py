import math

# Ejercicio 1
# 1)
def imprimir_hola_mundo() -> None:
    saludo: str = "Hola Mundo" 
    print(saludo)

# 2)
def imprimir_un_verso():
    print("Pibe cantina de que te la das?\nSi sos un laucha borracho y aragán.")

# 3)
def raizDe2() -> float:
    return round(math.sqrt(2), 4)

# 4)
def factorial_de_dos() -> int:
    return 2 * 1

# 5)
def perimetro() -> float:
    return 2 * math.pi

# Ejercicio 2
# 1)
def imprimir_saludo(nombre: str) -> None:
    print("Hola", nombre)

# 2)
def raiz_cuadrada_de(num: int) -> float:
    return math.sqrt(num)

# 3)
def farenheit_a_celsius(val: float) -> float:
    return (val - 32) * 5/9

# 4)
def imprimir_dos_veces(estribillo: str) -> None:
    print(estribillo * 2)

# 5)
def es_multiplo_de(n: int, m: int) -> bool:
    es_multiplo: bool = n % m == 0
    return es_multiplo

# 6)
def es_par(num: int) -> bool:
    return es_multiplo_de(num, 2)

# 7)
def cantidad_de_pizzas(comensales: int, min_cant_porciones: int) -> int:
    cant_pizzas: int = math.ceil(comensales * min_cant_porciones / 8)
    return cant_pizzas

# Ejercicio 3
# 1)
def alguno_es_0(num1: float, num2: float) -> bool:
    return num1 == 0 or num2 == 0

# 2)
def ambos_son_0(num1: float, num2: float) -> bool:
    return num1 == 0 and num2 == 0

# 3)
def es_nombre_largo(nombre: str) -> bool:
    return 3 <= len(nombre) and len(nombre) <= 8

# 4)
def es_bisiesto(anio: int) -> bool:
    es_bisiesto: bool = es_multiplo_de(anio, 400) or (es_multiplo_de(anio, 4) and not es_multiplo_de(anio, 100))
    return es_bisiesto

# Ejercicio 4
# 1)
def peso_pino(cm: int) -> int:
    if cm == 1:
        return 3
    
    if cm > 300:
        return peso_pino(cm - 1) + 2
    else:
        return peso_pino(cm - 1) + 3

# 2)
def es_peso_util(peso_en_kg: int) -> bool:
    return 400 <= peso_en_kg and peso_en_kg <= 1000

# 3)
def sirve_pino(cm: int) -> bool:
    peso: int = peso_pino(cm)
    return es_peso_util(peso)

# 4)
def sirve_pino_composicion(cm: int) -> bool:
    return es_peso_util(peso_pino(cm))

# Ejercicio 5
# 1)
def devolver_el_doble_si_es_par(num: int) -> int:
    res: int = num
    if num % 2 == 0:
        res = num * 2
    return res 

# Ejercicio 6
# 1)
def nums_1_a_10() -> None:
    i = 1
    while i <= 10:
        print(i)
        i = i + 1

# 2)
def pares_10_a_40() -> None:
    start = 10
    step = start
    while step <= 40:
        print(step)
        step = step + 2

# 3)
def eco_10_veces() -> None:
    i = 0
    while i < 10:
        print("eco")

# 4)
def cuenta_regresiva(cuenta: int) -> None:
    i = cuenta
    while i > 0:
        print(i)
        i = i - 1
    
    print("Despegue!")

# 5)
def monitor_viaje_en_el_tiempo(partida: int, llegada: int) -> None:
    i = partida - 1
    while i >= llegada:
        print("Viajó un año al pasado, estamos en el año:", i)
        i = i - 1

# 6) me da fiaca

# Ejercicio 6 -- da un poco de fiaca tambien pero bueno
# 1)
def nums_1_a_10_for() -> None:
    for num in range(1, 11):
        print(num)

# 2)
def pares_10_a_40_for() -> None:
    for num in range(10, 41, 2):
        print(num)

# 3)
def eco_10_veces_for() -> None:
    for _ in range(1, 11):
        print("eco")

# 4)
def cuenta_regresiva_for(cuenta: int) -> None:
    for num in range(cuenta, 0, -1):
        print(num)
    
    print("Despegue!")

# 5)
def monitor_viaje_en_el_tiempo_for(partida: int, llegada: int) -> None:
    for anio in range(partida - 1, llegada - 1, -1):
        print("Viajó un año al pasado, estamos en el año:", anio)
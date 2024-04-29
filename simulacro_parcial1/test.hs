import Test.HUnit
import Simulacro

main = runTestTT esReflexivaTests

esReflexivaTests = test [
    "Relación reflexiva" ~: esReflexiva ("a", "a") ~?= True,
    "Relación no reflexiva" ~: esReflexiva ("a", "b") ~?= False
    ]

inRelacionesTests = test [
    "Lista vacía" ~: inRelaciones (1, 2) [] ~?= False,
    "Elemento no pertenece" ~: inRelaciones (1, 2) [(5, 3), (4, 6)] ~?= False,
    "Elemento si pertenece" ~: inRelaciones (1, 2) [(1, 2)] ~?= True,
    "Elemento equivalente pertenece" ~: inRelaciones (1, 2) [(2, 1)] ~?= True
    ]

ningunaRelacion = []

todasValidas = [
    ("u1", "u2"),
    ("u3", "u2"),
    ("u3", "u1")
    ]

contieneNoValidas = [
    ("u2", "u2")
    ]

contieneRepetidas = [
    ("u2", "u3"),
    ("u2", "u3")
    ]

contieneEquivalentes = [
    ("u1", "u2"),
    ("u2", "u1")
    ]

relacionesValidasTests = test [
    "Lista vacía" ~: relacionesValidas ningunaRelacion ~?= True,
    "Todas válidas" ~: relacionesValidas todasValidas ~?= True,
    "Contiene no válidas" ~: relacionesValidas contieneNoValidas ~?= False,
    "Contiene repetidas" ~: relacionesValidas contieneRepetidas ~?= False,
    "Contiene equivalentes" ~: relacionesValidas contieneEquivalentes ~?= False
    ]

personasCaso2 = [
    ("Joe", "Frank"),
    ("Laura", "Beethoven"),
    ("Laura", "Travis")
    ]

personasTests = test [
    "Lista vacía" ~: personas ningunaRelacion ~?= [],
    "Caso 1" ~: personas todasValidas ~?= ["u2", "u3", "u1"],
    "Caso 2" ~: personas personasCaso2 ~?= ["Joe", "Frank", "Beethoven", "Laura", "Travis"]
    ]

amigosDeTests = test [
    "Amigos de Laura" ~: amigosDe "Laura" personasCaso2 ~?= ["Beethoven", "Travis"]
    ]

contarAmigosTests = test [
    "Cantidad amigos de Laura" ~: contarAmigos "Laura" personasCaso2 ~?= 2
    ]

caso3 = [
    ("Joe", "Frank"),
    ("Laura", "Beethoven"),
    ("Joe", "Laura"),
    ("Laura", "Marisha")
    ]
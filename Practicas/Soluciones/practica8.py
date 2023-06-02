import random
import numpy as np
# Ejercicio 1
#1.1
def pertenece(l :list, e: int) -> bool:
    if e in l:
        return True
    else:
        return False

def perteneceV2(l, e):
    if e in l:
        return True
    else:
        return False
# Si la implementaramos con tipos genéricos, puede buscar un caracter dentro de un string (funciona)
#1.2
def divideATodos(s: list[int], e:int) -> bool:
    for i in s:
        if i % e != 0:
            return False
    return True
#1.3
def sumaTotal(s: list[int]) -> int:
    suma = 0
    for i in s:
        suma += i
    return suma
#1.4
def ordenados(s: list[int]) -> bool:
    elemanterior: int = s[0]
    s = s[1::]
    for i in s:
        if elemanterior > i:
            return False
        else:
            elemanterior = i
    return True
#1.5
def palabraMayorA7(l: list[str]) -> bool:
    for i in l:
        if len(i) > 7:
            return True
    return False
#1.6
def espalındroma(l: str) -> bool:
    l = l.lower() # pasa a l todo a lowercase
    for i in l:
        if i != l[-1]:
            return False
        else:
            l = l[:-1:]
    return True
#1.7
def contraFuerte(c: str) -> str:
    def tieneDigito(a:str) -> bool:
        for i in a:
            if i.isdigit():
                return True
        return False
    verde: bool = len(c) > 8  and (not c.islower()) and (not c.isupper()) and tieneDigito(c)
    if verde:
        return "VERDE"
    elif len(c) < 5:
        return "ROJA"
    else:
        return "AMARILLA"
#1.8
def historiaBancaria(l: list) -> int:
    saldo: int = 0
    for i in l:
        if i[0] == "I":
            saldo += i[-1]
        elif i[0] == "R":
            saldo = saldo - i[-1]
    return saldo
#1.9
def tiene3VocalesDistintas(palabra: str) -> bool:
    palabra.lower()
    vocaleshalladas: list = []
    for letra in palabra:
        if letra == 'a' or letra == 'e' or letra == 'i' or letra == 'o' or letra == 'u':
            vocaleshalladas.append(letra)
    if len(vocaleshalladas) >= 3:
        return True
    else:
        return False

#Ejercicio 2
#2.1
def ceroEnPosParInOut(l: list[int]) -> list:
    for i in range(len(l)):
        if i % 2 == 0:
            l[i] = 0
    return l

#2.2
def ceroEnPosParIn(l:list[int])-> list:
    listaNueva: list = []
    for i in range(len(l)):
        if i % 2 == 0:
            listaNueva.append(0)
        else:
            listaNueva.append(i)
    return listaNueva

#2.3
def sinVocales(text: str) -> str:
    vocales: list[str] = ["a", "e", "i", "o", "u"]
    nuevoText: str = ""
    for letter in text:
        if letter not in vocales:
            nuevoText += letter
    return nuevoText

#2.4
def remplazaVocales(text: str) -> str:
    vocales: list[str] = ["a", "e", "i", "o", "u"]
    nuevoText: str = ""
    for letter in text:
        if letter in vocales:
            nuevoText += "_"
        else:
            nuevoText += letter
    return nuevoText

#2.5
def daVueltaString(text: str) -> str:
    textDadoVuelta : str = ""
    for i in range(len(text)-1, -1, -1):
        textDadoVuelta += text[i]
    return textDadoVuelta

#Ejercicio 3
#3.1
def listaEstudiantes()-> list[str]:
    stringDeNombres: str = input("lista de estudiantes hasta listo: ")
    lista: list[str] = []
    palabra = ""
    for letra in stringDeNombres:
        if letra != " ":
            palabra += letra
        else:
            lista.append(palabra)
            palabra = ""
    lista.append(palabra) #agrega la ultima palabra al terminar el for
    return lista[:lista.index("listo"):]

#3.2
def sube()-> int:
    saldo = 0
    historial: list = []
    tipoDeOperacion = ""
    while tipoDeOperacion != "X":
        tipoDeOperacion = input("OPERACION A REALIZAR: ")
        if tipoDeOperacion == "C":
            monto = int(input("MONTO: "))
            saldo += monto
            historial.append((tipoDeOperacion, monto))
        elif tipoDeOperacion == "D":
            monto = int(input("MONTO: "))
            saldo = saldo - monto
            historial.append((tipoDeOperacion, monto))
    return historial

#3.4
def sieteYMedio() -> list[int]:
    cartasPosibles = [1,2,3,4,5,6,7,10,11,12] # el 8 y el 9 no juegan, 10,11,12 valen medio punto
    manoDelJugador = []
    accionDelJugador = ""

    def sumaDeLaMano(l: list[int]) -> float: #funcion que suma las cartas del jugador
        suma = 0
        for i in l:
            if i >= 10:
                suma += 0.5
            else:
                suma += i
        return suma
    
    def ganoONoElPlayer(): # cuando el jugador se planta, se fija si gano o no
        suma = sumaDeLaMano(manoDelJugador)
        if suma == 7.5:
            print("Ganste sos god!")
        else:
            print("Perdiste :( , sumaste: ", suma)
    
    #arranca el juego
    print("COMIENZA EL JUEGO!! \n")
    #agarra la primera carta
    manoDelJugador.append(random.choice(cartasPosibles))
    #se fija las posibles acciones del jugador
    while accionDelJugador != "plantarse":
        if sumaDeLaMano(manoDelJugador) > 7.5: # se fija si el jugador suma mas de 7.5
            print("Perdiste :(, te pasaste de 7.5")
            return manoDelJugador
        print("Tenes ", manoDelJugador, " en mano")
        accionDelJugador = input("agarras una carta o te plantas?: (poner plantarse o agarrar otra)\n")
        if accionDelJugador == "plantarse":
            ganoONoElPlayer()
            return manoDelJugador
        else:
            manoDelJugador.append(random.choice(cartasPosibles)) #agarra una carta
#Ejercicio 4
#4.1
def perteneceACadaUno(l: list[list[int]], elem: int):
    res: list[bool] = []
    for sublista in l:
        if pertenece(sublista, elem) == True:
            res.append(True)
        else:
            res.append(False)
    print(res)
#4.2
def esMatriz(s: list[list[int]]) -> bool:
    #se fija que s no sea vacia:
    if len(s) == 0:
        return False
    for columna in s:
        longitudColumna = len(s[0])
        if len(columna) == 0:
            return False
        elif len(columna) != longitudColumna:
            return False
    return True
#4.3
def filasOrdenadas(m: list[list[int]]):
    res: list[bool] = []
    for i in m:
        if ordenados(i) == True:
            res.append(True)
        else:
            res.append(False)
    print(res)

#4.4
def potenciaMatriz(d: int, p: float):
    m = np.random.random((d, d))**2 # se generaria una matriz random de tamanio d
    nuevaMatriz = m
    # si se eleva a 1 directamente imprime m
    if p == 1:
        print(m)
    else:
        incremento = 1
        while incremento != p: 
            #esta parte multiplica una m por la nueva matriz
            matrizActualizada = []
            nuevaFila = []
            for fila in range(len(m)):
                if nuevaFila != []:
                    matrizActualizada.append(nuevaFila)
                    nuevaFila = []
                for columna in range(len(m[fila])):
                    n = 0
                    elem = 0
                    while n!= d:
                        elem += nuevaMatriz[fila][n] * m[n][columna]
                        n += 1 
                    nuevaFila.append(elem) #va creando la nueva fila de la matriz actualizada
            #agrega la ultima fila a matriz actualizada
            matrizActualizada.append(nuevaFila)
            nuevaMatriz = matrizActualizada
            incremento += 1
    print(nuevaMatriz)
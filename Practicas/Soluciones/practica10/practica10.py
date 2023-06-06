import random
from queue import LifoQueue as Pila
from queue import Queue as Cola
#Ejercicio 1 
def contarlineas(nombre_archivo : str) -> int:
    f = open(nombre_archivo, "r")
    contador : int = 0
    for i in f.readlines():
        contador += 1
    f.close()
    return contador
def existePalabra(palabra: str, nombre_archivo : str) -> bool:
    f = open(nombre_archivo, "r")
    word = ""
    for line in f.readlines():
        for letter in line:
            if letter != " " and letter != "\n":
                word = word + letter
            else:
                if word == palabra:
                    f.close()
                    return True
                else:
                    word = ""
    f.close
    return False

def cantidadApariciones(nombre_archivo: str, palabra: str) -> int:
    f = open(nombre_archivo, "r")
    contador = 0
    word = ""
    for line in f.readlines():
        for letter in line:
            if letter != " " and letter != "\n":
                word = word + letter
            else:
                if word == palabra:
                    contador += 1
                else:
                    word = ""
    f.close
    return contador

# Ejercicio 2
def sacarComentarios(nombre_archivo):
    f = open(nombre_archivo, "r")
    f2 = open("newFile.txt", "x")
    lines = f.readlines()
    for line in lines:
        nuevaLine = ""
        i = 0
        while line[i] != "#":
            nuevaLine += line[i]
            i += 1
        if nuevaLine.count(" ") != len(nuevaLine):
            f2.writelines(nuevaLine + "\n")
    f.close()
    f2.close()

#Ejercicio 3
def reverso(nombre_archivo: str):
    f = open(nombre_archivo, "r")
    f2 = open("reverso.txt", "x")
    lineas = f.readlines()
    for i in range(-1, -(len(lineas))-1, -1):
        f2.writelines(lineas[i])
    f2.close()
    f.close()

#Ejercicio 4
def escribirFrase(nombre_archivo : str, frase : str):
    f = open(nombre_archivo, "a")
    f.write("\n" + frase)
    f.close()

#Ejercicio 5
def idem(nombre_archivo : str, frase: str):
    f = open(nombre_archivo, "r")
    lines = [frase + "\n"] + f.readlines()
    f.close()
    f = open(nombre_archivo, "w")
    for line in lines:
        f.write(line)
    f.close


# Ejercicio 6 
#consultar
def palabrasLegibles(nombre_archivo: str) -> list[str]:
    palabrasLegibles = []
    f = open(nombre_archivo, "r")
    palabra = ""
    for lines in f.readlines():
        for letter in lines:
            if len(palabra) >= 5:
                palabrasLegibles.append(palabra)
                palabra = ""
            elif (letter.isalpha() == True) or (letter.isalnum() == True) or (letter == "_") or (letter == " "):
                palabra += letter
    palabrasLegibles.append(palabra) #agrega la ultima palabra del for
    f.close() 
    return palabrasLegibles


# Ejercicio 7
archivo_notas = "/Users/luciasilva.com.uy/Desktop/Programing Projects/Universidad/Intro a la programacion/IP/Practicas/Soluciones/practica10/notas.csv" #archivo cvs que contiene las notas del curso

def promedio(lu: str) -> float:
    f = open(archivo_notas, "r")
    # a partir del archivo creo una lista con la info que este me da
    listaDeInfoNotas: list[list[str]] = []
    for line in f.readlines():
        lineaFormatoLista = []
        string = ""
        for letter in line:
            if letter == "\n":
                lineaFormatoLista.append(string)
            if letter != ",":
                string += letter
            else:
                lineaFormatoLista.append(string)
                string = ""
        listaDeInfoNotas.append(lineaFormatoLista)
    lineaFormatoLista.append(string)
    f.close()
    #calculo de promedios
    sumaNotas = 0
    cantidadMaterias = 0
    for info in listaDeInfoNotas:
        if info[0] == lu:
            sumaNotas += int(info[-1])
            cantidadMaterias += 1
    promedio = sumaNotas / cantidadMaterias
    return promedio
                 
#Ejercicio 8
def generarNrosAlAzar(n : int, desde: int, hasta: int) -> list[int]:
    listaDeNumsPosibles = []
    for i in range(desde, hasta):
        listaDeNumsPosibles.append(i)
    return random.sample(listaDeNumsPosibles, n)

#Ejercicio 9
def pilaAlAzar() -> Pila:
    listaNums : list[int] = generarNrosAlAzar(2,1,9)
    p = Pila()
    for i in listaNums:
        p.put(i)
    return p

# Ejercicio 10
def cantidadElementos(p : Pila) -> int:
    cantidad = 0
    while p.empty() != True:
        p.get()
        cantidad += 1
    return cantidad

#Ejercicio 11
def buscarElMaximo(p: Pila) -> int:
    maximo = p.get()
    while p.empty() != True:
        elemento = p.get()
        if elemento > maximo:
            maximo = elemento
    return maximo

#Ejercicio 12
#chequear
def estaBienBalanceada(s : str) -> bool:
    operacionesBasicas = ["+", "-", "x" "/"]
    for i in range(len(s)):
        if (s[i] in operacionesBasicas):
            if s[i+1] != " ":
                return False
        if s[i] == ")":
            if "(" not in s[:i:]:
                return False

#Ejercicio 13
def generarQueue() -> Cola:
    listaNums = generarNrosAlAzar(3,1,4)
    c = Cola()
    for i in listaNums:
        c.put(i)
    return c

#Ejercicio 14
def cantidadElementosCola(c : Cola) -> int:
    cantidad = 0
    while c.empty() != True:
        cantidad += 1
        c.get()
    return cantidad

#Ejercicio 15
def buscarElMaximoCola(c: Cola) -> int:
    maximo = c.get()
    while c.empty() != True:
        elemento = c.get()
        if elemento > maximo:
            maximo = elemento
    return maximo

#Ejercicio 16
#16.1
def armarSecuenciaDeBingo() -> Cola[int]:
    c = Cola()
    numeros = []
    for i in range(0,100):
        numeros.append(i)
    numeros = random.sample(numeros, 99)
    for i in numeros:
        c.put(i)
    return c

#16.2
def jugarCartonDeBingo(carton: list[int], bolillero : Cola[int]) -> int:
    jugadas = 0
    while carton != []:
        elemento = bolillero.get()
        if elemento in carton:
            carton.remove(elemento)
        jugadas += 1
    return jugadas

#17
def nPacientesUrgentes(c : Cola[(int, str, str)]) -> int:
    pacientesUrgentes = 0
    while c.empty() != True:
        paciente = c.get()
        if paciente[0] <= 3:
            pacientesUrgentes += 1
    return pacientesUrgentes

#18
def agruparPorLongitud(nombre_archivo : str) -> dict:
    diccionario = {}
    f = open(nombre_archivo, "r")
    def inDict(n: int, diccionario : dict):
        if n in diccionario:
                    diccionario[n] = diccionario[n] + 1
        else:
                diccionario[n] = 1
    lenPalabra = 0            
    for line in f.readlines():
        for  letra in line:
            if letra == " " or letra == "\n":
                # Esta la palabra en el diccionario?
                inDict(lenPalabra, diccionario)
                lenPalabra = 0 
            else:
                lenPalabra += 1
    #si quedo una palabra en len palabra sin agregar la agrega
    if lenPalabra != 0:
        inDict(lenPalabra, diccionario)
    f.close()
    return diccionario

#Ejercicio 19
def promedioNotasDict(nombre_archivo) -> dict:
    diccionario = {}
    f = open(nombre_archivo, "r")
    # a partir del archivo creo una lista con la info que este me da
    listaDeInfoNotas: list[list[str]] = []
    for line in f.readlines():
        lineaFormatoLista = []
        string = ""
        for letter in line:
            if letter == "\n":
                lineaFormatoLista.append(string)
            if letter != ",":
                string += letter
            else:
                lineaFormatoLista.append(string)
                string = ""
        listaDeInfoNotas.append(lineaFormatoLista)
    lineaFormatoLista.append(string)
    f.close()
    #agrego al diccionario con la clave lu y el valor como una lista [suma notas, cantidad de materias]
    for i in listaDeInfoNotas:
        if i[0] in diccionario:
            notaymaterias = diccionario[i[0]]
            notaymaterias[0] =int(notaymaterias[0]) + int(i[-1])
            notaymaterias[1] += 1
        else:    
             #[notas, cantidad de notas]
            diccionario[i[0]] = [i[-1], 1]
    #calculo los promedios
    for i in diccionario:
        diccionario[i] = diccionario[i][0] / diccionario[i][1]
    return diccionario

#Ejercicio 20
def laPalabraMasFrecuente(nombre_archivo : str) -> str:
    f = open(nombre_archivo, "r")
    diccionario = {}
    palabra = ""
    for line in f.readlines():
        for letter in line:
            if letter == "\n":
                continue # si llega a un enter, lo ignora
            elif letter != " ":
                palabra += letter
            #chequea si la palabra esta en el diccionario
            elif palabra in diccionario:
                diccionario[palabra] += 1 #si esta agrega al valor la aparicion
                palabra = ''
            else:
                diccionario[palabra] = 1 #si no esta lo agrega
                palabra = ''
    #chequea cual es la palabra mas frecuente
    valuemasFrecuente = 0
    claves = list(diccionario.keys())
    valores = list(diccionario.values())
    for valor in valores:
        if valor > valuemasFrecuente:
            valuemasFrecuente = valor
    for clave in claves:
        if diccionario[clave] == valuemasFrecuente:
            return clave
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
def divideATodos(s: list, e:int) -> bool:
    for i in s:
        if i % e != 0:
            return False
    return True
#1.3
def sumaTotal(s: list) -> int:
    suma = 0
    for i in s:
        suma += i
    return suma
#1.4
def ordenados(s: list) -> bool:
    elemanterior: int = s[0]
    s = s[1::]
    for i in s:
        if elemanterior > i:
            return False
        else:
            elemanterior = i
    return True
#1.5
def palabraMayorA7(l: list) -> bool:
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
def ceroEnPosParInOut(l: list) -> list:
    for i in range(len(l)):
        if i % 2 == 0:
            l[i] = 0
    return l

#2.2
def ceroEnPosParIn(l:list)-> list:
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
def listaEstudiantes(): #-> list[str]
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
def sube():#> int:
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


        


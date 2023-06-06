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


idem("/home/clinux01/Escritorio/willow.txt", "DALE TAYLOR")
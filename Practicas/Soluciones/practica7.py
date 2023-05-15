import math 
#Ejercicio 1
def raizDe2(x: int) -> int:
    return round(math.sqrt(x), 4)

#1.2
def imprimir_hola(): # no es necesario poner el -> str ya que esto es un procedimento, no una funcion
    print("hola")


#Ejercicio 2
#2.4
def es_multiplo_de (n:int, m:int) -> bool:
    if n % m == 0:
        return True
    else:
        return False
    #return n % m == 0 es valido tambien
#Ejercicio 3
def es_nombre_largo (nombre: str) -> bool:
    return len(nombre) >=3 and len(nombre) <=8 
#como len(nombre) >=3 and len(nombre) devuelve un valor booleano, directamente returneamos ese valor de verdad

#Ejercicio 5
#5.1
def devolver_el_doble_si_es_par(numero: int) -> int:
    if numero % 2 == 0:
        return 2*numero
    else:
        return numero
#Ejercicio 6
#6.2
def num_par_entre_20_y_40_while():
    x = 10
    while x <= 40:
        print(x)
        x += 2
        
def num_par_entre_20_y_40_for():
    for i in range(10,41,2):
        print(i)

import math 
#Ejercicio 1
def raizDe2(x: int) -> int:
    return round(math.sqrt(x), 4)

#1.2
def imprimir_hola(): # no es necesario poner el -> str ya que esto es un procedimento, no una funcion
    print("hola")
#1.3
#1.4
def factorial_de_2():
    print(2)
#1.5
def factorial_de_3():
    print(6)
#1.6
def factorial_de_4():
    print(24)
#1.7
def factorial_de_5():
    print(120)

#Ejercicio 2
#2.1
def imprimir_saludo(nombre: str):
    print("Hola", nombre)

#2.2
def raiz_cuadrada_de(n: float) -> float:
    return math.sqrt(n)

#2.3
def imprimir_dos_veces(estribillo: str):
    print(estribillo, estribillo) # al utilizar * aparece este error: TypeError: can't multiply sequence by non-int of type 'str' 

#2.4
def es_multiplo_de (n:int, m:int) -> bool:
    if n % m == 0:
        return True
    else:
        return False
    #return n % m == 0 es valido tambien
#2.5
def es_par(n: int) -> bool:
    return es_multiplo_de(n, 2)

#2.6
def cantidad_de_porciones(comensales: int, min_cant_de_por: int) -> int:
    return round((comensales*min_cant_de_por)/8)

#Ejercicio 3
#3.1
def alguno_es_0(n: int, m:int) -> bool:
    return n==0 or m==0
#3.2
def ambos_son_0(n:int, m:int) -> bool:
    return n==0 and m==0

#3.3
def es_nombre_largo (nombre: str) -> bool:
    return len(nombre) >=3 and len(nombre) <=8 
#como len(nombre) >=3 and len(nombre) devuelve un valor booleano, directamente returneamos ese valor de verdad
#3.4
def es_bisiesto(a:int) -> bool:
    return a % 4 == 0 and (not a % 100 ==0)

#Ejercicio 4
def peso_pino(a: int) -> int:
    x = a
    peso = 0
    while x != 0:
        if x > 3 :
            peso += 200
            x = x-1
        elif x<=3:
            peso += 300
            x = x-1
    return peso

def es_peso_util(p: int) -> bool:
    return p > 400 and p < 1000

def sirve_pino(a:int) -> bool:
    p = peso_pino(a)
    return es_peso_util(p)

#Ejercicio 5
#5.1
def devolver_el_doble_si_es_par(numero: int) -> int:
    if numero % 2 == 0:
        return 2*numero
    else:
        return numero
#5.2
def devolver_el_valor_si_es_par_sino_el_que_sigue(n:int) -> int:
    if n % 2 == 0:
        return n 
    else:
        return n+1

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

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
#5.4
def devolver_el_doble_si_es_muliplo3_el_triple_si_es_multiplo9(n: int) -> int:
    if n % 9 == 0:
        return 3*n
    elif n % 3 == 0:
        return 2*n
    else:
        return n 
#5.5
def es_nombre_largo(nombre: str):
    if len(nombre) >= 5:
        print("Tu nombre tiene muchas letras!")
    else:
        print("Tu nombre tiene menos de 5 letras")

# 5.6
def vacaciones_o_laburo(e:int, s:str) -> str:
    if e < 18 or (e >=60 and s == "F") or (e>=65 and s =="M"):
        return "Andá de vacaciones"
    else:
        return "Te toca trabajar"

#Ejercicio 6
#6.1
def num_del_1_al_10():
    x = 1
    while x != 11:
        print(x)
        x+=1

#6.2
def num_par_entre_20_y_40_while():
    x = 10
    while x <= 40:
        print(x)
        x += 2

#6.3
def eco_eco():
    x = 0
    while x != 10:
        print("eco")
        x += 1

#6.4
def cuenta_regresiva(n: int):
    while n !=0:
        print(n)
        n = n-1
    print("Despegue")

#6.5
def viaje_en_el_tiempo(partida: int, llegada: int):
    while partida != llegada:
        partida = partida - 1
        print("Viajó un year al pasado, estamos en el year:", partida)
#6.6
def viaje_en_el_tiempo_V2(partida:int, llegada:int):
    #se requiere que el year de partida sea lo mas cercano a 384 a.c y que la llegada sea mas chico que 384 ac
    while partida < llegada:
        partida = partida + 20
        print("Viajó 20 year al pasado, estamos en el year:", partida, "ac")

#Ejercicio 7
#7.1
def num_del_1_al_10_for():
    for i in range (1,11,1):
        print(i)

#7.2
def num_par_entre_10_y_40_for():
    for i in range(10,41,2):
        print(i)
#7.3
def eco_eco_for():
    for i in range(10):
        print("eco")

#7.4
def cuenta_regresiva_for(n: int):
    for i in range(n,0,-1):
        print(i)
    print("Despegue")

#7.5
def viaje_en_el_tiempo_for(partida: int, llegada: int):
    for i in range(partida, llegada - 1 , -1):
        print("Viajó un year al pasado, estamos en el year:", i)

#7.6
def viaje_en_el_tiempo_V2_for(partida:int, llegada:int):
    #mismos requiere del otro ejercicio
    for i in range(partida, llegada, 20):
        print("Viajó 20 year al pasado, estamos en el year:", i, "ac")

#Ejercicio 8
"""
1) x@a == 5 ; y@a == 7
2) x@a == 5 ; y@a == 7 ; z = x@a + y@a
3) x@a == 5 : x@b == "hola"
4) x@a == True ; y@a == False; res = x@a && y@a
5) x@a == False ;  res = not(x@a)

"""
#Ejercicio 9
#9.1 y 9.2
""" 
el resultado será 4, ya que esta funcion modifica la variable global g a medida que la vayamos llamando:
asi: 
ro(1) -> 2 (g vale 0)
ro(1) -> 3 (g vale 1)
ro(1) -> 4 (g vale 2)

por otro lado, en el caso de la funcion rt, al evaluarla con rt(1,0) va a devolver 2 siempre, ya que la variable g es una variable local:
asi:
rt(1) -> 2 (g vale 0)
rt(1) -> 2 (g vale 0)
rt(1) -> 2 (g vale 0)
"""
#9.3
def rt(x:int, g:int) -> int:
    #estado a
    g = g+1 # estado b, vale g = g@a + 1
    return x + g # vale x@a + g@b

g : int = 0 # estado a 
def ro(x:int) -> int: # estado b 
    global g
    g = g + 1 # estado c,  vale g == g@a + 1
    return x + g # vale x@b + g@c
#9.4
"""
problema rt(in x: Z, in g: Z): Z{
    requiere{True}
    asegura{res = x + (g+1)}
}

problema ro(in x: Z): Z{
    requiere{True}
    asegura{ res = x + (g@a + 1)}
}
"""
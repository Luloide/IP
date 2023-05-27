def fibonacciNoRecursivo(n : int) -> int:
    nActual: int = 1
    sumaActual = 1 #se inicia con fib(1)
    sumaAnterior = 0 #se inicia con fib(0)
    suma = 0
    if n == 0:
        return 0
    elif n == 1:
        return 1 
    else:
        while nActual != n:
            suma = sumaActual + sumaAnterior
            sumaAnterior = sumaActual
            sumaActual = suma
            nActual += 1
    return suma


def filasParecidas(matriz: list[list[int]]) -> bool : #es con List tho
    for fila in range(len(matriz[1:])):
        n = matriz[fila + 1 ][0] - matriz[0][0]
        for columna in range(len(matriz[fila])):
            n = matriz[1][columna] - matriz[0][columna]
            if matriz[fila + 1][columna] - matriz[fila][columna] != n:
                return False
            #caso en el cual los elementos son 0 y el n es 0
            elif matriz[fila + 1][columna] == matriz[fila][columna] == n == 0:
                return False
    return True

m = [[-1, 0, 1], [-2, -1, 0], [-3, -2, -1]]

print(filasParecidas(m))
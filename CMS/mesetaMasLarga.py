def mesetaMasLarga(l: list[int]) -> int :
    #casos en en el cual la longitud de la lista sea 0 o 1
    if len(l) == 0:
        return 0
    if len(l) == 1:
        return 1
    listaDeMesetas = []
    #crea una lista con las posibles mesetas
    startIndex = 0
    for i in range(len(l[:-1:])):
        if l[i] != l[i+1]:
            listaDeMesetas.append(l[startIndex:i+1])
            startIndex = i + 1
    listaDeMesetas.append(l[startIndex:])
    #de todas las mesetas halladas, se fija cual es la mas rande
    mesetaMasGrande = len(listaDeMesetas[0])
    for meseta in listaDeMesetas:
       if len(meseta) > mesetaMasGrande:
           mesetaMasGrande = len(meseta)
    return mesetaMasGrande


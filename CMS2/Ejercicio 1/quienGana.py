def quienGana(j1: str, j2: str) -> str:
    #piedra gana a tijera
    if j1 == "Piedra" and j2 == "Tijera":
            return "Jugador1"
    elif j1 == "Tijera" and j2 == "Piedra":
            return "Jugador2"
    #tijera gana a papel
    elif j1== "Tijera" and j2 == "Papel":
           return "Jugador1"
    elif j2== "Tijera" and j1 == "Papel":
           return "Jugador2"
    #papel gana a piedra
    elif j1== "Papel" and j2 == "Piedra":
           return "Jugador1"
    elif j2== "Papel" and j1 == "Piedra":
           return "Jugador2"
    #caso empate
    else:
           return "Empate"
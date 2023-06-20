from queue import Queue

# El tipo de fila debería ser Queue[int], pero la versión de python del CMS no lo soporta. Usaremos en su lugar simplemente "Queue"
def avanzarFila(fila: Queue, min: int):
  minutos_pasados = 0
  proximoNumero = fila.qsize() + 1
  #tiempo pasado en cada caja
  minutosEnCaja1 = 0
  minutosEnCaja2 = 0
  minutosEnCaja3 = 0
  # estan vacias las cajas?
  caja1Vacia = True
  caja2Vacia = True
  caja3Vacia = True
  #Funcionamiento Banco
  while minutos_pasados <= min :
    size = fila.qsize()
    # llega nuevo cliente al banco
    if minutos_pasados % 4 == 0:
      fila.put(proximoNumero)
      proximoNumero += 1
    if fila.empty() != True:
      #caja 1
      if minutos_pasados == 1 or (minutosEnCaja1 % 10 == 0  and minutosEnCaja1 > 0):
        fila.get()
        minutosEnCaja1 = 0
        caja1Vacia = False
      #caja 3
      elif minutos_pasados == 2 or (minutosEnCaja3 % 4 == 0 and minutosEnCaja3 > 0):
        personaCaja3 = fila.get()
        minutosEnCaja3 = 0
        caja3Vacia = False
      #caja 2
      elif minutos_pasados == 3 or (minutosEnCaja2 % 4 == 0 and minutosEnCaja2 > 0):
        fila.get()
        minutosEnCaja2 = 0
        caja2Vacia = False
      # si pasaron 3 mins en caja 3 que vuelva a la fila la persona que esta en esa caja
      if minutosEnCaja3 == 3:
        fila.put(personaCaja3)
    #actualizando minutos 
    if caja1Vacia  != True:
      minutosEnCaja1 += 1
    if caja2Vacia != True:
      minutosEnCaja2 += 1
    if caja3Vacia != True:
      minutosEnCaja3 += 1
    minutos_pasados += 1
  
  return fila



# Caja1: Empieza a atender 10:01, y atiende a una persona cada 10 minutos
# Caja2: Empieza a atender 10:03, atiende a una persona cada 4 minutos
# Caja3: Empieza a atender 10:02, y atiende una persona cada 4 minutos, pero no le resuelve el problema y la persona debe volver a la fila (se va al final y tarda 3 min en llegar. Es decir, la persona que fue atendida 10:02 vuelve a entrar a la fila a las 10:05)
# La fila empieza con las n personas que llegaron antes de que abra el banco. Cuando abre (a las 10), cada 4 minutos llega una nueva persona a la fila (la primera entra a las 10:00)

filaInicial = Queue()
filaInicial.put(1)
filaInicial.put(2)
filaInicial.put(3)

res = avanzarFila(filaInicial,5)
print(res.qsize())


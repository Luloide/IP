from queue import Queue
from typing import List
from typing import Dict
from typing import Union
import json

# ACLARACIÓN: El tipo de "pedidos" debería ser: pedidos: Queue[Dict[str, Union[int, str, Dict[str, int]]]]
# Por no ser soportado por la versión de CMS, usamos simplemente "pedidos: Queue"
def procesamiento_pedidos(pedidos: Queue,
                          stock_productos: Dict[str, int],
                          precios_productos: Dict[str, float]) -> List[Dict[str, Union[int, str, float, Dict[str, int]]]]:
  res = []
  while pedidos.empty() == False:
    pedidoProsesandose = pedidos.get()
    productosProsesados = {}
    productos = pedidoProsesandose["productos"]
    precio_total = 0
    estado = 'completo'
    id_cliente = pedidoProsesandose["id"]
    nombre_cliente = pedidoProsesandose["cliente"]
    for producto, cantidad in productos.items():
      #chequea si la cantidad pedida no sobrepasa el stock del producto
      if producto in stock_productos and cantidad <= stock_productos[producto]:
        precio_total += cantidad * precios_productos[producto]
        stock_productos[producto] -= cantidad
        productosProsesados[producto] = cantidad
      else:
        # caso en el cual el stock no cubre la cantidad deseada
        estado = 'incompleto'
        precio_total += precios_productos.get(producto, 0) * stock_productos.get(producto, 0)
        productosProsesados[producto] = stock_productos.get(producto, 0)
        stock_productos[producto] = 0
    
    pedidoTerminado = {'id': id_cliente,'cliente': nombre_cliente,'productos': productosProsesados,'precio_total': precio_total,'estado': estado}
    res.append(pedidoTerminado)
  return res

# Ejemplo input  
pedidoslista = [{"id":21,"cliente":"Gabriela", "productos":{"Manzana":2}}, {'id': 1,'cliente': 'Juan','productos': {'Manzana': 2, 'Pan': 4, 'Factura': 6}
}]
stock_productos = {"Manzana":10, "Leche":5, "Pan":3, "Factura":0}
precios_productos = {"Manzana":3.5, "Leche":5.5, "Pan":3.5, "Factura":2.75}
pedidos = Queue()
pedidosEmpty = Queue()
for elem in pedidoslista:
  pedidos.put(elem)
print(procesamiento_pedidos(pedidos, stock_productos, precios_productos))
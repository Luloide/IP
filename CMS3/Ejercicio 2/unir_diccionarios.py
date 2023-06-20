from typing import List
from typing import Dict
import json

def unir_diccionarios(a_unir: List[Dict[str,str]]) -> Dict[str,List[str]]:
  nuevoDict = {}
  nuevasClaves = nuevoDict.keys()
  for dict in a_unir:
    claves = dict.keys()
    for clave in claves:
      if clave not in nuevasClaves:
        nuevoDict[clave] = [dict[clave]]
      else:
        nuevoDict[clave] = nuevoDict[clave] + [dict[clave]]
  return nuevoDict




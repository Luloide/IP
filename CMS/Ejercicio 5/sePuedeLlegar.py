from typing import List
from typing import Tuple

# Aclaración: Debido a la versión de Python del CMS, para el tipo Lista y Tupla, la sintaxis de la definición de tipos que deben usar es la siguiente:
# l: List[int]  <--Este es un ejemplo para una lista de enteros.
# t: Tuple[str,str]  <--Este es un ejemplo para una tupla de strings.
# Respetar esta sintaxis, ya que el CMS dirá que no pasó ningún test si usan otra notación.
def sePuedeLlegar(origen: str, destino: str, vuelos: List[Tuple[str, str]]) -> int :
  recorrido = []
  # esta funcion busca el vuelo de una ciudad a otra
  def buscarVuelo(ciudad: str, vuelos: List[Tuple[str, str]]):
    for vuelo in vuelos:
        if ciudad == vuelo[0]:
          return vuelo
    return ("no hay", "no hay") # si no llega a salir un vuelo desde esa ciudad devuelve esto
  i = origen 
  vuelo = buscarVuelo(i, vuelos)
  while vuelo != ("no hay", "no hay"):
     #se fija si se llego al destino
     if vuelo[1] == destino:
        recorrido.append(vuelo)
        return len(recorrido)
     else:
        recorrido.append(vuelo)
        i = vuelo[1]
        vuelo = buscarVuelo(i, vuelos)
  #si no llego a destino, no hay ruta desde el origen al destino
  return -1

#Pruebas Mias
origen = "A"
destino = "B"
noVuelos = []
vuelos6 = [('A', 'D'), ('D', 'B'), ('B', 'H')]
vuelos5 = [('H','J'),('A', 'C'), ('C', 'D'), ('D', "B")]
vuelos4 = [('A', 'D'), ("D", 'C'), ("B",'H')]
vuelos3 = [("A",'B')]
vuelos2 = [("A", "B"), ("B", "C"), ("C", "E")]
vuelos1 =  [("A", "C"), ("C", "D"), ("D", "E"), ("E", "F"), ("F", "G"), ("G", "H"), ("H", "I"), ("I", "J"),
("J", "K"), ("K", "L"), ("L", "M"), ("M", "N"), ("N", "O"), ("O", "P"), ("P", "Q"), ("Q", "R"),
("R", "S"), ("S", "T"), ("T", "U"), ("U", "V"), ("V", "W"), ("W", "X"), ("X", "Y"), ("Y", "Z"),
("Z", "AA"), ("AA", "AB"), ("AB", "AC"), ("AC", "AD"), ("AD", "AE"), ("AE", "AF"), ("AF", "AG"),
("AG", "AH"), ("AH", "AI"), ("AI", "AJ"), ("AJ", "AK"), ("AK", "AL"), ("AL", "AM"), ("AM", "AN"),
("AN", "AO"), ("AO", "AP"), ("AP", "AQ"), ("AQ", "AR"), ("AR", "AS"), ("AS", "AT"), ("AT", "AU"),
("AU", "AV"), ("AV", "AW"), ("AW", "AX"), ("AX", "AY"), ("AY", "AZ"), ("AZ", "BA"), ("BA", "BB"),
("BB", "BC"), ("BC", "BD"), ("BD", "BE"), ("BE", "BF"), ("BF", "BG"), ("BG", "BH"), ("BH", "BI"),
("BI", "BJ"), ("BJ", "BK"), ("BK", "BL"), ("BL", "BM"), ("BM", "BN"), ("BN", "BO"), ("BO", "BP"),
("BP", "BQ"), ("BQ", "BR"), ("BR", "BS"), ("BS", "BT"), ("BT", "BU"), ("BU", "BV"), ("BV", "BW"),
("BW", "BX"), ("BX", "BY"), ("BY", "BZ"), ("BZ", "ADAC"), ("ADAC", "CA"), ("CA", "CB"), ("CB", "CC"),
("CC", "CD"), ("CD", "CE"), ("CE", "CF"), ("CF", "CG"), ("CG", "CH"), ("CH", "CI"), ("CI", "CJ"),
("CJ", "CK"), ("CK", "CL"), ("CL", "CM"), ("CM", "CN"), ("CN", "CO"), ("CO", "CP"), ("CP", "CQ"),
("CQ", "CR"), ("CR", "CS"), ("CS", "CT"), ("CT", "CU"), ("CU", "CV"), ("CV", "CW"), ("CW", "CX"),
("CX", "CY"), ("CY", "CZ"), ("CZ", "DA"), ("DA", "DB"), ("DB", "DC"), ("DC", "DD"), ("DD", "DE"),
("DE", "DF"), ("DF", "DG"), ("DG", "DH"), ("DH", "DI"), ("DI", "DJ"), ("DJ", "DK"), ("DK", "DL"),
("DL", "DM"), ("DM", "DN"), ("DN", "DO"), ("DO", "DP"), ("DP", "DQ"), ("DQ", "DR"), ("DR", "DS"),
("DS", "DT"), ("DT", "DU"), ("DU", "DV"), ("DV", "DW"), ("DW", "DX"), ("DX", "DY"), ("DY", "DZ"),
("DZ", "EA"), ("EA", "EB"), ("EB", "EC"), ("EC", "ED"), ("ED", "EE"), ("EE", "EF"), ("EF", "EG"),
("EG", "EH"), ("EH", "EI"), ("EI", "EJ"), ("EJ", "EK"), ("EK", "EL"), ("EL", "EM"), ("EM", "EN"),
("EN", "EO"), ("EO", "EP"), ("EP", "EQ"), ("EQ", "ER"), ("ER", "ES"), ("ES", "ET"), ("ET", "EU"),
("EU", "EV"), ("EV", "EW"), ("EW", "EX"), ("EX", "EY"), ("EY", "EZ"), ("EZ", "FA"), ("FA", "FB"),
("FB", "FC"), ("FC", "FD"), ("FD", "FE"), ("FE", "FF"), ("FF", "FG"), ("FG", "FH"), ("FH", "FI"),
("FI", "FJ"), ("FJ", "FK"), ("FK", "FL"), ("FL", "FM"), ("FM", "FN"), ("FN", "FO"), ("FO", "FP"),
("FP", "FQ"), ("FQ", "FR"), ("FR", "FS"), ("FS", "FT"), ("FT", "FU"), ("FU", "FV"), ("FV", "FW"),
("FW", "FX"), ("FX", "FY"), ("FY", "FZ"), ("FZ", "GA"), ("GA", "GB"), ("GB", "GC"), ("GC", "GD"),
("GD", "GE"), ("GE", "GF"), ("GF", "GG"), ("GG", "GH"), ("GH", "GI"), ("GI", "GJ"), ("GJ", "GK"),
("GK", "GL"), ("GL", "GM"), ("GM", "GN"), ("GN", "GO"), ("GO", "GP"), ("GP", "GQ"), ("GQ", "GR"),
("GR", "GS"), ("GS", "GT"), ("GT", "GU"), ("GU", "GV"), ("GV", "GW"), ("GW", "GX"), ("GX", "GY"),
("GY", "GZ"), ("GZ", "HA"), ("HA", "HB"), ("HB", "HC"), ("HC", "HD"), ("HD", "HE"), ("HE", "HF"),
("HF", "HG"), ("HG", "HH"), ("HH", "HI"), ("HI", "HJ"), ("HJ", "HK"), ("HK", "HL"), ("HL", "HM"),
("HM", "HN"), ("HN", "HO"), ("HO", "HP"), ("HP", "HQ"), ("HQ", "HR"), ("HR", "HS"), ("HS", "HT"),
("HT", "HU"), ("HU", "HV"), ("HV", "HW"), ("HW", "HX"), ("HX", "HY"), ("HY", "HZ"), ("HZ", "IA"),
("IA", "IB"), ("IB", "IC"), ("IC", "ID"), ("ID", "IE"), ("IE", "IF"), ("IF", "IG"), ("IG", "IH"),
("IH", "II"), ("II", "IJ"), ("IJ", "IK"), ("IK", "IL"), ("IL", "IM"), ("IM", "IN"), ("IN", "IO"),
("IO", "IP"), ("IP", "IQ"), ("IQ", "IR"), ("IR", "IS"), ("IS", "IT"), ("IT", "IU"), ("IU", "IV"),
("IV", "IW"), ("IW", "IX"), ("IX", "IY"), ("IY", "IZ"), ("IZ", "JA"), ("JA", "JB"), ("JB", "JC"),
("JC", "JD"), ("JD", "JE"), ("JE", "JF"), ("JF", "JG"), ("JG", "JH"), ("JH", "JI"), ("JI", "JJ"),
("JJ", "JK"), ("JK", "JL"), ("JL", "JM"), ("JM", "JN"), ("JN", "JO"), ("JO", "JP"), ("JP", "JQ"),
("JQ", "JR"), ("JR", "JS"), ("JS", "JT"), ("JT", "JU"), ("JU", "JV"), ("JV", "JW"), ("JW", "JX"),
("JX", "JY"), ("JY", "JZ"), ("JZ", "KA"), ("KA", "KB"), ("KB", "KC"), ("KC", "KD"), ("KD", "KE"),
("KE", "KF"), ("KF", "KG"), ("KG", "KH"), ("KH", "KI"), ("KI", "KJ"), ("KJ", "KK"), ("KK", "KL"),
("KL", "KM"), ("KM", "KN"), ("KN", "KO"), ("KO", "KP"), ("KP", "KQ"), ("KQ", "KR"), ("KR", "KS"),
("KS", "KT"), ("KT", "KU"), ("KU", "KV"), ("KV", "KW"), ("KW", "KX"), ("KX", "KY"), ("KY", "KZ"),
("KZ", "LA"), ("LA", "LB"), ("LB", "LC"), ("LC", "LD"), ("LD", "LE"), ("LE", "LF"), ("LF", "LG"),
("LG", "LH"), ("LH", "LI"), ("LI", "LJ"), ("LJ", "LK"), ("LK", "LL"), ("LL", "LM"), ("LM", "LN"),
("LN", "LO"), ("LO", "LP"), ("LP", "LQ"), ("LQ", "LR"), ("LR", "LS"), ("LS", "LT"), ("LT", "LU"),
("LU", "LV"), ("LV", "LW"), ("LW", "LX"), ("LX", "LY"), ("LY", "LZ"), ("LZ", "MA"), ("MA", "MB"),
("MB", "MC"), ("MC", "MD"), ("MD", "ME"), ("ME", "MF"), ("MF", "MG"), ("MG", "MH"), ("MH", "MI"),
("MI", "MJ"), ("MJ", "MK"), ("MK", "ML"), ("ML", "MM"), ("MM", "MN"), ("MN", "MO"), ("MO", "MP"),
("MP", "MQ"), ("MQ", "MR"), ("MR", "MS"), ("MS", "MT"), ("MT", "MU"), ("MU", "MV"), ("MV", "MW"),
("MW", "MX"), ("MX", "MY"), ("MY", "MZ"), ("MZ", "NA"), ("NA", "NB"), ("NB", "NC"), ("NC", "ND"),
("ND", "NE"), ("NE", "NF"), ("NF", "NG"), ("NG", "NH"), ("NH", "NI"), ("NI", "NJ"), ("NJ", "NK"),
("NK", "NL"), ("NL", "NM"), ("NM", "NN"), ("NN", "NO"), ("NO", "NP"), ("NP", "NQ"), ("NQ", "NR"),
("NR", "NS"), ("NS", "NT"), ("NT", "NU"), ("NU", "NV"), ("NV", "NW"), ("NW", "NX"), ("NX", "NY"),
("NY", "NZ"), ("NZ", "OA"), ("OA", "OB"), ("OB", "OC"), ("OC", "OD"), ("OD", "OE"), ("OE", "OF"),
("OF", "OG"), ("OG", "OH"), ("OH", "OI"), ("OI", "OJ"), ("OJ", "OK"), ("OK", "OL"), ("OL", "OM"),
("OM", "ON"), ("ON", "OO"), ("OO", "OP"), ("OP", "OQ"), ("OQ", "OR"), ("OR", "OS"), ("OS", "OT"),
("OT", "OU"), ("OU", "OV"), ("OV", "OW"), ("OW", "OX"), ("OX", "OY"), ("OY", "OZ"), ("OZ", "PA"),
("PA", "PB"), ("PB", "PC"), ("PC", "PD"), ("PD", "PE"), ("PE", "PF"), ("PF", "PG"), ("PG", "PH"),
("PH", "PI"), ("PI", "PJ"), ("PJ", "PK"), ("PK", "PL"), ("PL", "PM"), ("PM", "PN"), ("PN", "PO"),
("PO", "PP"), ("PP", "PQ"), ("PQ", "PR"), ("PR", "PS"), ("PS", "PT"), ("PT", "PU"), ("PU", "PV"),
("PV", "PW"), ("PW", "PX"), ("PX", "PY"), ("PY", "PZ"), ("PZ", "QA"), ("QA", "QB"), ("QB", "QC"),
("QC", "QD"), ("QD", "QE"), ("QE", "QF"), ("QF", "QG"), ("QG", "QH"), ("QH", "QI"), ("QI", "QJ"),
("QJ", "QK"), ("QK", "QL"), ("QL", "QM"), ("QM", "QN"), ("QN", "QO"), ("QO", "QP"), ("QP", "QQ"),
("QQ", "QR"), ("QR", "QS"), ("QS", "QT"), ("QT", "QU"), ("QU", "QV"), ("QV", "QW"), ("QW", "QX"),
("QX", "QY"), ("QY", "QZ"), ("QZ", "RA"), ("RA", "RB"), ("RB", "RC"), ("RC", "RD"), ("RD", "RE"),
("RE", "RF"), ("RF", "RG"), ("RG", "RH"), ("RH", "RI"), ("RI", "RJ"), ("RJ", "RK"), ("RK", "RL"),
("RL", "RM"), ("RM", "RN"), ("RN", "RO"), ("RO", "RP"), ("RP", "RQ"), ("RQ", "RR"), ("RR", "RS"),
("RS", "RT"), ("RT", "RU"), ("RU", "RV"), ("RV", "RW"), ("RW", "RX"), ("RX", "RY"), ("RY", "RZ"),
("RZ", "SA"), ("SA", "SB"), ("SB", "SC"), ("SC", "SD"), ("SD", "SE"), ("SE", "SF"), ("SF", "SG"),
("SG", "SH"), ("SH", "SI"), ("SI", "SJ"), ("SJ", "SK"), ("SK", "SL"), ("SL", "SM"), ("SM", "SN"),
("SN", "SO"), ("SO", "SP"), ("SP", "SQ"), ("SQ", "SR"), ("SR", "SS"), ("SS", "ST"), ("ST", "SU"),
("SU", "SV"), ("SV", "SW"), ("SW", "SX"), ("SX", "SY"), ("SY", "SZ"), ("SZ", "TA"), ("TA", "TB"),
("TB", "TC"), ("TC", "TD"), ("TD", "TE"), ("TE", "TF"), ("TF", "TG"), ("TG", "TH"), ("TH", "TI"),
("TI", "TJ"), ("TJ", "TK"), ("TK", "TL"), ("TL", "TM"), ("TM", "TN"), ("TN", "TO"), ("TO", "TP"),
("TP", "TQ"), ("TQ", "TR"), ("TR", "TS"), ("TS", "TT"), ("TT", "TU"), ("TU", "TV"), ("TV", "TW"),
("TW", "TX"), ("TX", "TY"), ("TY", "TZ"), ("TZ", "UA"), ("UA", "UB"), ("UB", "UC"), ("UC", "UD"),
("UD", "UE"), ("UE", "UF"), ("UF", "UG"), ("UG", "UH"), ("UH", "UI"), ("UI", "UJ"), ("UJ", "UK"),
("UK", "UL"), ("UL", "UM"), ("UM", "UN"), ("UN", "UO"), ("UO", "UP"), ("UP", "UQ"), ("UQ", "UR"),
("UR", "US"), ("US", "UT"), ("UT", "UU"), ("UU", "UV"), ("UV", "UW"), ("UW", "UX"), ("UX", "UY"),
("UY", "UZ"), ("UZ", "VA"), ("VA", "VB"), ("VB", "VC"), ("VC", "VD"), ("VD", "VE"), ("VE", "VF"),
("VF", "VG"), ("VG", "VH"), ("VH", "VI"), ("VI", "VJ"), ("VJ", "VK"), ("VK", "VL"), ("VL", "VM"),
("VM", "VN"), ("VN", "VO"), ("VO", "VP"), ("VP", "VQ"), ("VQ", "VR"), ("VR", "VS"), ("VS", "VT"),
("VT", "VU"), ("VU", "VV"), ("VV", "VW"), ("VW", "VX"), ("VX", "VY"), ("VY", "VZ"), ("VZ", "WA"),
("WA", "WB"), ("WB", "WC"), ("WC", "WD"), ("WD", "WE"), ("WE", "WF"), ("WF", "WG"), ("WG", "WH"),
("WH", "WI"), ("WI", "WJ"), ("WJ", "WK"), ("WK", "WL"), ("WL", "WM"), ("WM", "WN"), ("WN", "WO"),
("WO", "WP"), ("WP", "WQ"), ("WQ", "WR"), ("WR", "WS"), ("WS", "WT"), ("WT", "WU"), ("WU", "WV"),
("WV", "WW"), ("WW", "WX"), ("WX", "WY"), ("WY", "WZ"), ("WZ", "XA"), ("XA", "XB"), ("XB", "XC"),
("XC", "XD"), ("XD", "XE"), ("XE", "XF"), ("XF", "XG"), ("XG", "XH"), ("XH", "XI"), ("XI", "XJ"),
("XJ", "XK"), ("XK", "XL"), ("XL", "XM"), ("XM", "XN"), ("XN", "XO"), ("XO", "XP"), ("XP", "XQ"),
("XQ", "XR"), ("XR", "XS"), ("XS", "XT"), ("XT", "XU"), ("XU", "XV"), ("XV", "XW"), ("XW", "XX"),
("XX", "XY"), ("XY", "XZ"), ("XZ", "YA"), ("YA", "YB"), ("YB", "YC"), ("YC", "YD"), ("YD", "YE"),
("YE", "YF"), ("YF", "YG"), ("YG", "YH"), ("YH", "YI"), ("YI", "YJ"), ("YJ", "YK"), ("YK", "YL"),
("YL", "YM"), ("YM", "YN"), ("YN", "YO"), ("YO", "YP"), ("YP", "YQ"), ("YQ", "YR"), ("YR", "YS"),
("YS", "YT"), ("YT", "YU"), ("YU", "YV"), ("YV", "YW"), ("YW", "YX"), ("YX", "YY"), ("YY", "YZ"),
("YZ", "ZA"), ("ZA", "ZB"), ("ZB", "ZC"), ("ZC", "ZD"), ("ZD", "ZE"), ("ZE", "ZF"), ("ZF", "ZG"),
("ZG", "ZH"), ("ZH", "ZI"), ("ZI", "ZJ"), ("ZJ", "ZK"), ("ZK", "ZL"), ("ZL", "ZM"), ("ZM", "ZN"),
("ZN", "ZO"), ("ZO", "ZP"), ("ZP", "ZQ"), ("ZQ", "ZR"), ("ZR", "ZS"), ("ZS", "ZT"), ("ZT", "ZU"),
("ZU", "ZV"), ("ZV", "ZW"), ("ZW", "ZX"), ("ZX", "ZY"), ("ZY", "ZZ"), ("ZZ", "AAA"), ("AAA", "AAB"),
("AAB", "AAC"), ("AAC", "AAD"), ("AAD", "AAE"), ("AAE", "AAF"), ("AAF", "AAG"), ("AAG", "AAH"),
("AAH", "AAI"), ("AAI", "AAJ"), ("AAJ", "AAK"), ("AAK", "AAL"), ("AAL", "AAM"), ("AAM", "AAN"),
("AAN", "AAO"), ("AAO", "AAP"), ("AAP", "AAQ"), ("AAQ", "AAR"), ("AAR","B")]
print(sePuedeLlegar(origen, destino, vuelos5))
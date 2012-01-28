# http://www.smd.hu/Data/Geyer/PDFs/Qurz/Model/Model-KX-12B%20%5B2008.07.15%5D.pdf
define(`m', `eval($1*1000000/254)')
define(`mm', `eval(m($1)/100)')

Element[0x00 "kx12-b" "Q1" "" 0 0 50 50 0x00 100 0x000]
(
  Pad[mm(-230) mm(-20) mm(-230) mm(20) mm(190)  mm(200) mm(200) "1" "1" 0x0100]
  Pad[mm(230)  mm(-20) mm(230)  mm(20) mm(190)  mm(200) mm(200) "2" "2" 0x0100]
)

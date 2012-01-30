# http://www.terraelectronica.ru/pdf/HI/UX60-MB-5.pdf
define(`m', `eval($1*1000000/254)')
define(`mm', `eval(m($1)/100)')

Element[0x00 "USB-B-UX60" "U1" "" 0 0 50 50 0x00 100 0x000]
(
  Pad[mm(-420) mm(-200) mm(-420) mm(-200) mm(220) mm(50) mm(240) "GND" "6" 0x0100]
  Pad[mm(420)  mm(-200) mm(420)  mm(-200) mm(220) mm(50) mm(240) "GND" "6" 0x0100]
  Pad[mm(-420) mm(330)  mm(-420) mm(330)  mm(220) mm(50) mm(240) "GND" "6" 0x0100]
  Pad[mm(420)  mm(330)  mm(420)  mm(330)  mm(220) mm(50) mm(240) "GND" "6" 0x0100]
  Pad[mm(-160) mm(-150) mm(-160) mm(-300) mm(50)  mm(50) mm(70) "VCHR" "5" 0x0100] 
  Pad[mm(-80)  mm(-150) mm(-80)  mm(-300) mm(50)  mm(50) mm(70) "RXD"  "4" 0x0100] 
  Pad[mm(0)    mm(-150) mm(0)    mm(-300) mm(50)  mm(50) mm(70) "TXD"  "3" 0x0100] 
  Pad[mm(80)   mm(-150) mm(80)   mm(-300) mm(50)  mm(50) mm(70) "Vout" "2" 0x0100] 
  Pad[mm(160)  mm(-150) mm(160)  mm(-300) mm(50)  mm(50) mm(70) "GND"  "1" 0x0100]

  Pin[mm(-175) mm(0) 0 mm(100) mm(100) mm(100) "" "" "hole"]
  Pin[mm(175)  mm(0) 0 mm(100) mm(100) mm(100) "" "" "hole"]
)

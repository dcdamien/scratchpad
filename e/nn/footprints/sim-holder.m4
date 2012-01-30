# http://lib.chipdip.ru/159/DOC000159529.pdf
define(`m', `eval($1*1000000/254)')
define(`mm', `eval(m($1)/100)')

Element[0x00 "sim-holder" "CONN1" "" 0 0 50 50 0x00 100 0x000]
(
  ElementLine[mm(-590) mm(-584) mm(980)  mm(-584) 500]
  ElementLine[mm(-590) mm(-584) mm(-590) mm(-550) 500]
  ElementLine[mm(-590) mm(900)  mm(-590) mm(950)  500]
  ElementLine[mm(-590) mm(956)  mm(980)  mm(956)  500]
  ElementLine[mm(980)  mm(-584) mm(980)  mm(956)  500]

  Pad[mm(540)  mm(-254) mm(290)  mm(-254) mm(100)  mm(100) mm(110) "Vcc" "1" 0x0100]
  Pad[mm(540)  mm(0)    mm(290)  mm(0)    mm(100)  mm(100) mm(110) "RST" "2" 0x0100]
  Pad[mm(540)  mm(254)  mm(290)  mm(254)  mm(100)  mm(100) mm(110) "CLK" "3" 0x0100]
  
  Pad[mm(-540) mm(-254) mm(-290) mm(-254) mm(100)  mm(100) mm(110) "GND" "4" 0x0100]
  Pad[mm(-540) mm(0)    mm(-290) mm(0)    mm(100)  mm(100) mm(110) "Vpp" "5" 0x0100]
  Pad[mm(-540) mm(254)  mm(-290) mm(254)  mm(100)  mm(100) mm(110) "IO"  "6" 0x0100]
)

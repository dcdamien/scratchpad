# http://lib.chipdip.ru/159/DOC000159529.pdf
define(`m', `eval($1*1000000/254)')
define(`mm', `eval(m($1)/100)')

Element[0x00 "sim-holder" "CONN1" "" 0 0 50 50 0x00 100 0x000]
(
  ElementLine[mm(-510) mm(-690) mm(1020) mm(-690) 500]
  ElementLine[mm(-510) mm(-690) mm(-510) mm(950)  500]
  ElementLine[mm(-510) mm(950)  mm(1020) mm(950)  500]

  Pad[mm(350)  mm(-160) mm(460)  mm(-160) mm(50)  mm(50) mm(70) "Vcc" "1" 0x0100]
  Pad[mm(350)  mm(0)    mm(460)  mm(0)    mm(50)  mm(50) mm(70) "RST" "2" 0x0100]
  Pad[mm(350)  mm(160)  mm(460)  mm(160)  mm(50)  mm(50) mm(70) "CLK" "3" 0x0100]
  
  Pad[mm(-350) mm(-160) mm(-460) mm(-160) mm(50)  mm(50) mm(70) "GND" "4" 0x0100]
  Pad[mm(-350) mm(0)    mm(-460) mm(0)    mm(50)  mm(50) mm(70) "Vpp" "5" 0x0100]
  Pad[mm(-350) mm(160)  mm(-460) mm(160)  mm(50)  mm(50) mm(70) "IO"  "6" 0x0100]
)

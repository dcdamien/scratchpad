define(`m', `eval($1*1000000/254)')
define(`mm', `eval(m($1)/100)')
define(`j', `mm(eval(-925+$1*150))')
define(`i', `mm(eval(-1295+$1))')
define(`l', `Pad[mm(-1295) j($1) mm(-1165) j($1) mm(50) 1500 3100 "$3" "$2" 0x00000100]')
define(`r', `Pad[mm(1165)  j($1) mm(1295)  j($1) mm(50) 1500 3100 "$3" "$2" 0x00000100]')
define(`b', `Pad[i($1) mm(865)  i($1) mm(995)  mm(50) 1500 3100 "$3" "$2" 0x00000100]')
define(`t', `Pad[i($1) mm(-995) i($1) mm(-865) mm(50) 1500 3100 "$3" "$2" 0x00000100]')

Element(0x00000 "SIM900 GSM modem" "U0" "" 10 10 -50 -50 0 100 0x00000)
(
	ElementLine[mm(-1295) mm(-995) mm(-1150) mm(-995) 500]
	ElementLine[mm(-1295) mm(-995) mm(-1295) mm(-850) 500]
	ElementLine[mm(-1295) mm(995)  mm(-1150) mm(995)  500]
	ElementLine[mm(-1295) mm(995)  mm(-1295) mm(850)  500]
	ElementLine[mm(1295)  mm(-995) mm(1200)  mm(-995) 500]
	ElementLine[mm(1295)  mm(-995) mm(1295)  mm(-850) 500]
	ElementLine[mm(1295)  mm(995)  mm(1200)  mm(995)  500]
	ElementLine[mm(1295)  mm(995)  mm(1295)  mm(850)  500]
  
  b(220,1,GND)
  b(370,2,GND)
  b(520,3,NC)
  b(670,4,GND)
  b(820,5,GND)
  b(970,6,GND)
  b(1120,7,NC)
  b(1370,8,3v15)
  b(1520,9,GND)
  b(1670,10,PC3)
  b(1820,11,PC2)
  b(1970,12,VBAT)
  b(2120,13,GND)
  b(2270,14,GND)
  b(2420,15,NC)
 
	r(11,16,NC)
  r(10,17,TxD1)
  r(9,18,RxD1)
  r(8,19,MAP1)
  r(7,20,MAP0)
  r(6,21,nPOR)
  r(5,22,NC)
  r(4,23,NC)
  r(3,24,PPS)
  r(2,25,PC0)
  r(1,26,GND)

  t(2420,27,NC)
  t(2120,28,GND)
  t(1970,29,GND)
  t(1820,30,PC5)
  t(1670,31,GND)
  t(1520,32,PC6)
  t(1370,33,1v8)
  t(1220,34,GND)
  t(970,35,GND)
  t(820,36,LNA_IN)
  t(670,37,NC)
  t(520,38,GND)
  t(370,39,GND)
  t(220,40,GND)

  l(1,41,GND)
  l(2,42,GND)
  l(3,43,AA)
  l(4,44,GND)
  l(5,45,GND)
  l(6,46,NC)
  l(7,47,GND)
  l(8,48,GND)
  l(9,49,NC)
  l(10,50,GND)
  l(11,51,GND)

)

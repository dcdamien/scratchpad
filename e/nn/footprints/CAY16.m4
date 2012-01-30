# http://www.bourns.com/pdfs/CATCAY.pdf
define(`m', `eval($1*1000000/254)')
define(`mm', `eval(m($1)/100)')

Element[0x00 "cay16-j4" "" "" 0 0 50 50 0x00 100 0x000]
(
  Pad[mm(-120) mm(-60) mm(-120) mm(-110) mm(40) mm(40) mm(120) "1" "1" 0x0100]
  Pad[mm(-40)  mm(-60) mm(-40)  mm(-110) mm(40) mm(40) mm(120) "3" "3" 0x0100]
  Pad[mm(40)   mm(-60) mm(40)   mm(-110) mm(40) mm(40) mm(120) "5" "5" 0x0100]
  Pad[mm(120)  mm(-60) mm(120)  mm(-110) mm(40) mm(40) mm(120) "7" "7" 0x0100]

  Pad[mm(-120) mm(60) mm(-120) mm(110) mm(40) mm(40) mm(120) "2" "2" 0x0100]
  Pad[mm(-40)  mm(60) mm(-40)  mm(110) mm(40) mm(40) mm(120) "4" "4" 0x0100]
  Pad[mm(40)   mm(60) mm(40)   mm(110) mm(40) mm(40) mm(120) "6" "6" 0x0100]
  Pad[mm(120)  mm(60) mm(120)  mm(110) mm(40) mm(40) mm(120) "8" "8" 0x0100]
)

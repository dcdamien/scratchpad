# http://www.bourns.com/pdfs/cay17.pdf
define(`m', `eval($1*1000000/254)')
define(`mm', `eval(m($1)/100)')

Element[0x00 "cay17-ja" "" "" 0 0 50 50 0x00 100 0x000]
(
  Pad[mm(-128) mm(-70) mm(-128) mm(-110) mm(34) mm(34) mm(140) "1" "1" 0x0100]
  Pad[mm(-64)  mm(-70) mm(-64)  mm(-110) mm(34) mm(34) mm(140) "2" "2" 0x0100]
  Pad[mm(0)    mm(-70) mm(0)    mm(-110) mm(34) mm(34) mm(140) "3" "3" 0x0100]
  Pad[mm(64)   mm(-70) mm(64)   mm(-110) mm(34) mm(34) mm(140) "4" "4" 0x0100]
  Pad[mm(128)  mm(-70) mm(128)  mm(-110) mm(34) mm(34) mm(140) "5" "5" 0x0100]

  Pad[mm(-128) mm(70) mm(-128) mm(110) mm(34) mm(34) mm(140) "10" "10" 0x0100]
  Pad[mm(-64)  mm(70) mm(-64)  mm(110) mm(34) mm(34) mm(140) "9" "9" 0x0100]
  Pad[mm(0)    mm(70) mm(0)    mm(110) mm(34) mm(34) mm(140) "8" "8" 0x0100]
  Pad[mm(64)   mm(70) mm(64)   mm(110) mm(34) mm(34) mm(140) "7" "7" 0x0100]
  Pad[mm(128)  mm(70) mm(128)  mm(110) mm(34) mm(34) mm(140) "6" "6" 0x0100]
)

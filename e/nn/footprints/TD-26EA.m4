# http://www.xiejia.net/UploadFiles%5C20087299145988459.pdf
define(`m', `eval($1*1000000/254)')
define(`mm', `eval(m($1)/100)')

Element[0x00 "USB-B-UX60" "" "" 0 0 50 50 0x00 100 0x000]
(
  Pad[mm(-300) mm(-85) mm(-260) mm(-85) mm(120)  mm(120) mm(120) "1"  "1" 0x0100]
  Pad[mm(-300) mm(85)  mm(-260) mm(85)  mm(120)  mm(120) mm(120) "1"  "1" 0x0100]
  Pad[mm(300)  mm(-85) mm(260)  mm(-85) mm(120)  mm(120) mm(120) "2"  "2" 0x0100]
  Pad[mm(300)  mm(85)  mm(260)  mm(85)  mm(120)  mm(120) mm(120) "2"  "2" 0x0100]
  
  Pin[0 mm(-135) 0 mm(100) mm(100) mm(100) "" "" "hole"]
  Pin[0 mm(135)  0 mm(100) mm(100) mm(100) "" "" "hole"]
)

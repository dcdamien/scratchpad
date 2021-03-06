define(`m', `eval($1*1000000/254)')
define(`mm', `eval(m($1)/10)')
define(`i', `m(eval(-9+$1))')
define(`l', `Pad[mm(-125) i($1) mm(-115) i($1) mm(6) 1500 3100 "$3" "$2" 0x00000100]')
define(`r', `Pad[mm(115) i($1) mm(125) i($1) mm(6) 1500 3100 "$3" "$2" 0x00000100]')
define(`b', `Pad[i($1) mm(115) i($1) mm(125) mm(6) 1500 3100 "$3" "$2" 0x00000100]')
define(`t', `Pad[i($1) mm(-125) i($1) mm(-115) mm(6) 1500 3100 "$3" "$2" 0x00000100]')

Element(0x00000 "SIM900 GSM modem" "U0" "" 10 10 -50 -50 0 100 0x00000)
(
	ElementLine[m(-12) m(-12) m(-9)  m(-12) 500]
	ElementLine[m(-12) m(-12) m(-12) m(-9)  500]
	ElementLine[m(-12) m(12)  m(-9)  m(12)  500]
	ElementLine[m(-12) m(12)  m(-12) m(9)   500]
	ElementLine[m(12)  m(-12) m(9)   m(-12) 500]
	ElementLine[m(12)  m(-12) m(12)  m(-9)  500]
	ElementLine[m(12)  m(12)  m(9)   m(12)  500]
	ElementLine[m(12)  m(12)  m(12)  m(9)   500]
	l(1,1,PWRKEY)
	l(2,2,PWRKEY_OUT)
	l(3,3,DTR)
	l(4,4,RI)
	l(5,5,DCD)
	l(6,6,DSR)
	l(7,7,CTS)
	l(8,8,RTS)
	l(9,9,TXD)
	l(10,10,RXD)
	l(11,11,DISP_CLK)
	l(12,12,DISP_DATA)
	l(13,13,DISP_D/C)
	l(14,14,DISP_CS)
	l(15,15,VDD_EXT)
	l(16,16,NRESET)
	l(17,17,GND)
	b(1,18,GND)
	b(2,19,MIC_P)
	b(3,20,MIC_N)
	b(4,21,SPK_P)
	b(5,22,SPK_N)
	b(6,23,LINEIN_R)
	b(7,24,LINEIN_L)
	b(8,25,ADC)
	b(9,26,VRTC)
	b(10,27,DBG_TXD)
	b(11,28,DBG_RXD)
	b(12,29,GND)
	b(13,30,SIM_VDD)
	b(14,31,SIM_DATA)
	b(15,32,SIM_CLK)
	b(16,33,SIM_RST)
	b(17,34,SIM_PRESENCE)
	r(1,51,GPIO10)
	r(2,50,GPIO9/KBC1)
	r(3,49,GPIO8/KBC2)
	r(4,48,GPIO7/KBC3)
	r(5,47,GPIO6/KBC4)
	r(6,46,GND)
	r(7,45,GND)
	r(8,44,GPIO5/KBR0)
	r(9,43,GPIO4/KBR1)
	r(10,42,GPIO3/KBR2)
	r(11,41,GPIO2/KBR3)
	r(12,40,GPIO1/KBR4)
	r(13,39,GND)
	r(14,38,SCL)
	r(15,37,SDA)
	r(16,36,PWM2)
	r(17,35,PWM1)
	t(1,68,GPIO12)
	t(2,67,GPIO11)
	t(3,66,STATUS)
	t(4,65,GND)
	t(5,64,GND)
	t(6,63,GND)
	t(7,62,GND)
	t(8,61,GND)
	t(9,60,RF_ANT)
	t(10,59,GND)
	t(11,58,GND)
	t(12,57,VBAT)
	t(13,56,VBAT)
	t(14,55,VBAT)
	t(15,54,GND)
	t(16,53,GND)
	t(17,52,NETLIGHT)
)

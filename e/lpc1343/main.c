
#define CFG_USBCDC
#define CFG_USBCDC_BAUDRATE (115200)

#include "lpc134x.h"
#include "core/cpu/cpu.h"
#include "core/systick/systick.h"
#include "core/gpio/gpio.h"
#include "core/pmu/pmu.h"

#include "core/usbcdc/usb.h"
#include "core/usbcdc/usbcore.h"
#include "core/usbcdc/usbhw.h"
#include "core/usbcdc/cdcuser.h"
#include "core/usbcdc/cdc_buf.h"

#include "sysdefs.h"


void init ()
{
	cpuInit ();
	systickInit (1);
	gpioInit ();
	pmuInit ();

	CDC_Init ();
	USB_Init ();
	USB_Connect (TRUE);

	gpioSetDir (3, 0, 1);
	gpioSetValue (3, 0, 1);
	while (!USB_Configuration) {
		systickDelay (10);
	}
	gpioSetValue (3, 0, 0); 
}


int main ()
{
	init ();

	gpioSetDir (3, 1, 1);
	gpioSetValue (3, 1, 1);

	int availBytes;
	char buf[32];
	uint8_t frame[64];
	for (int i = 0; i < 64; ++i) {
		frame[i] = i;
	} 
	while (1) {
		systickDelay (1);
		USB_WriteEP (CDC_DEP_IN, frame, 64);
		// CDC_WrOutBuf (text, &textLen);

		CDC_OutBufAvailChar (&availBytes);
		if (availBytes > 0) {
			int bytesToRead = availBytes > 32 ? 32 : availBytes;
			int bytesRead = CDC_RdOutBuf (buf, &bytesToRead);
			gpioSetValue (3, 1, 0);
		}
	}
}


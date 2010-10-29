

#include <linux/init.h>
#include <linux/module.h>
#include <linux/kernel.h>


MODULE_LICENSE("Dual BSD/GPL");

static int touch_init(void)
{
    printk("<1> Loading touch-com2usb module\n");
    return 0;
}

static void touch_exit(void)
{
    printk("<1> Unloading touch-com2usb module\n");
}


module_init(touch_init);
module_exit(touch_exit);

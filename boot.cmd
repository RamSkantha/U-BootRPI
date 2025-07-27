setenv stdin serial
setenv stdout serial
setenv stderr serial

setenv kernel_addr_r 0x08000000
setenv fdt_addr_r 0x0A000000
setenv bootargs "console=ttyS0,115200 root=/dev/mmcblk0p2 rootwait"
fatload mmc 0:1 ${kernel_addr_r} kernel8.img
fatload mmc 0:1 ${fdt_addr_r} bcm2711-rpi-4-b.dtb
booti ${kernel_addr_r} - ${fdt_addr_r}



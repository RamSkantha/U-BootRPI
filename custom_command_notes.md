### 🛠️ Adding a Custom Command in U-Boot (`hello` example)

This section documents how to register and integrate a **custom U-Boot command**, named `hello`.

---

### ✅ Goal

To create a command `hello` that prints: Hello, U-Boot World!


---

### 🧾 Step-by-Step Instructions

#### 1. Create the Command Source File

Create a new file:  
`cmd/hello.c`

Add the following code:

```c
#include <common.h>
#include <command.h>

static int do_hello(cmd_tbl_t *cmdtp, int flag, int argc, char * const argv[])
{
    printf("Hello, U-Boot World!\n");
    return 0;
}

U_BOOT_CMD(
    hello,        // Command name
    1,            // Max number of arguments
    1,            // Repeatable
    do_hello,     // Command function
    "Prints Hello message",    // Short help
    ""            // Long help (optional)
);


2. Register the Command in the Build System
Edit cmd/Makefile and add:

obj-$(CONFIG_CMD_HELLO) += hello.o



3. Enable the Command in Your Config
Edit your board’s defconfig file:
(u-boot/configs/rpi_arm64_defconfig) for Raspberry Pi 4 64 bit

CONFIG_CMD_HELLO=y


4. Build U-Boot

make distclean
make rpi_arm64_defconfig
make -j$(nproc) CROSS_COMPILE=aarch64-linux-gnu-


5. Test in U-Boot Shell
At the U-Boot prompt:

=> hello
Hello, U-Boot World!

![hello_cmd](screenshots/hello_cmd_output.png)


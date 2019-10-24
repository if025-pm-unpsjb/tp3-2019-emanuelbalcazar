ARMGNU ?= arm-none-eabi

all: blink.bin

blink.bin: blink.s flash.ld
	$(ARMGNU)-as  blink.s -g -o blink.o
	$(ARMGNU)-ld -o blink.elf blink.o -T flash.ld
	$(ARMGNU)-objdump -D blink.elf > blink.list
	$(ARMGNU)-objcopy blink.elf blink.bin -O binary

clean:
	rm -f *.bin
	rm -f *.o
	rm -f *.elf
	rm -f *.list

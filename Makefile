.PHONY:all clean
all:
	make -C lcd
	make -C usb
	make -C media
	make -C app
clean:
	cd lcd && make clean
	cd usb && make clean
	cd media && make clean
	cd app && make clean

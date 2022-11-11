#!/bin/bash
export ARCH=arm64
export SUBARCH=arm64
export CLANG_PATH=/bin/
export CC=clang
export CLANG_TRIPLE=aarch64-linux-gnu-
export CORSS_COMPILE=/bin/aarch64-linux-gnu-
export CROSS_COMPILE_ARM32=/bin/arm-linux-gnueabi-
echo "Do you want to clean ALL the config files and sources? [Y/n]"
read op
if [[ $op == "n" || $op == "N" ]]; then
	sudo rm -rf out
	sudo mkdir out
else
	sudo make clean
	sudo make mrproper
	sudo rm -rf out
	sudo mkdir out
fi
select config in "gts6lwifi_eur_open_defconfig" "custom"; do
	case $config in
		"gts6lwifi_eur_open_defconfig")
			sudo make CC=clang O=out ARCH=arm64 $config
			sudo make CC=clang O=out ARCH=arm64 menuconfig
			break;;
		"custom")
			sudo make CC=clang O=out ARCH=arm64 menuconfig
			break;;
	esac
done
sudo make CC=clang O=out ARCH=arm64

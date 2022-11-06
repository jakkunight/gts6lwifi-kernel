#!/bin/bash

export ARCH=arm64
mkdir out

#BUILD_CROSS_COMPILE=/bin/
#KERNEL_LLVM_BIN=/bin/
#CLANG_TRIPLE=aarch64-linux-gnu-
#KERNEL_MAKE_ENV="DTC_EXT=$(pwd)/tools/dtc CONFIG_BUILD_ARM64_DT_OVERLAY=y"

#make -j8 -C $(pwd) O=$(pwd)/out $KERNEL_MAKE_ENV ARCH=arm64 CROSS_COMPILE=$BUILD_CROSS_COMPILE REAL_CC=$KERNEL_LLVM_BIN CLANG_TRIPLE=$CLANG_TRIPLE gts6lwifi_eur_open_defconfig
#make -j8 -C $(pwd) O=$(pwd)/out $KERNEL_MAKE_ENV ARCH=arm64 CROSS_COMPILE=$BUILD_CROSS_COMPILE REAL_CC=$KERNEL_LLVM_BIN CLANG_TRIPLE=$CLANG_TRIPLE
 
#cp out/arch/arm64/boot/Image $(pwd)/arch/arm64/boot/Image
export PATH=/usr/bin:$PATH
export CROSS_COMPILE=/bin/
export BUILD_CROSS_COMPILE=/bin/
export KERNEL_LLVM_BIN=/bin/
make -j$(nproc) O=$(pwd)/out gts6lwifi_eur_open_defconfig
make -j$(nproc) O=$(pwd)/out
cp out/arch/arm64/boot/Image $(pwd)/arch/arm64/boot/Image

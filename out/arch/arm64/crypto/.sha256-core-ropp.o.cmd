cmd_arch/arm64/crypto/sha256-core-ropp.o := clang -Wp,-MD,arch/arm64/crypto/.sha256-core-ropp.o.d -nostdinc -isystem /usr/lib/llvm-14/lib/clang/14.0.6/include -I../arch/arm64/include -I./arch/arm64/include/generated  -I../include -I./include -I../arch/arm64/include/uapi -I./arch/arm64/include/generated/uapi -I../include/uapi -I./include/generated/uapi -include ../include/linux/kconfig.h -D__KERNEL__ -Qunused-arguments -mlittle-endian -DKASAN_SHADOW_SCALE_SHIFT=3 -D__ASSEMBLY__ -no-integrated-as -Werror=unknown-warning-option -Wno-misleading-indentation -Wno-bool-operation -Wno-unsequenced -fno-PIE -DCONFIG_AS_LSE=1 -DKASAN_SHADOW_SCALE_SHIFT=3 -DCC_HAVE_ASM_GOTO -Wa,-gdwarf-2   -c -o arch/arm64/crypto/sha256-core-ropp.o arch/arm64/crypto/sha256-core-ropp.S

source_arch/arm64/crypto/sha256-core-ropp.o := arch/arm64/crypto/sha256-core-ropp.S

deps_arch/arm64/crypto/sha256-core-ropp.o := \
  ../include/linux/compiler_types.h \
    $(wildcard include/config/have/arch/compiler/h.h) \
    $(wildcard include/config/enable/must/check.h) \
    $(wildcard include/config/enable/warn/deprecated.h) \

arch/arm64/crypto/sha256-core-ropp.o: $(deps_arch/arm64/crypto/sha256-core-ropp.o)

$(deps_arch/arm64/crypto/sha256-core-ropp.o):

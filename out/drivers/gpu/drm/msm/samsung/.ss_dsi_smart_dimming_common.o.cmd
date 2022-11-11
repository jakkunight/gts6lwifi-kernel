cmd_drivers/gpu/drm/msm/samsung/ss_dsi_smart_dimming_common.o := clang -Wp,-MD,drivers/gpu/drm/msm/samsung/.ss_dsi_smart_dimming_common.o.d -nostdinc -isystem /usr/lib/llvm-14/lib/clang/14.0.6/include -I../arch/arm64/include -I./arch/arm64/include/generated  -I../include -I./include -I../arch/arm64/include/uapi -I./arch/arm64/include/generated/uapi -I../include/uapi -I./include/generated/uapi -include ../include/linux/kconfig.h  -I../drivers/gpu/drm/msm/samsung -Idrivers/gpu/drm/msm/samsung -D__KERNEL__ -Qunused-arguments -mlittle-endian -DKASAN_SHADOW_SCALE_SHIFT=3 -Wall -Wundef -Wstrict-prototypes -Wno-trigraphs -fno-strict-aliasing -fno-common -fshort-wchar -Werror-implicit-function-declaration -Wno-format-security -std=gnu89 -no-integrated-as -Werror=unknown-warning-option -Wno-misleading-indentation -Wno-bool-operation -Wno-unsequenced -fno-PIE -mno-implicit-float -DCONFIG_AS_LSE=1 -fno-asynchronous-unwind-tables -fno-pic -Wno-asm-operand-widths -DKASAN_SHADOW_SCALE_SHIFT=3 -fno-delete-null-pointer-checks -Wno-frame-address -Wno-int-in-bool-context -Wno-address-of-packed-member -O2 --param=allow-store-data-races=0 -DCC_HAVE_ASM_GOTO -Wframe-larger-than=2048 -fstack-protector-strong -Wno-format-invalid-specifier -Wno-gnu -Wno-duplicate-decl-specifier -fno-builtin -Wno-tautological-constant-out-of-range-compare -Wno-sometimes-uninitialized -Wno-tautological-compare -mno-global-merge -Wno-unused-const-variable -fno-omit-frame-pointer -fno-optimize-sibling-calls -g -fno-jump-tables -Wdeclaration-after-statement -Wno-pointer-sign -Wno-array-bounds -fno-strict-overflow -fno-merge-all-constants -fno-stack-check -Werror=implicit-int -Werror=strict-prototypes -Werror=date-time -Werror=incompatible-pointer-types -fmacro-prefix-map=../= -Wno-initializer-overrides -Wno-unused-value -Wno-format -Wno-sign-compare -Wno-format-zero-length -Wno-uninitialized -Wno-pointer-to-enum-cast  -I../include/drm  -I../drivers/gpu/drm/msm  -I../drivers/gpu/drm/msm/dsi-staging  -I../drivers/gpu/drm/msm/sde  -I../drivers/gpu/drm/msm/samsung    -DKBUILD_BASENAME='"ss_dsi_smart_dimming_common"'  -DKBUILD_MODNAME='"ss_dsi_smart_dimming_common"' -c -o drivers/gpu/drm/msm/samsung/.tmp_ss_dsi_smart_dimming_common.o ../drivers/gpu/drm/msm/samsung/ss_dsi_smart_dimming_common.c

source_drivers/gpu/drm/msm/samsung/ss_dsi_smart_dimming_common.o := ../drivers/gpu/drm/msm/samsung/ss_dsi_smart_dimming_common.c

deps_drivers/gpu/drm/msm/samsung/ss_dsi_smart_dimming_common.o := \
  ../include/linux/compiler_types.h \
    $(wildcard include/config/have/arch/compiler/h.h) \
    $(wildcard include/config/enable/must/check.h) \
    $(wildcard include/config/enable/warn/deprecated.h) \
  ../include/linux/compiler-gcc.h \
    $(wildcard include/config/arch/supports/optimized/inlining.h) \
    $(wildcard include/config/optimize/inlining.h) \
    $(wildcard include/config/retpoline.h) \
    $(wildcard include/config/gcov/kernel.h) \
    $(wildcard include/config/arch/use/builtin/bswap.h) \
  ../include/linux/compiler-clang.h \
    $(wildcard include/config/lto/clang.h) \
    $(wildcard include/config/ftrace/mcount/record.h) \
  ../drivers/gpu/drm/msm/samsung/ss_dsi_smart_dimming_common.h \

drivers/gpu/drm/msm/samsung/ss_dsi_smart_dimming_common.o: $(deps_drivers/gpu/drm/msm/samsung/ss_dsi_smart_dimming_common.o)

$(deps_drivers/gpu/drm/msm/samsung/ss_dsi_smart_dimming_common.o):

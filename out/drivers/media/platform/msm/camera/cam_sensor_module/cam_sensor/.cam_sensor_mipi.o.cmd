cmd_drivers/media/platform/msm/camera/cam_sensor_module/cam_sensor/cam_sensor_mipi.o := clang -Wp,-MD,drivers/media/platform/msm/camera/cam_sensor_module/cam_sensor/.cam_sensor_mipi.o.d -nostdinc -isystem /usr/lib/llvm-14/lib/clang/14.0.6/include -I../arch/arm64/include -I./arch/arm64/include/generated  -I../include -I./include -I../arch/arm64/include/uapi -I./arch/arm64/include/generated/uapi -I../include/uapi -I./include/generated/uapi -include ../include/linux/kconfig.h  -I../drivers/media/platform/msm/camera/cam_sensor_module/cam_sensor -Idrivers/media/platform/msm/camera/cam_sensor_module/cam_sensor -D__KERNEL__ -Qunused-arguments -mlittle-endian -DKASAN_SHADOW_SCALE_SHIFT=3 -Wall -Wundef -Wstrict-prototypes -Wno-trigraphs -fno-strict-aliasing -fno-common -fshort-wchar -Werror-implicit-function-declaration -Wno-format-security -std=gnu89 -no-integrated-as -Werror=unknown-warning-option -Wno-misleading-indentation -Wno-bool-operation -Wno-unsequenced -fno-PIE -mno-implicit-float -DCONFIG_AS_LSE=1 -fno-asynchronous-unwind-tables -fno-pic -Wno-asm-operand-widths -DKASAN_SHADOW_SCALE_SHIFT=3 -fno-delete-null-pointer-checks -Wno-frame-address -Wno-int-in-bool-context -Wno-address-of-packed-member -O2 --param=allow-store-data-races=0 -DCC_HAVE_ASM_GOTO -Wframe-larger-than=2048 -fstack-protector-strong -Wno-format-invalid-specifier -Wno-gnu -Wno-duplicate-decl-specifier -fno-builtin -Wno-tautological-constant-out-of-range-compare -Wno-sometimes-uninitialized -Wno-tautological-compare -mno-global-merge -Wno-unused-const-variable -fno-omit-frame-pointer -fno-optimize-sibling-calls -g -fno-jump-tables -Wdeclaration-after-statement -Wno-pointer-sign -Wno-array-bounds -fno-strict-overflow -fno-merge-all-constants -fno-stack-check -Werror=implicit-int -Werror=strict-prototypes -Werror=date-time -Werror=incompatible-pointer-types -fmacro-prefix-map=../= -Wno-initializer-overrides -Wno-unused-value -Wno-format -Wno-sign-compare -Wno-format-zero-length -Wno-uninitialized -Wno-pointer-to-enum-cast  -I../drivers/media/platform/msm/camera/cam_core  -I../drivers/media/platform/msm/camera/cam_cpas/include  -I../drivers/media/platform/msm/camera/cam_req_mgr  -I../drivers/media/platform/msm/camera/cam_sensor_module/cam_cci  -I../drivers/media/platform/msm/camera/cam_sensor_module/cam_sensor_io  -I../drivers/media/platform/msm/camera/cam_sensor_module/cam_sensor_utils  -I../drivers/media/platform/msm/camera/cam_smmu/  -I../drivers/media/platform/msm/camera/cam_utils    -DKBUILD_BASENAME='"cam_sensor_mipi"'  -DKBUILD_MODNAME='"cam_sensor_mipi"' -c -o drivers/media/platform/msm/camera/cam_sensor_module/cam_sensor/.tmp_cam_sensor_mipi.o ../drivers/media/platform/msm/camera/cam_sensor_module/cam_sensor/cam_sensor_mipi.c

source_drivers/media/platform/msm/camera/cam_sensor_module/cam_sensor/cam_sensor_mipi.o := ../drivers/media/platform/msm/camera/cam_sensor_module/cam_sensor/cam_sensor_mipi.c

deps_drivers/media/platform/msm/camera/cam_sensor_module/cam_sensor/cam_sensor_mipi.o := \
    $(wildcard include/config/sec/gts5l/project.h) \
    $(wildcard include/config/sec/gts5lwifi/project.h) \
    $(wildcard include/config/sec/gts6l/project.h) \
    $(wildcard include/config/sec/gts6x/project.h) \
    $(wildcard include/config/sec/gts6lwifi/project.h) \
    $(wildcard include/config/camera/dynamic/mipi.h) \
    $(wildcard include/config/camera/frs/dram/test.h) \
    $(wildcard include/config/sec/factory.h) \
    $(wildcard include/config/sec/d2xq/project.h) \
    $(wildcard include/config/sec/d2q/project.h) \
    $(wildcard include/config/sec/d2xq2/project.h) \
    $(wildcard include/config/sec/beyondxq/project.h) \
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

drivers/media/platform/msm/camera/cam_sensor_module/cam_sensor/cam_sensor_mipi.o: $(deps_drivers/media/platform/msm/camera/cam_sensor_module/cam_sensor/cam_sensor_mipi.o)

$(deps_drivers/media/platform/msm/camera/cam_sensor_module/cam_sensor/cam_sensor_mipi.o):

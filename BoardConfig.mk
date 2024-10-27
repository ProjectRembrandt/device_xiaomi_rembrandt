#
# Copyright (C) 2024 The LineageOS Project
#
# SPDX-License-Identifier: Apache-2.0
#

DEVICE_PATH := device/xiaomi/rembrandt

BUILD_BROKEN_DUP_RULES := true
BUILD_BROKEN_ELF_PREBUILT_PRODUCT_COPY_FILES := true

# Display
TARGET_SCREEN_DENSITY := 560

# Init
TARGET_INIT_VENDOR_LIB := //$(DEVICE_PATH):libinit_rembrandt
TARGET_RECOVERY_DEVICE_MODULES := libinit_rembrandt

# Kernel - prebuilt
TARGET_FORCE_PREBUILT_KERNEL := true
ifeq ($(TARGET_FORCE_PREBUILT_KERNEL),true)
TARGET_PREBUILT_KERNEL := $(DEVICE_PATH)/prebuilts/kernel
BOARD_PREBUILT_DTBIMAGE_DIR := $(DEVICE_PATH)/prebuilts/dtb
BOARD_INCLUDE_DTB_IN_BOOTIMG := 
BOARD_KERNEL_SEPARATED_DTBO := 
endif

# Kernel Modules
BOARD_VENDOR_RAMDISK_KERNEL_MODULES := $(wildcard $(DEVICE_PATH)/prebuilts/modules/*.ko)
BOARD_VENDOR_RAMDISK_KERNEL_MODULES_LOAD := $(strip $(shell cat $(DEVICE_PATH)/prebuilts/modules/modules.load))
BOARD_VENDOR_RAMDISK_RECOVERY_KERNEL_MODULES_LOAD := $(strip $(shell cat $(DEVICE_PATH)/prebuilts/modules/modules.load.recovery))

# Vendor_dlkm
BOARD_USES_VENDOR_DLKMIMAGE := true
BOARD_VENDOR_KERNEL_MODULES := $(wildcard vendor/xiaomi/rembrandt/propietary/vendor_dlkm/lib/modules/*.ko)
BOARD_VENDOR_KERNEL_MODULES_LOAD := $(strip $(shell cat vendor/xiaomi/rembrandt/proprietary/vendor_dlkm/lib/modules/modules.load))

# Properties
TARGET_PRODUCT_PROP += $(DEVICE_PATH)/product.prop
TARGET_SYSTEM_EXT_PROP += $(DEVICE_PATH)/system_ext.prop
TARGET_VENDOR_PROP += $(DEVICE_PATH)/vendor.prop

# SPL
VENDOR_SECURITY_PATCH := 2024-10-21

# Inherit from mt6895-common
include device/xiaomi/mt6895-common/BoardConfigCommon.mk

# Inherit the proprietary files
include vendor/xiaomi/rembrandt/BoardConfigVendor.mk

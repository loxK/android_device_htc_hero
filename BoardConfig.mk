# Copyright (C) 2007 The Android Open Source Project
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#      http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

# config.mk
#
# Product-specific compile-time definitions.
#

# WARNING: This line must come *before* including the proprietary
# variant, so that it gets overwritten by the parent (which goes
# against the traditional rules of inheritance).
USE_CAMERA_STUB := true

-include vendor/htc/hero/BoardConfigVendor.mk

TARGET_BOARD_PLATFORM := msm7k
TARGET_ARCH_VARIANT := armv5te
TARGET_CPU_ABI := armeabi

TARGET_NO_BOOTLOADER := true
TARGET_NO_RADIOIMAGE := true
TARGET_NO_RECOVERY := true

# Wifi related defines
BOARD_WPA_SUPPLICANT_DRIVER := CUSTOM
BOARD_WPA_SUPPLICANT_PRIVATE_LIB := libWifiApi
BOARD_WLAN_TI_STA_DK_ROOT   := system/wlan/ti/sta_dk_4_0_4_32
WIFI_DRIVER_MODULE_PATH     := "/system/lib/modules/wlan.ko"
WIFI_DRIVER_MODULE_ARG      := ""
WIFI_DRIVER_MODULE_NAME     := "wlan"
WIFI_FIRMWARE_LOADER        := "wlan_loader"

#TARGET_BOOTLOADER_LIBS := \
#	libboot_board_hero \
#	libboot_arch_msm7k \
#	libboot_arch_armv6

#TARGET_BOOTLOADER_LINK_SCRIPT := \
#	hardware/msm7k/boot/boot.ld

BOARD_USES_GENERIC_AUDIO := false

BOARD_USE_HTC_LIBSENSORS := true

BOARD_USE_HERO_LIBSENSORS := true

BOARD_USES_QCOM_LIBS := true


BOARD_KERNEL_CMDLINE := no_console_suspend=1 console=null
BOARD_KERNEL_BASE := 0x19200000

BOARD_HAVE_BLUETOOTH := true

BOARD_VENDOR_USE_AKMD := akm8973

BOARD_VENDOR_QCOM_AMSS_VERSION := 6355

# The size of a block that can be marked bad.
BOARD_FLASH_BLOCK_SIZE := 131072
BOARD_CAMERA_LIBRARIES := libcameraservice libcamera

# OpenGL drivers config file path
BOARD_EGL_CFG := device/htc/hero/egl.cfg

# No authoring clock for OpenCore
BOARD_NO_PV_AUTHORING_CLOCK := true

# No fallback font by default (space savings)
NO_FALLBACK_FONT:=true

TARGET_RECOVERY_UPDATER_LIBS += librecovery_updater_htc

TARGET_RELEASETOOLS_EXTENSIONS := device/htc/common

TARGET_BOOTLOADER_BOARD_NAME := hero
TARGET_OTA_ASSERT_DEVICE := hero,heroc
PRODUCT_BUILD_PROP_OVERRIDES += TARGET_BOOTLOADER_BOARD_NAME=hero

# # cat /proc/mtd
# dev:    size   erasesize  name
# mtd0: 00040000 00020000 "misc"
# mtd1: 00500000 00020000 "recovery"
# mtd2: 00280000 00020000 "boot"
# mtd3: 05a00000 00020000 "system"
# mtd4: 05000000 00020000 "cache"
# mtd5: 127c0000 00020000 "userdata"
BOARD_BOOTIMAGE_PARTITION_SIZE := 0x00280000
BOARD_RECOVERYIMAGE_PARTITION_SIZE := 0x00500000
BOARD_SYSTEMIMAGE_PARTITION_SIZE := 0x05a00000
BOARD_USERDATAIMAGE_PARTITION_SIZE := 0x127c0000

#TARGET_RECOVERY_UI_LIB := librecovery_ui_hero librecovery_ui_htc

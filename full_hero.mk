# Copyright (C) 2009 The Android Open Source Project
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

#
# This file is the build configuration for a full Android
# build for hero hardware. This cleanly combines a set of
# device-specific aspects (drivers) with a device-agnostic
# product configuration (apps).
#

# Inherit from those products. Most specific first.
$(call inherit-product, $(SRC_TARGET_DIR)/product/languages_full.mk)
$(call inherit-product, device/htc/hero/device_hero_eu.mk)

PRODUCT_COPY_FILES += \
    device/htc/hero/init.hero.rc:root/init.hero.rc

PRODUCT_PACKAGES += \
    VoiceDialer \
    libOmxCore \
    libOmxVenc \
    libOmxVdec

# Install the features available on this device.
PRODUCT_COPY_FILES += \
    frameworks/base/data/etc/handheld_core_hardware.xml:system/etc/permissions/handheld_core_hardware.xml \
    frameworks/base/data/etc/android.hardware.camera.autofocus.xml:system/etc/permissions/android.hardware.camera.autofocus.xml \
    frameworks/base/data/etc/android.hardware.telephony.gsm.xml:system/etc/permissions/android.hardware.telephony.gsm.xml \
    frameworks/base/data/etc/android.hardware.location.gps.xml:system/etc/permissions/android.hardware.location.gps.xml \
    frameworks/base/data/etc/android.hardware.wifi.xml:system/etc/permissions/android.hardware.wifi.xml \
    frameworks/base/data/etc/android.hardware.touchscreen.multitouch.xml:system/etc/permissions/android.hardware.touchscreen.multitouch.xml

# Keylayouts
PRODUCT_COPY_FILES += \
    device/htc/hero/hero-keypad.kl:system/usr/keylayout/hero-keypad.kl \
    device/htc/hero/h2w_headset.kl:system/usr/keylayout/h2w_headset.kl

PRODUCT_PROPERTY_OVERRIDES := \
    keyguard.no_require_sim=true \
    ro.ril.hsxpa=2 \
    ro.ril.hsupa.category=5 \
    ro.ril.def.agps.mode=2 \
    ro.media.dec.jpeg.memcap=10000000
    
PRODUCT_PROPERTY_OVERRIDES += \
    rild.libpath=/system/lib/libhtc_ril.so \
    wifi.interface=tiwlan0
    
# Time between scans in seconds. Keep it high to minimize battery drain.
# This only affects the case in which there are remembered access points,
# but none are in range.
PRODUCT_PROPERTY_OVERRIDES += \
    wifi.supplicant_scan_interval=15

# density in DPI of the LCD of this board. This is used to scale the UI
# appropriately. If this property is not defined, the default value is 160 dpi. 
PRODUCT_PROPERTY_OVERRIDES += \
    ro.sf.lcd_density=160
    
# Disable JIT by default
PRODUCT_PROPERTY_OVERRIDES += \
    dalvik.vm.execution-mode=int:jit \
    dalvik.vm.heapsize=24m \
    ro.compcache.default=0
    
# media configuration xml file
PRODUCT_COPY_FILES += \
    device/htc/hero/media_profiles.xml:/system/etc/media_profiles.xml

PRODUCT_COPY_FILES += \
    device/htc/hero/vold.fstab:system/etc/vold.fstab

# stuff common to all HTC phones
$(call inherit-product, device/htc/common/common.mk)

$(call inherit-product, $(SRC_TARGET_DIR)/product/full.mk)

# Discard inherited values and use our own instead.
PRODUCT_NAME := full_hero
PRODUCT_DEVICE := hero
PRODUCT_MODEL := Full Android on Hero

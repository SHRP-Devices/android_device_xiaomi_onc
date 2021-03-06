#
# Copyright (C) 2017 The Android Open Source Project
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

# This contains the module build definitions for the hardware-specific
# components for this device.
#
# As much as possible, those components should be built unconditionally,
# with device-specific names to avoid collisions, to avoid device-specific
# bitrot and build breakages. Building a component unconditionally does
# *not* include it on all devices, so it is safe even with hardware-specific
# components.

# Release name
PRODUCT_RELEASE_NAME := onc

# Inherit from those products. Most specific first.
$(call inherit-product, build/target/product/embedded.mk)
$(call inherit-product, $(SRC_TARGET_DIR)/product/core_64_bit.mk)

# Inherit from our custom product configuration
$(call inherit-product, vendor/omni/config/common.mk)

# Device identifier. This must come after all inclusions
PRODUCT_DEVICE := onc
PRODUCT_NAME := omni_onc
PRODUCT_BRAND := Xiaomi
PRODUCT_MODEL := Redmi 7/Y3
PRODUCT_MANUFACTURER := Xiaomi

PRODUCT_PROPERTY_OVERRIDES += \
    ro.treble.enabled=true \
    ro.vendor.build.security_patch=2099-12-31 \
    persist.sys.isUsbOtgEnabled=true

# Timezone package
PRODUCT_COPY_FILES += \
    system/timezone/output_data/iana/tzdata:recovery/root/system_root/system/usr/share/zoneinfo/tzdata

# SHRP specific flags
SHRP_PATH := device/xiaomi/onc
SHRP_MAINTAINER := TheSync
SHRP_DEVICE_CODE := onc
SHRP_OFFICIAL := true
SHRP_EDL_MODE := 1
SHRP_EXTERNAL := /external_sd
SHRP_INTERNAL := /sdcard
SHRP_OTG := /usb-otg
SHRP_FLASH := 1
SHRP_REC := /dev/block/bootdevice/by-name/recovery
SHRP_REC_TYPE := SAR
SHRP_DEVICE_TYPE := A_Only
SHRP_STATUSBAR_RIGHT_PADDING := 48
SHRP_STATUSBAR_LEFT_PADDING := 48
SHRP_NOTCH := true
SHRP_EXPRESS := true
INC_IN_REC_MAGISK := true
INC_IN_REC_ADDON_1 := true
INC_IN_REC_ADDON_2 := true
INC_IN_REC_ADDON_3 := true
INC_IN_REC_ADDON_4 := true

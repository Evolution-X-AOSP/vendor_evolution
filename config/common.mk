#
# Copyright (C) 2019-2021 The Evolution X Project
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

# Enable updating of APEXes
$(call inherit-product, $(SRC_TARGET_DIR)/product/updatable_apex.mk)

# Inherit vendor submodules
$(call inherit-product, vendor/evolution/config/apex.mk)
$(call inherit-product, vendor/evolution/config/apps.mk)
$(call inherit-product, vendor/evolution/config/bootanimation.mk)
$(call inherit-product, vendor/evolution/config/common_telephony.mk)
$(call inherit-product, vendor/evolution/config/themes.mk)

# Inherit from GMS product config
$(call inherit-product, vendor/gms/gms_full.mk)

PRODUCT_BRAND ?= EvolutionX

PRODUCT_SYSTEM_DEFAULT_PROPERTIES += \
    dalvik.vm.debug.alloc=0 \
    ro.com.android.dataroaming=false \
    ro.com.android.dateformat=MM-dd-yyyy \
    persist.sys.disable_rescue=true

# IORap app launch prefetching using Perfetto traces and madvise
PRODUCT_PRODUCT_PROPERTIES += \
    iorapd.perfetto.enable=true \
    iorapd.readahead.enable=true \
    ro.iorapd.enable=true

# Disable touch video heatmap to reduce latency, motion jitter, and CPU usage
# on supported devices with Deep Press input classifier HALs and models
PRODUCT_PRODUCT_PROPERTIES += \
    ro.input.video_enabled=false

ifeq ($(TARGET_BUILD_VARIANT),eng)
# Disable ADB authentication
PRODUCT_SYSTEM_DEFAULT_PROPERTIES += ro.adb.secure=0
else
# Enable ADB authentication
PRODUCT_SYSTEM_DEFAULT_PROPERTIES += ro.adb.secure=1
endif

# Backup Tool
PRODUCT_COPY_FILES += \
    vendor/evolution/prebuilt/common/bin/backuptool.sh:$(TARGET_COPY_OUT_SYSTEM)/install/bin/backuptool.sh \
    vendor/evolution/prebuilt/common/bin/backuptool.functions:$(TARGET_COPY_OUT_SYSTEM)/install/bin/backuptool.functions \
    vendor/evolution/prebuilt/common/bin/50-base.sh:$(TARGET_COPY_OUT_SYSTEM)/addon.d/50-base.sh

ifneq ($(strip $(AB_OTA_PARTITIONS) $(AB_OTA_POSTINSTALL_CONFIG)),)
PRODUCT_COPY_FILES += \
    vendor/evolution/prebuilt/common/bin/backuptool_ab.sh:$(TARGET_COPY_OUT_SYSTEM)/bin/backuptool_ab.sh \
    vendor/evolution/prebuilt/common/bin/backuptool_ab.functions:$(TARGET_COPY_OUT_SYSTEM)/bin/backuptool_ab.functions \
    vendor/evolution/prebuilt/common/bin/backuptool_postinstall.sh:$(TARGET_COPY_OUT_SYSTEM)/bin/backuptool_postinstall.sh
endif

# ROM-specific broadcast actions whitelist
PRODUCT_COPY_FILES += \
    vendor/evolution/config/permissions/evolution-sysconfig.xml:$(TARGET_COPY_OUT_SYSTEM)/etc/sysconfig/evolution-sysconfig.xml

# Some permissions
PRODUCT_COPY_FILES += \
    vendor/evolution/config/permissions/backup.xml:$(TARGET_COPY_OUT_SYSTEM)/etc/sysconfig/backup.xml \
    vendor/evolution/config/permissions/privapp-permissions-evolution.xml:$(TARGET_COPY_OUT_SYSTEM_EXT)/etc/permissions/privapp-permissions-evolution.xml

# Copy all custom init rc files
$(foreach f,$(wildcard vendor/evolution/prebuilt/common/etc/init/*.rc),\
    $(eval PRODUCT_COPY_FILES += $(f):$(TARGET_COPY_OUT_SYSTEM)/etc/init/$(notdir $f)))

# Enable Android Beam on all targets
PRODUCT_COPY_FILES += \
    vendor/evolution/config/permissions/android.software.nfc.beam.xml:$(TARGET_COPY_OUT_SYSTEM)/etc/permissions/android.software.nfc.beam.xml

# Enable SIP+VoIP on all targets
PRODUCT_COPY_FILES += \
    frameworks/native/data/etc/android.software.sip.voip.xml:$(TARGET_COPY_OUT_SYSTEM)/etc/permissions/android.software.sip.voip.xml

# Enable wireless Xbox 360 controller support
PRODUCT_COPY_FILES += \
    frameworks/base/data/keyboards/Vendor_045e_Product_028e.kl:$(TARGET_COPY_OUT_SYSTEM)/usr/keylayout/Vendor_045e_Product_0719.kl

# TEMP: Enable transitional log for Privileged permissions
PRODUCT_PRODUCT_PROPERTIES += \
    ro.control_privapp_permissions=log

# Power whitelist
PRODUCT_COPY_FILES += \
    vendor/evolution/config/permissions/custom-power-whitelist.xml:$(TARGET_COPY_OUT_SYSTEM)/etc/sysconfig/custom-power-whitelist.xml

# Do not include art debug targets
PRODUCT_ART_TARGET_INCLUDE_DEBUG_BUILD := false

# Strip the local variable table and the local variable type table to reduce
# the size of the system image. This has no bearing on stack traces, but will
# leave less information available via JDWP.
PRODUCT_MINIMIZE_JAVA_DEBUG_INFO := true

# Filesystems tools
PRODUCT_PACKAGES += \
    fsck.exfat \
    fsck.ntfs \
    mke2fs \
    mkfs.exfat \
    mkfs.ntfs \
    mount.ntfs

# Storage manager
PRODUCT_SYSTEM_DEFAULT_PROPERTIES += \
    ro.storage_manager.enabled=true

# Media
PRODUCT_SYSTEM_DEFAULT_PROPERTIES += \
    media.recorder.show_manufacturer_and_model=true

# Overlays
PRODUCT_ENFORCE_RRO_EXCLUDED_OVERLAYS += vendor/evolution/overlay
DEVICE_PACKAGE_OVERLAYS += vendor/evolution/overlay/common

# Dex preopt
PRODUCT_DEXPREOPT_SPEED_APPS += \
    SystemUI \
    NexusLauncherRelease

# Themed bootanimation
TARGET_MISC_BLOCK_OFFSET ?= 0
PRODUCT_SYSTEM_DEFAULT_PROPERTIES += \
    ro.misc.block.offset=$(TARGET_MISC_BLOCK_OFFSET)
PRODUCT_PACKAGES += \
    misc_writer \
    themed_bootanimation

# Face Unlock
TARGET_FACE_UNLOCK_SUPPORTED ?= true
ifeq ($(TARGET_FACE_UNLOCK_SUPPORTED),true)
PRODUCT_PACKAGES += \
    FaceUnlockService
PRODUCT_SYSTEM_DEFAULT_PROPERTIES += \
    ro.face_unlock_service.enabled=$(TARGET_FACE_UNLOCK_SUPPORTED)
PRODUCT_COPY_FILES += \
    frameworks/native/data/etc/android.hardware.biometrics.face.xml:$(TARGET_COPY_OUT_SYSTEM)/etc/permissions/android.hardware.biometrics.face.xml
endif

# Branding
include vendor/evolution/config/branding.mk

# OTA
include vendor/evolution/config/ota.mk

# Pixel Style
include vendor/pixelstyle/config.mk

# Plugins
include packages/apps/Plugins/plugins.mk

-include $(WORKSPACE)/build_env/image-auto-bits.mk

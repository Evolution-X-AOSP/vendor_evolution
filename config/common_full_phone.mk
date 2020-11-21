# Telephony
IS_PHONE := true

# World APN list
PRODUCT_PACKAGES += \
    apns-conf.xml

# Telephony packages
PRODUCT_PACKAGES += \
    Stk

ifneq ($(filter blueline crosshatch,$(TARGET_DEVICE)),)
ifneq ($(TARGET_BUILD_VARIANT),user)
# Ignore neverallows to allow Smart Charging sepolicies
SELINUX_IGNORE_NEVERALLOWS := true

# Inherit from our vendor sepolicy config
$(call inherit-product, vendor/evolution/configs/vendor_sepolicy.mk)

# Include Smart Charging overlays
DEVICE_PACKAGE_OVERLAYS += \
    vendor/evolution/overlay-smartcharging
endif
endif

# Tethering - allow without requiring a provisioning app
# (for devices that check this)
PRODUCT_SYSTEM_DEFAULT_PROPERTIES += \
    net.tethering.noprovisioning=true

# Inherit full common Evolution X stuff
$(call inherit-product, vendor/evolution/config/common_full.mk)

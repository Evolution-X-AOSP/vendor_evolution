# Telephony
IS_PHONE := true

# Telephony packages
PRODUCT_PACKAGES += \
    Stk

# Tethering - allow without requiring a provisioning app
# (for devices that check this)
PRODUCT_SYSTEM_DEFAULT_PROPERTIES += \
    net.tethering.noprovisioning=true

# Inherit full common Evolution X stuff
$(call inherit-product, vendor/evolution/config/common_full.mk)

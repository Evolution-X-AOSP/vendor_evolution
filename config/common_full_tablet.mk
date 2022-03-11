# Required packages
PRODUCT_PACKAGES += \
    androidx.window.extensions

# World APN list
PRODUCT_PACKAGES += \
    apns-conf.xml

# Telephony packages
PRODUCT_PACKAGES += \
    Stk

# Inherit full common PixelExperience stuff
$(call inherit-product, vendor/evolution/config/common_full.mk)

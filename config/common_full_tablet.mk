# Inherit full common Evolution X stuff
$(call inherit-product, vendor/evolution/config/common_full.mk)

# Required packages
PRODUCT_PACKAGES += \
    androidx.window.extensions

$(call inherit-product, vendor/evolution/config/telephony.mk)

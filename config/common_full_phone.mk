# Inherit full common Evolution X stuff
$(call inherit-product, vendor/evolution/config/common_full.mk)

# Required packages
PRODUCT_PACKAGES += \
    NavigationBarMode2ButtonOverlay

# Enable support of one-handed mode
PRODUCT_PRODUCT_PROPERTIES += \
    ro.support_one_handed_mode?=true

# Inherit from GMS product config
ifeq ($(TARGET_USES_MINI_GAPPS),true)
$(call inherit-product, vendor/gms/gms_mini.mk)
else ifeq ($(TARGET_USES_PICO_GAPPS),true)
$(call inherit-product, vendor/gms/gms_pico.mk)
else
$(call inherit-product, vendor/gms/gms_full_og.mk)
endif

# Inherit from telephony config
$(call inherit-product, vendor/evolution/config/telephony.mk)

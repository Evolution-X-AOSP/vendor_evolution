# Inherit full common Evolution X stuff
$(call inherit-product, vendor/evolution/config/common_full.mk)

# Required packages
PRODUCT_PACKAGES += \
    NavigationBarMode2ButtonOverlay

# DesktopMode
PRODUCT_PACKAGES += \
    DesktopMode

PRODUCT_COPY_FILES += \
    frameworks/native/data/etc/android.software.freeform_window_management.xml:$(TARGET_COPY_OUT_PRODUCT)/etc/permissions/android.software.freeform_window_management.xml

$(call inherit-product, packages/services/VncFlinger/product.mk)

# Enable support of one-handed mode
PRODUCT_PRODUCT_PROPERTIES += \
    ro.support_one_handed_mode=true

# Inherit from telephony config
$(call inherit-product, vendor/evolution/config/telephony.mk)

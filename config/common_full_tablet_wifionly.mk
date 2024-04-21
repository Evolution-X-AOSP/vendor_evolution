$(call inherit-product, $(SRC_TARGET_DIR)/product/window_extensions.mk)

# Settings
PRODUCT_PRODUCT_PROPERTIES += \
    persist.settings.large_screen_opt.enabled=true

# Inherit full common Evolution X stuff
$(call inherit-product, vendor/evolution/config/common_full.mk)
$(call inherit-product, vendor/gms/gms_full_tablet_wifionly.mk)

$(call inherit-product, $(SRC_TARGET_DIR)/product/window_extensions.mk)

# Inherit full common Evolution X stuff
$(call inherit-product, vendor/evolution/config/common_full.mk)
$(call inherit-product, vendor/gms/gms_full_tablet_wifionly.mk)

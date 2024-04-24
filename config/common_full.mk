# Inherit common Lineage stuff
$(call inherit-product, vendor/lineage/config/common_mobile.mk)

PRODUCT_SIZE := full

# Apps
PRODUCT_PACKAGES += \
    Etar \
    Profiles \
    Recorder \
    Seedvault

ifneq ($(TARGET_IS_PIXEL),true)
ifneq ($(PRODUCT_NO_CAMERA),true)
PRODUCT_PACKAGES += \
    Aperture
endif
endif

ifeq ($(WITH_GMS),false)
ifneq ($(TARGET_EXCLUDES_AUDIOFX),true)
PRODUCT_PACKAGES += \
    AudioFX
endif
endif

# Extra cmdline tools
PRODUCT_PACKAGES += \
    unrar \
    zstd

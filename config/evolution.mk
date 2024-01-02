# Evolution X packages
PRODUCT_PACKAGES += \
    EvoEgg

ifeq ($(EVO_BUILD_TYPE),Official)
PRODUCT_PACKAGES += \
    Updater
endif

# Cloned app exemption
PRODUCT_COPY_FILES += \
    vendor/lineage/prebuilt/common/etc/sysconfig/preinstalled-packages-platform-evolution-product.xml:$(TARGET_COPY_OUT_PRODUCT)/etc/sysconfig/preinstalled-packages-platform-evolution-product.xml

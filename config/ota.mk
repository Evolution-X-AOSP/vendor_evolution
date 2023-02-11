ifeq ($(EVO_BUILD_TYPE), OFFICIAL)

EVO_OTA_VERSION_CODE := thirteen

PRODUCT_PRODUCT_PROPERTIES += \
    org.evolution.ota.version_code=$(EVO_OTA_VERSION_CODE)

endif

ifeq ($(EVO_BUILD_TYPE), OFFICIAL)

EVO_OTA_VERSION_CODE := twelve

PRODUCT_PRODUCT_PROPERTIES += \
    org.evolution.ota.version_code=$(EVO_OTA_VERSION_CODE) \
    sys.ota.disable_uncrypt=1

PRODUCT_PACKAGES += \
    Updates

endif

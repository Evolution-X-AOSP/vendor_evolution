ifeq ($(CUSTOM_BUILD_TYPE), OFFICIAL)

CUSTOM_OTA_VERSION_CODE := ten

CUSTOM_PROPERTIES += \
    org.evolution.ota.version_code=$(CUSTOM_OTA_VERSION_CODE) \
    sys.ota.disable_uncrypt=1

PRODUCT_PACKAGES += \
    Updates

PRODUCT_COPY_FILES += \
    vendor/aosp/config/permissions/org.evolution.ota.xml:$(TARGET_COPY_OUT_SYSTEM)/etc/permissions/org.evolution.ota.xml

endif

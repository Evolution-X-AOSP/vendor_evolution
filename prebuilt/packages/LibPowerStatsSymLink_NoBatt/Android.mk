LOCAL_PATH := $(call my-dir)

include $(CLEAR_VARS)
LOCAL_MODULE := LibPowerStatsSymLink_NoBatt
LOCAL_MODULE_CLASS := APPS
LOCAL_MODULE_TAGS := optional
LOCAL_OVERRIDES_PACKAGES += \
	LibPowerStatsSymLink
LOCAL_UNINSTALLABLE_MODULE := true
LOCAL_CERTIFICATE := PRESIGNED
LOCAL_SRC_FILES := /dev/null

LIBPOWERSTATS_SYMLINK := $(TARGET_OUT_SYSTEM_EXT)/priv-app/TurboAdapter_NoBatt/lib/arm64/libpowerstatshaldataprovider.so
$(LIBPOWERSTATS_SYMLINK): $(LOCAL_INSTALLED_MODULE)
	@echo "libpowerstatshaldataprovider link: $@"
	@mkdir -p $(dir $@)
	@rm -rf $@
	$(hide) ln -sf /system_ext/lib64/libpowerstatshaldataprovider.so $@

ALL_DEFAULT_INSTALLED_MODULES += $(LIBPOWERSTATS_SYMLINK)

include $(BUILD_PREBUILT)

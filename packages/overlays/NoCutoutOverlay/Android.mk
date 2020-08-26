LOCAL_PATH:= $(call my-dir)
include $(CLEAR_VARS)

LOCAL_MODULE_TAGS := optional

LOCAL_PACKAGE_NAME := NoCutoutOverlay
LOCAL_SDK_VERSION := current
LOCAL_CERTIFICATE := platform
LOCAL_PRIVILEGED_MODULE := false

ifneq ($(filter true, $(TARGET_PROVIDES_OWN_NO_CUTOUT_OVERLAY)),)
include $(BUILD_PACKAGE)
endif

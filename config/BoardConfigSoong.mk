PATH_OVERRIDE_SOONG := $(shell echo $(TOOLS_PATH_OVERRIDE))

# Add variables that we wish to make available to soong here.
EXPORT_TO_SOONG := \
    KERNEL_ARCH \
    KERNEL_BUILD_OUT_PREFIX \
    KERNEL_CROSS_COMPILE \
    KERNEL_MAKE_CMD \
    KERNEL_MAKE_FLAGS \
    PATH_OVERRIDE_SOONG \
    TARGET_KERNEL_CONFIG \
    TARGET_KERNEL_SOURCE \
    TARGET_KERNEL_HEADERS

SOONG_CONFIG_NAMESPACES += evolutionVarsPlugin

SOONG_CONFIG_evolutionVarsPlugin :=

define addVar
  SOONG_CONFIG_evolutionVarsPlugin += $(1)
  SOONG_CONFIG_evolutionVarsPlugin_$(1) := $$(subst ",\",$$($1))
endef

$(foreach v,$(EXPORT_TO_SOONG),$(eval $(call addVar,$(v))))

SOONG_CONFIG_NAMESPACES += evolutionGlobalVars
SOONG_CONFIG_evolutionGlobalVars += \
    additional_gralloc_10_usage_bits \
    bootloader_message_offset \
    disable_postrender_cleanup \
    has_legacy_camera_hal1 \
    ignores_ftp_pptp_conntrack_failure \
    needs_netd_direct_connect_rule \
    target_camera_needs_client_info \
    target_init_vendor_lib \
    target_inputdispatcher_skip_event_key \
    target_ld_shim_libs \
    target_process_sdk_version_override \
    target_surfaceflinger_fod_lib \
    target_uses_prebuilt_dynamic_partitions \
    uses_camera_parameter_lib

SOONG_CONFIG_NAMESPACES += evolutionNvidiaVars
SOONG_CONFIG_evolutionNvidiaVars += \
    uses_nv_enhancements

SOONG_CONFIG_NAMESPACES += evolutionQcomVars
SOONG_CONFIG_evolutionQcomVars += \
    legacy_hw_disk_encryption \
    should_wait_for_qsee \
    supports_audio_accessory \
    supports_debug_accessory \
    supports_extended_compress_format \
    supports_hw_fde \
    supports_hw_fde_perf \
    uses_pre_uplink_features_netmgrd \
    uses_qcom_bsp_legacy \
    uses_qti_camera_device \
    needs_camera_boottime_timestamp

# Only create display_headers_namespace var if dealing with UM platforms to avoid breaking build for all other platforms
ifneq ($(filter $(UM_PLATFORMS),$(TARGET_BOARD_PLATFORM)),)
SOONG_CONFIG_evolutionQcomVars += \
    qcom_display_headers_namespace
endif

# Soong bool variables
SOONG_CONFIG_evolutionGlobalVars_disable_postrender_cleanup := $(TARGET_DISABLE_POSTRENDER_CLEANUP)
SOONG_CONFIG_evolutionGlobalVars_has_legacy_camera_hal1 := $(TARGET_HAS_LEGACY_CAMERA_HAL1)
SOONG_CONFIG_evolutionGlobalVars_ignores_ftp_pptp_conntrack_failure := $(TARGET_IGNORES_FTP_PPTP_CONNTRACK_FAILURE)
SOONG_CONFIG_evolutionGlobalVars_needs_netd_direct_connect_rule := $(TARGET_NEEDS_NETD_DIRECT_CONNECT_RULE)
SOONG_CONFIG_evolutionGlobalVars_target_camera_needs_client_info := $(TARGET_CAMERA_NEEDS_CLIENT_INFO)
SOONG_CONFIG_evolutionGlobalVars_target_uses_prebuilt_dynamic_partitions := $(TARGET_USES_PREBUILT_DYNAMIC_PARTITIONS)
SOONG_CONFIG_evolutionNvidiaVars_uses_nv_enhancements := $(NV_ANDROID_FRAMEWORK_ENHANCEMENTS)
SOONG_CONFIG_evolutionQcomVars_legacy_hw_disk_encryption := $(TARGET_LEGACY_HW_DISK_ENCRYPTION)
SOONG_CONFIG_evolutionQcomVars_should_wait_for_qsee := $(TARGET_KEYMASTER_WAIT_FOR_QSEE)
SOONG_CONFIG_evolutionQcomVars_supports_audio_accessory := $(TARGET_QTI_USB_SUPPORTS_AUDIO_ACCESSORY)
SOONG_CONFIG_evolutionQcomVars_supports_debug_accessory := $(TARGET_QTI_USB_SUPPORTS_DEBUG_ACCESSORY)
SOONG_CONFIG_evolutionQcomVars_supports_extended_compress_format := $(AUDIO_FEATURE_ENABLED_EXTENDED_COMPRESS_FORMAT)
SOONG_CONFIG_evolutionQcomVars_supports_hw_fde := $(TARGET_HW_DISK_ENCRYPTION)
SOONG_CONFIG_evolutionQcomVars_supports_hw_fde_perf := $(TARGET_HW_DISK_ENCRYPTION_PERF)
SOONG_CONFIG_evolutionQcomVars_uses_pre_uplink_features_netmgrd := $(TARGET_USES_PRE_UPLINK_FEATURES_NETMGRD)
SOONG_CONFIG_evolutionQcomVars_uses_qcom_bsp_legacy := $(TARGET_USES_QCOM_BSP_LEGACY)
SOONG_CONFIG_evolutionQcomVars_uses_qti_camera_device := $(TARGET_USES_QTI_CAMERA_DEVICE)
SOONG_CONFIG_evolutionQcomVars_needs_camera_boottime_timestamp := $(TARGET_CAMERA_BOOTTIME_TIMESTAMP)

# Set default values
BOOTLOADER_MESSAGE_OFFSET ?= 0
TARGET_ADDITIONAL_GRALLOC_10_USAGE_BITS ?= 0
TARGET_INIT_VENDOR_LIB ?= vendor_init
TARGET_INPUTDISPATCHER_SKIP_EVENT_KEY ?= 0
TARGET_SPECIFIC_CAMERA_PARAMETER_LIBRARY ?= libcamera_parameters
TARGET_SURFACEFLINGER_FOD_LIB ?= surfaceflinger_fod_lib

# Soong value variables
SOONG_CONFIG_evolutionGlobalVars_additional_gralloc_10_usage_bits := $(TARGET_ADDITIONAL_GRALLOC_10_USAGE_BITS)
SOONG_CONFIG_evolutionGlobalVars_bootloader_message_offset := $(BOOTLOADER_MESSAGE_OFFSET)
SOONG_CONFIG_evolutionGlobalVars_target_init_vendor_lib := $(TARGET_INIT_VENDOR_LIB)
SOONG_CONFIG_evolutionGlobalVars_target_inputdispatcher_skip_event_key := $(TARGET_INPUTDISPATCHER_SKIP_EVENT_KEY)
SOONG_CONFIG_evolutionGlobalVars_target_ld_shim_libs := $(subst $(space),:,$(TARGET_LD_SHIM_LIBS))
SOONG_CONFIG_evolutionGlobalVars_target_process_sdk_version_override := $(TARGET_PROCESS_SDK_VERSION_OVERRIDE)
SOONG_CONFIG_evolutionGlobalVars_target_surfaceflinger_fod_lib := $(TARGET_SURFACEFLINGER_FOD_LIB)
SOONG_CONFIG_evolutionGlobalVars_uses_camera_parameter_lib := $(TARGET_SPECIFIC_CAMERA_PARAMETER_LIBRARY)
ifneq ($(filter $(QSSI_SUPPORTED_PLATFORMS),$(TARGET_BOARD_PLATFORM)),)
SOONG_CONFIG_evolutionQcomVars_qcom_display_headers_namespace := vendor/qcom/opensource/commonsys-intf/display
else
SOONG_CONFIG_evolutionQcomVars_qcom_display_headers_namespace := $(QCOM_SOONG_NAMESPACE)/display
endif

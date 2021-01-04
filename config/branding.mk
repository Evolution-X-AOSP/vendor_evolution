# Versioning System
EVO_BASE_VERSION := 5.3
EVO_CODENAME := Lightning
EVO_DONATE_URL ?= Unknown
EVO_MAINTAINER ?= Unknown
EVO_SUPPORT_URL ?= https://t.me/EvolutionX

# Set all versions
EVO_BUILD_TYPE ?= UNOFFICIAL

EVO_DATE_YEAR := $(shell date -u +%Y)
EVO_DATE_MONTH := $(shell date -u +%m)
EVO_DATE_DAY := $(shell date -u +%d)
EVO_DATE_HOUR := $(shell date -u +%H)
EVO_DATE_MINUTE := $(shell date -u +%M)
EVO_BUILD_DATE_UTC := $(shell date -d '$(EVO_DATE_YEAR)-$(EVO_DATE_MONTH)-$(EVO_DATE_DAY) $(EVO_DATE_HOUR):$(EVO_DATE_MINUTE) UTC' +%s)
EVO_BUILD_DATE := $(EVO_DATE_YEAR)$(EVO_DATE_MONTH)$(EVO_DATE_DAY)-$(EVO_DATE_HOUR)$(EVO_DATE_MINUTE)
BUILD_DATE_TIME := $(BUILD_TIME)$(BUILD_DATE)

EVO_PLATFORM_VERSION := $(PLATFORM_VERSION)

TARGET_PRODUCT_SHORT := $(subst evolution_,,$(EVOLUTION_BUILD))

EVO_VERSION_DISPLAY := $(EVO_CODENAME)-v$(EVO_BASE_VERSION)-$(TARGET_PRODUCT_SHORT)-$(EVO_BUILD_DATE)-$(EVO_BUILD_TYPE)

ifeq ($(EVO_BUILD_TYPE), OFFICIAL)
    WITH_GAPPS := true
endif

ifeq ($(WITH_GAPPS),true)
    EVO_VERSION := EvolutionX_$(EVO_BASE_VERSION)_$(EVOLUTION_BUILD)-$(EVO_PLATFORM_VERSION)-$(EVO_BUILD_DATE)-$(EVO_BUILD_TYPE)
else
    EVO_VERSION := EvolutionX_$(EVO_BASE_VERSION)_$(EVOLUTION_BUILD)-$(EVO_PLATFORM_VERSION)-$(EVO_BUILD_DATE)-$(EVO_BUILD_TYPE)-VANILLA
endif

EVO_VERSION_PROP := $(PLATFORM_VERSION)

PRODUCT_GENERIC_PROPERTIES += \
    ro.build.datetime=$(BUILD_DATE_TIME) \
    org.evolution.version=$(EVO_VERSION) \
    org.evolution.version.prop=$(EVO_VERSION_PROP) \
    org.evolution.version.display=$(EVO_VERSION_DISPLAY) \
    org.evolution.build_version=$(EVO_BASE_VERSION) \
    org.evolution.build_date=$(EVO_BUILD_DATE) \
    org.evolution.build_date_utc=$(EVO_BUILD_DATE_UTC) \
    org.evolution.build_type=$(EVO_BUILD_TYPE) \
    org.evolution.build_donate_url=$(EVO_DONATE_URL) \
    org.evolution.build_maintainer=$(EVO_MAINTAINER) \
    org.evolution.build_support_url=$(EVO_SUPPORT_URL) \
    org.evolution.build_codename=$(EVO_CODENAME)

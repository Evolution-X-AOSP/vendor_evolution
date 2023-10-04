#
# Copyright (C) 2020-2021 Haruka LLC.
# Copyright (C) 2020-2021 Haruka Aita
# Copyright (C) 2019-2023 Evolution X
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#      http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

# Versioning System
EVO_BASE_VERSION := 7.9.9
EVO_CODENAME := Tocino

# Set all versions
EVO_BUILD_TYPE ?= COMMUNITY

EVO_DATE_YEAR := $(shell date -u +%Y)
EVO_DATE_MONTH := $(shell date -u +%m)
EVO_DATE_DAY := $(shell date -u +%d)
EVO_DATE_HOUR := $(shell date -u +%H)
EVO_DATE_MINUTE := $(shell date -u +%M)
EVO_BUILD_DATE_UTC := $(shell date -d '$(EVO_DATE_YEAR)-$(EVO_DATE_MONTH)-$(EVO_DATE_DAY) $(EVO_DATE_HOUR):$(EVO_DATE_MINUTE) UTC' +%s)
EVO_BUILD_DATE := $(EVO_DATE_YEAR)$(EVO_DATE_MONTH)$(EVO_DATE_DAY)-$(EVO_DATE_HOUR)$(EVO_DATE_MINUTE)

BUILD_ID_LC ?= $(shell echo $(BUILD_ID) | tr '[:upper:]' '[:lower:]')

EVO_PLATFORM_VERSION := $(PLATFORM_VERSION)

TARGET_PRODUCT_SHORT := $(subst evolution_,,$(EVOLUTION_BUILD))

EVO_VERSION_DISPLAY := $(EVO_CODENAME)-$(EVO_BASE_VERSION)-$(TARGET_PRODUCT_SHORT)-$(EVO_BUILD_DATE)-$(EVO_BUILD_TYPE)
ifeq ($(EVO_BUILD_TYPE), OFFICIAL)
    EVO_VERSION := $(TARGET_PRODUCT)-ota-$(BUILD_ID_LC)-$(shell date +%m%d%H%M)
    EVO_DELTA_VERSION := $(TARGET_PRODUCT)-delta-$(BUILD_ID_LC)-$(shell date +%m%d%H%M)
else
    EVO_VERSION := $(TARGET_PRODUCT)-ota-$(BUILD_ID_LC)-$(shell date +%m%d%H%M)-$(shell echo "$(EVO_BUILD_TYPE)" | tr '[:upper:]' '[:lower:]')
    EVO_DELTA_VERSION := $(TARGET_PRODUCT)-delta-$(BUILD_ID_LC)-$(shell date +%m%d%H%M)-$(shell echo "$(EVO_BUILD_TYPE)" | tr '[:upper:]' '[:lower:]')
endif

EVO_VERSION_PROP := $(PLATFORM_VERSION)

PRODUCT_PRODUCT_PROPERTIES += \
    org.evolution.version=$(EVO_VERSION) \
    org.evolution.version.prop=$(EVO_VERSION_PROP) \
    org.evolution.version.display=$(EVO_VERSION_DISPLAY) \
    org.evolution.build_version=$(EVO_BASE_VERSION) \
    org.evolution.build_date=$(EVO_BUILD_DATE) \
    org.evolution.build_date_utc=$(EVO_BUILD_DATE_UTC) \
    org.evolution.build_type=$(EVO_BUILD_TYPE) \
    org.evolution.build_codename=$(EVO_CODENAME)

$(call inherit-product-if-exists, vendor/evolution/build/target/product/security/evolution_security.mk)

# Check signed
EVO_SIGNED ?= false

ifeq ($(EVO_SIGNED), true)
    PRODUCT_PRODUCT_PROPERTIES += org.evolution.key_type=signed
else
    PRODUCT_PRODUCT_PROPERTIES += org.evolution.key_type=unsigned
endif

PRODUCT_HOST_PACKAGES += \
    sign_target_files_apks \
    ota_from_target_files

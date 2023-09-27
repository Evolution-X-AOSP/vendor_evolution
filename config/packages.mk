#
# Copyright (C) 2019-2022 The Evolution X Project
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

# Apps
PRODUCT_PACKAGES += \
    EvoEgg \
    GameSpace \
    Papers \
    ParallelSpace \
    RepainterServicePriv \
    ThemePicker \
#    Updates \
    WallpaperPicker2

# Whether the compiled build to be shipped with Aperture CAM
TARGET_BUILD_APERTURE_CAMERA ?= true
ifeq ($(TARGET_BUILD_APERTURE_CAMERA),true)
PRODUCT_PACKAGES += \
    Aperture
endif

# TouchGestures
TARGET_SUPPORTS_TOUCHGESTURES ?= false
ifeq ($(TARGET_SUPPORTS_TOUCHGESTURES),true)
PRODUCT_PACKAGES += \
    TouchGestures \
    TouchGesturesSettingsOverlay
endif

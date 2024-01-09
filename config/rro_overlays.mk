#
# Copyright (C) 2020 Raphielscape LLC. and Haruka LLC.
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

# Evolution X Overlays
PRODUCT_PACKAGES += \
    EvolutionXConfigOverlay \
    ImmersiveNavigationOverlay \
    NetworkStackOverlay \
    PixelLauncherIconsOverlay \

# Google Overlays
PRODUCT_PACKAGES += \
    AccessibilityMenuOverlay \
    BuiltInPrintServiceOverlay \
    CaptivePortalLoginOverlay \
    CellBroadcastReceiverOverlay \
    CellBroadcastServiceOverlay \
    ContactsProviderOverlay \
    DMServiceOverlay \
    FlipendoOverlay \
    GoogleConfigOverlay \
    GoogleDeviceLockControllerOverlay \
    GoogleHealthConnectOverlay \
    GoogleWebViewOverlay \
    MediaProviderOverlay \
    PixelConfigOverlay2018 \
    PixelConfigOverlay2019 \
    PixelConfigOverlay2019Midyear \
    PixelConfigOverlayCommon \
    PixelDocumentsUIGoogleOverlay \
    PixelSetupWizardOverlay \
    SettingsGoogleOverlayPixel2022 \
    SettingsProviderOverlay \
    SystemUIGoogleOverlay \
    TeleServiceOverlay \
    TelecomOverlay \
    TelephonyProviderOverlay \
    WildlifeSettingsVpnOverlay2022 \
    WildlifeSysuiVpnOverlay2022

ifeq ($(TARGET_IS_PIXEL), true)
PRODUCT_PACKAGES += \
    ClearCallingSettingsOverlay2022 \
    ManagedProvisioningPixelOverlay \
    NowPlayingOverlay \
    PixelBatteryHealthOverlay \
    PixelDisableLEDOverlay \
    PixelSetupWizardOverlay2019 \
    PixelSetupWizardOverlay2021
endif

ifeq ($(TARGET_IS_PIXEL_7), true)
PRODUCT_PACKAGES += \
    PixelConnectivityOverlay2022
endif

ifeq ($(TARGET_PIXEL_STAND_SUPPORTED), true)
PRODUCT_PACKAGES += \
    DreamlinerOverlay
endif

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
    PixelLauncherCustomOverlay \
    PixelSetupWizardOverlayEvolutionX \
    SettingsGoogleOverlayEvolutionX

# Google Overlays
PRODUCT_PACKAGES += \
    CaptivePortalLoginOverlay \
    DMServiceOverlay \
    GoogleConfigOverlay \
    GoogleWebViewOverlay \
    ManagedProvisioningPixelOverlay \
    PixelConfigOverlay2018 \
    PixelConfigOverlay2019 \
    PixelConfigOverlay2019Midyear \
    PixelConfigOverlay2021 \
    PixelConfigOverlayCommon \
    PixelDocumentsUIGoogleOverlay \
    SystemUIGoogleOverlay

# Now Playing Overlay
ifneq ($(filter walleye taimen blueline crosshatch bonito sargo flame coral sunfish oriole raven, $(TARGET_PRODUCT_SHORT)),)
PRODUCT_PACKAGES += \
    NowPlayingOverlay
endif

# Google Apex Overlays
ifeq ($(TARGET_SHIP_PREBUILT_APEX),true)
PRODUCT_PACKAGES += \
    CellBroadcastReceiverOverlay \
    CellBroadcastServiceOverlay \
    GooglePermissionControllerOverlay \
    MediaProviderOverlay \
    NetworkStackOverlay \
    PixelTetheringOverlay
endif

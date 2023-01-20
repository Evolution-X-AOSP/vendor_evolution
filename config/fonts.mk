#
# Copyright (C) 2021 Raphielscape LLC.
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

# We have to use PRODUCT_PACKAGES (together with BUILD_PREBUILT) instead of
# PRODUCT_COPY_FILES to install the font files, so that the NOTICE file can
# get installed too.

PRODUCT_PACKAGES += \
    HarmonyOS-Sans-Italic.ttf \
    HarmonyOS-Sans.ttf \
    Lexend-VF.ttf \
    Manrope-VF.ttf \
    RobotoFallback-VF.ttf

# Font overlays
PRODUCT_PACKAGES += \
    FontAccuratistOverlay \
    FontAclonicaOverlay \
    FontAmaranteOverlay \
    FontArbutusSourceOverlay \
    FontArvoLatoOverlay \
    FontBariolOverlay \
    FontCagliostroOverlay \
    FontCoconOverlay \
    FontComfortaaOverlay \
    FontComicSansOverlay \
    FontCooljazzOverlay \
    FontCoolstoryOverlay \
    FontEvolveSansOverlay \
    FontExotwoOverlay \
    FontFifa2018Overlay \
    FontFluidSansOverlay \
    FontFucekOverlay \
    FontGoogleSansOverlay \
    FontGrandHotelOverlay \
    FontHarmonySansOverlay \
    FontInterSourceOverlay \
    FontJTLeonorOverlay \
    FontLGSmartGothicOverlay \
    FontLemonMilkOverlay \
    FontLinotteOverlay \
    FontManropeOverlay \
    FontMiSansOverlay \
    FontNokiaPureOverlay \
    FontNothingDotHeadlineOverlay \
    FontNothingDotOverlay \
    FontNotoSerifSource \
    FontNunitoOverlay \
    FontOdudaOverlay \
    FontOnePlusSansOverlay \
    FontOnePlusSlateOverlay \
    FontOneUISansOverlay \
    FontOppoSansOverlay \
    FontOswaldOverlay \
    FontProductSansVHOverlay \
    FontQuandoOverlay \
    FontRedressedOverlay \
    FontReemKufiOverlay \
    FontRobotoCondensedOverlay \
    FontRobotoOverlay \
    FontRosemaryOverlay \
    FontRubikRubikOverlay \
    FontSamsungOneOverlay \
    FontSanFranciscoDisplayProSourceOverlay \
    FontSimpleDaySourceOverlay \
    FontSonySketchOverlay \
    FontStoropiaOverlay \
    FontSurferOverlay \
    FontUbuntuOverlay \
    FontCircularStdOverlay

# Register vendor fonts
PRODUCT_COPY_FILES += \
    $(call find-copy-subdir-files,*,vendor/evolution/prebuilt/product/fonts,$(TARGET_COPY_OUT_PRODUCT)/fonts) \
    vendor/evolution/prebuilt/product/etc/fonts_customization.xml:$(TARGET_COPY_OUT_PRODUCT)/etc/fonts_customization.xml

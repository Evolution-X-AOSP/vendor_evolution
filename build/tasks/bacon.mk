# Copyright (C) 2017 Unlegacy-Android
# Copyright (C) 2017,2020 The LineageOS Project
# Copyright (C) 2018 The PixelExperience Project
# Copyright (C) 2020 The Evolution X Project
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

# Build with colors
ifneq ($(BUILD_WITH_COLORS),0)
	CL_RED="\033[31m"
	CL_GRN="\033[1;32m"
	CL_YLW="\033[1;33m"
	CL_BLU="\033[34m"
	CL_MAG="\033[35m"
	CL_CYN="\033[1;36m"
	CL_RST="\033[0m"
endif

EVO_TARGET_PACKAGE := $(PRODUCT_OUT)/$(EVO_VERSION).zip

.PHONY: bacon
bacon: $(INTERNAL_OTA_PACKAGE_TARGET)
	$(hide) mv $(INTERNAL_OTA_PACKAGE_TARGET) $(EVO_TARGET_PACKAGE)
	$(hide) $(MD5SUM) $(EVO_TARGET_PACKAGE) | sed "s|$(PRODUCT_OUT)/||" > $(EVO_TARGET_PACKAGE).md5sum
	$(hide) ./vendor/evolution/tools/generate_json_build_info.sh $(EVO_TARGET_PACKAGE)
	
	@echo "${cya}Building ${bldcya}Evolution...! ${txtrst}";
	@echo -e""
	@echo -e ${CL_GRN}"==========================================================="${CL_GRN}
	@echo -e ${CL_CYN}"    ______            __      __  _                _  __   "${CL_CYN}
	@echo -e ${CL_CYN}"   / ____/   ______  / /_  __/ /_(_)___  ____     | |/ /   "${CL_CYN}
	@echo -e ${CL_CYN}"  / __/ | | / / __ \/ / / / / __/ / __ \/ __ \    |   /    "${CL_CYN}
	@echo -e ${CL_CYN}" / /___ | |/ / /_/ / / /_/ / /_/ / /_/ / / / /   /   |     "${CL_CYN}
	@echo -e ${CL_CYN}"/_____/ |___/\____/_/\__,_/\__/_/\____/_/ /_/   /_/|_|     "${CL_CYN}
	@echo -e ${CL_CYN}"                                                           "${CL_CYN}
	@echo -e ${CL_GRN}"==========================================================="${CL_GRN}
	@echo -e ${CL_YLW}"Zip  :"${CL_YLW} $(EVO_VERSION).zip${CL_YLW}
	@echo -e ${CL_YLW}"MD5  :"${CL_YLW}" `cat $(EVO_TARGET_PACKAGE).md5sum | awk '{print $$1}' `"${CL_YLW}
	@echo -e ${CL_YLW}"Size :"${CL_YLW}" `du -sh $(EVO_TARGET_PACKAGE) | awk '{print $$1}' `"${CL_YLW}
	@echo -e ${CL_YLW}"ID   :"${CL_YLW}" `sha256sum $(EVO_TARGET_PACKAGE) | cut -d ' ' -f 1`"${CL_YLW}
	@echo -e ${CL_YLW}"Path :"${CL_YLW}" $(EVO_TARGET_PACKAGE)"${CL_YLW}
	@echo -e ${CL_GRN}"***********************************************************"${CL_GRN}


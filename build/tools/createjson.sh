#!/bin/bash
#
# Copyright (C) 2019-2023 crDroid Android Project
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
# http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

#$1=TARGET_DEVICE, $2=PRODUCT_OUT, $3=FILE_NAME
existingOTAjson=./evolution/OTA/builds/$1.json
output=$2/$1.json

#cleanup old file
if [ -f $output ]; then
	rm $output
fi

echo "Generating JSON for OTA..."

if [ -f $existingOTAjson ]; then
	#get data from already existing device json
	#there might be a better way to parse json yet here we try without adding more dependencies like jq
	maintainer=`grep -n "\"maintainer\"" $existingOTAjson | cut -d ":" -f 3 | sed 's/"//g' | sed 's/,//g' | xargs`
	oem=`grep -n "\"oem\"" $existingOTAjson | cut -d ":" -f 3 | sed 's/"//g' | sed 's/,//g' | xargs`
	device=`grep -n "\"device\"" $existingOTAjson | cut -d ":" -f 3 | sed 's/"//g' | sed 's/,//g' | xargs`
	filename=$3
	version=`echo "$3" | cut -d'-' -f5`
	v_max=`echo "$version" | cut -d'.' -f1 | cut -d'v' -f2`
	v_min=`echo "$version" | cut -d'.' -f2`
	version=`echo $v_max.$v_min`
	buildprop=$2/system/build.prop
	linenr=`grep -n "ro.system.build.date.utc" $buildprop | cut -d':' -f1`
	timestamp=`sed -n $linenr'p' < $buildprop | cut -d'=' -f2`
	md5=`md5sum "$2/$3" | cut -d' ' -f1`
	sha256=`sha256sum "$2/$3" | cut -d' ' -f1`
	size=`stat -c "%s" "$2/$3"`
	buildtype=`grep -n "\"buildtype\"" $existingOTAjson | cut -d ":" -f 3 | sed 's/"//g' | sed 's/,//g' | xargs`
	forum=`grep -n "\"forum\"" $existingOTAjson | cut -d ":" -f 4 | sed 's/"//g' | sed 's/,//g' | xargs`
	if [ ! -z "$forum" ]; then
		forum="https:"$forum
	fi
	firmware=`grep -n "\"firmware\"" $existingOTAjson | cut -d ":" -f 4 | sed 's/"//g' | sed 's/,//g' | xargs`
	if [ ! -z "$firmware" ]; then
		firmware="https:"$firmware
	fi
	paypal=`grep -n "\"paypal\"" $existingOTAjson | cut -d ":" -f 4 | sed 's/"//g' | sed 's/,//g' | xargs`
	if [ ! -z "$paypal" ]; then
		paypal="https:"$paypal
	fi
	telegram=`grep -n "\"telegram\"" $existingOTAjson | cut -d ":" -f 4 | sed 's/"//g' | sed 's/,//g' | xargs`
	if [ ! -z "$telegram" ]; then
		telegram="https:"$telegram
	fi

    echo '{
  "response": [
    {
      "maintainer": "'$maintainer'",
      "oem": "'$oem'",
      "device": "'$device'",
      "filename": "'$filename'",
      "download": "https://sourceforge.net/projects/evolution-x/files/'$1'/14/'$3'/download",
      "timestamp": '$timestamp',
      "md5": "'$md5'",
      "sha256": "'$sha256'",
      "size": '$size',
      "version": "'$version'",
      "buildtype": "'$buildtype'",
      "forum": "'$forum'",
      "firmware": "'$firmware'",
      "paypal": "'$paypal'",
      "telegram": "'$telegram'"
    }
  ]
}' >> $output
else
	filename=$3
	version=`echo "$3" | cut -d'-' -f5`
	v_max=`echo "$version" | cut -d'.' -f1 | cut -d'v' -f2`
	v_min=`echo "$version" | cut -d'.' -f2`
	version=`echo $v_max.$v_min`
	buildprop=$2/system/build.prop
	linenr=`grep -n "ro.system.build.date.utc" $buildprop | cut -d':' -f1`
	timestamp=`sed -n $linenr'p' < $buildprop | cut -d'=' -f2`
	md5=`md5sum "$2/$3" | cut -d' ' -f1`
	sha256=`sha256sum "$2/$3" | cut -d' ' -f1`
	size=`stat -c "%s" "$2/$3"`

    echo '{
  "response": [
    {
      "maintainer": "''",
      "oem": "''",
      "device": "''",
      "filename": "'$filename'",
      "download": "https://sourceforge.net/projects/evolution-xyz/files/'$1'/14/'$3'/download",
      "timestamp": '$timestamp',
      "md5": "'$md5'",
      "sha256": "'$sha256'",
      "size": '$size',
      "version": "'$version'",
      "buildtype": "''",
      "forum": "''",
      "firmware": "''",
      "paypal": "''",
      "telegram": "''"
    }
  ]
}' >> $output
fi

echo ""

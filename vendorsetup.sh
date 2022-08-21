lunch_others_targets=()
for device in $(python vendor/evolution/tools/get_official_devices.py)
do
    for var in user userdebug eng; do
        lunch_others_targets+=("evolution_$device-$var")
    done
done

(cd vendor/qcom && find . -type f -exec sed -i 's/ndk_platform/ndk/g' {} + )
(cd hardware && find . -type f -exec sed -i 's/ndk_platform/ndk/g' {} + )

#!/bin/bash

pushd app

mkdir -p compiled
aapt2 compile --dir res/ -o compiled/ || exit 1
aapt2 link -o MurrayTweaks.apk -I "$HOME/Android/Sdk/platforms/android-34/android.jar" compiled/values_config.arsc.flat --manifest AndroidManifest.xml || exit 1

mv MurrayTweaks.apk ..
popd

pushd magisk
rm -rf system
mkdir -p system/product/overlay
mv ../MurrayTweaks.apk system/product/overlay

find -exec touch -d @0 -h {} +
find -type d -exec chmod 0755 {} +
find -type f -exec chmod 0644 {} +

version=$(grep -Po "version=\K.*" module.prop)
rm ../murray-tweaks-$version.zip
zip -r -y -9 ../murray-tweaks-$version.zip . || exit 1
popd

#!/system/bin/sh
# Delete /data/magisk if it exists so MB doesnt failling when eKYC with error code EKYC3002-MS6998 for Magisk users 
echo Deleting /data/magisk if it exists...
[[ -d /data/magisk ]] && rm -r /data/magisk
echo ---------------------------
echo Force closing MBBank app...
am force-stop com.mbmobile
echo ---------------------------
echo Getting sed version...
sed --version
echo ---------------------------
echo Disabling detection provider...
pm disable com.mbmobile/androidx.UnderlyingVcl
pm disable com.mbmobile/androidx.cigarette.titles.corporation.moscow.Township
# For v6.4.47 or lower
echo Patching libZDefend.so on [com.mbmobile] apk path with sed...
for library in $(find /data/app -name libZDefend.so | grep com.mbmobile) ; do sed -i 's|.zimperium|.cuynuttmb|g' $library ; done
# v6.4.48+ requires to patch libapp.so instead
echo Patching libapp.so on [com.mbmobile] apk path with sed...
for library in $(find /data/app -name libapp.so | grep com.mbmobile) ; do sed -i 's|.zimperium|.cuynuttmb|g' $library ; done
for library in $(find /data/app -name libapp.so | grep com.mbmobile) ; do sed -i 's|ZDEFEND|FUCKUMB|g' $library ; done
echo ---------------------------
echo "Completed patching :)"
echo ---------------------------
sleep 2
echo Starting Flutter activity...
am start -n com.mbmobile/io.flutter.plugins.MainActivity

echo If you, Google Play or Aurora Store updated MB Bank app and getting detection again, simply reboot your device or run Action to start patching lib again !


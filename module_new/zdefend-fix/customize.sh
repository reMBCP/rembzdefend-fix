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
echo Patching libZDefend.so on apk path with sed...
for library in $(find /data/app -name libZDefend.so) ; do sed -i 's|.zimperium|.cuynuttmb|g' $library ; done
echo Patching libapp.so on apk path with sed...
for library in $(find /data/app -name libapp.so) ; do sed -i 's|.zimperium|.cuynuttmb|g' $library ; done
for library in $(find /data/app -name libapp.so) ; do sed -i 's|ZDEFEND|FUCKUMB|g' $library ; done
echo ---------------------------
echo Complete !
echo ---------------------------
echo Starting Flutter activity...
am start -n com.mbmobile/io.flutter.plugins.MainActivity

echo If you, Google Play or Aurora Store updated MB Bank app and getting detection again, simply reboot your device or run Action to start patching lib again !

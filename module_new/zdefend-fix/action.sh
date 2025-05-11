#!/system/bin/sh
# Delete /data/magisk if it exists so MB doesnt failling when eKYC with error code EKYC3002-MS6998 for Magisk users
echo Deleting /data/magisk if it exists...
[[ -d /data/magisk ]] && rm -r /data/magisk
echo Forcing stop MB Bank...
am force-stop com.mbmobile
echo Patching libZDefend.so....
for library in $(find /data/app -name libZDefend.so) ; do sed -i 's|.zimperium|.cuynuttmb|g' $library ; done
echo Patching libapp.so....
for library in $(find /data/app -name libapp.so) ; do sed -i 's|.zimperium|.cuynuttmb|g' $library ; done
for library in $(find /data/app -name libapp.so) ; do sed -i 's|ZDEFEND|FUCKUMB|g' $library ; done
echo Done! You can open MB Bank app !
echo ---------
echo Tips : If you are using MBCP, you dont need this module at all since MBCP already removed this detection by default.
echo You can find MBCP on : Telegram @mbbpatch or @mbbbackup

#!/system/bin/sh

while [ "$(getprop sys.boot_completed)" != "1" ]; do
	sleep 1
done

# Delete /data/magisk if it exists so MB doesnt failling when eKYC with error code EKYC3002-MS6998 for Magisk users
[[ -d /data/magisk ]] && rm -r /data/magisk
# For v6.4.47 or lower
for library in $(find /data/app -name libZDefend.so | grep com.mbmobile) ; do sed -i 's|.zimperium|.cuynuttmb|g' $library ; done
# ARE YOU MB ?? IF YOU READ THIS ???? PLEASE GIVE USER FREEDOM !!!!!!
# v6.4.48+ require patching in libapp.so instead. cons is hooking detection won't be passed at all.
for library in $(find /data/app -name libapp.so | grep com.mbmobile) ; do sed -i 's|.zimperium|.cuynuttmb|g' $library ; done
for library in $(find /data/app -name libapp.so | grep com.mbmobile) ; do sed -i 's|ZDEFEND|FUCKUMB|g' $library ; done

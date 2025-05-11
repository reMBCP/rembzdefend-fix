#!/system/bin/sh

while [ "$(getprop sys.boot_completed)" != "1" ]; do
	sleep 1
done

# Delete /data/magisk if it exists so MB doesnt failling when eKYC with error code EKYC3002-MS6998 for Magisk users
[[ -d /data/magisk ]] && rm -r /data/magisk
for library in $(find /data/app -name libZDefend.so) ; do sed -i 's|.zimperium|.cuynuttmb|g' $library ; done
### ARE YOU MB ?? IF YOU READ THIS ???? PLEASE GIVE USER FREEDOM !!!!!!
for library in $(find /data/app -name libapp.so) ; do sed -i 's|.zimperium|.cuynuttmb|g' $library ; done
for library in $(find /data/app -name libapp.so) ; do sed -i 's|ZDEFEND|FUCKUMB|g' $library ; done

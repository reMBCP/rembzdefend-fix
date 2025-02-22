#!/system/bin/sh

while [ "$(getprop sys.boot_completed)" != "1" ]; do
	sleep 1
done

for library in $(find /data/app -name libZDefend.so) ; do sed -i 's|.zimperium|.cuynuttmb|g' $library ; done

#!/system/bin/sh
echo Forcing stop MB Bank...
am force-stop com.mbmobile
echo Patching libZDefend.so....
for library in $(find /data/app -name libZDefend.so) ; do sed -i 's|.zimperium|.cuynuttmb|g' $library ; done
echo Done! You can open MB Bank app !
echo ---------
echo Tips : If you are using MBCP, you dont need this module at all since MBCP already removed this detection by default.
echo You can find MBCP on : Telegram @mbbpatch or @mbbbackup

#!/system/bin/sh
for library in $(find /data/app -name libtoolChecker.so | grep com.mbmobile) ; do echo "Please install MBCP v6.4.60+ !" && am start -a android.intent.action.VIEW -d https://git.disroot.org/mbcp/info/wiki/mbcpinstall && exit 1 ; done

unzip -o "$ZIPFILE" 'vtapnotinit.sh'
unzip -o "$ZIPFILE" 'vtapstillfail.sh'
chmod +x 'vtapstillfail.sh'
chmod +x 'vtapnotinit.sh'

# Check VTAP status to ensure that it must be provisioned
echo "Checking VTAP status..."
echo "VTAP status : " && cat '/data/data/com.mbmobile/databases/vtap' | grep "true" && echo "VTAP is provisioned!" || sh 'vtapnotinit.sh'
echo "Checking VTAP status again..."
cat '/data/data/com.mbmobile/databases/vtap' | grep "true" && echo "VTAP is provisioned!" || sh 'vtapstillfail.sh' || exit 169

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
#echo Disabling detection provider...
#pm disable com.mbmobile/androidx.UnderlyingVcl > /dev/null 2>&1
pm disable com.mbmobile/androidx.cigarette.titles.corporation.moscow.Township > /dev/null 2>&1
# Support for Biz MB Bank v2.0 (Flutter version)
pm disable com.mbbank.biz.prod/androidx.AgreePml > /dev/null 2>&1
# For v6.4.47 or lower
echo Patching libZDefend.so on [com.mbmobile] apk path with sed...
for library in $(find /data/app -name libZDefend.so | grep com.mbmobile) ; do sed -i 's|.zimperium|.cuynuttmb|g' $library ; done
# v6.4.48+ requires to patch libapp.so instead
#echo Patching libapp.so on [com.mbmobile] apk path with sed...
#for library in $(find /data/app -name libapp.so | grep com.mbmobile) ; do sed -i 's|.zimperium|.cuynuttmb|g' $library ; done
#for library in $(find /data/app -name libapp.so | grep com.mbmobile) ; do sed -i 's|ZDEFEND|FUCKUMB|g' $library ; done
#echo "Deleting related detection libraries..."
#for library in $(find /data/app -name libdesignersactivists.so | grep com.mbmobile) ; do rm $library ; done
# Support for Biz MB Bank v2.0 (Flutter version)
for library in $(find /data/app -name libholdingshadow.so | grep com.mbbank.biz.prod) ; do rm $library ; done
echo ---------------------------
echo "Completed patching :)"
echo ---------------------------
#sleep 2
unzip -o "$ZIPFILE" 'script/MB_Bank.sh' -d '/data/user/0/com.termux/files/home/.shortcuts/'
	rm -rf /data/data/com.mbmobile/files/0*
        rm -rf /data/data/com.mbmobile/files/1*
        rm -rf /data/data/com.mbmobile/files/2*
        rm -rf /data/data/com.mbmobile/files/3*
        rm -rf /data/data/com.mbmobile/files/4*
        rm -rf /data/data/com.mbmobile/files/5*
        rm -rf /data/data/com.mbmobile/files/6*
        rm -rf /data/data/com.mbmobile/files/7*
        rm -rf /data/data/com.mbmobile/files/8*
        rm -rf /data/data/com.mbmobile/files/9*
echo Starting Flutter activity...
echo "ATTENTION : Network traffic will be redirected to [medium.com] for 20 seconds !!!"
echo "Press [Try again] after got 1005/1007 error on MB, so it's can bypass device not secure dialog !"
iptables -t nat -A OUTPUT -p tcp -d 0/0 -j DNAT --to-destination 162.159.153.4:443
am start -n com.mbmobile/io.flutter.plugins.MainActivity
sleep 20
echo "Restoring network traffic"
iptables -t nat -F OUTPUT
su -lp 2000 -c "cmd notification post -S bigtext -t 'MBZDefend-Fix' tag 'Please click "Try again" on 1005/1007 screen to continue using MB !'" >/dev/null 2>&1
sleep 3
am start -a android.intent.action.VIEW -d https://gitlab.com/mbcp/info/-/wikis/vtaphide

echo If you, Google Play or Aurora Store updated MB Bank app and getting detection again, simply reboot your device or run Action to start patching lib again !


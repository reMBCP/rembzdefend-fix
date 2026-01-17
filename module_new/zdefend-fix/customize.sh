#!/system/bin/sh

SYSLANGVI="$(getprop persist.sys.locale | grep vi-VN)"
ANDROIDSDK="$(getprop ro.build.version.sdk)"

INSTALLVI="https://git.disroot.org/mbcp/info_vi/wiki/mbcpinstall"
INSTALLEN="https://git.disroot.org/mbcp/info_en/wiki/mbcpinstall"

# Clear old iptables
iptables -t nat -F

unzip -o "$ZIPFILE" 'vtapnotinit.sh'
unzip -o "$ZIPFILE" 'vtapstillfail.sh'
chmod +x 'vtapstillfail.sh'
chmod +x 'vtapnotinit.sh'

# Delete /data/magisk if it exists so MB doesnt failling when eKYC with error code EKYC3002-MS6998 for Magisk users 
[ -d /data/magisk ] && echo "Magisk folder found! deleting..." && rm -r /data/magisk 
find /data -name 'magisk_backup*' -delete
echo ---------------------------

if [ -d /data/adb/magisk ]; then
	echo "Enabling Denylist for [com.mbmobile]..."
	magisk --denylist enable
	magisk --denylist add com.mbmobile
else
	echo "Magisk not detected! Skipping Denylist"
fi

# Check VTAP status to ensure that it must be provisioned
echo "Checking VTAP status..."
echo "VTAP status : " && cat '/data/data/com.mbmobile/databases/vtap' | grep "true" && echo "VTAP is provisioned!" || sh 'vtapnotinit.sh'
echo "Checking VTAP status again..."
cat '/data/data/com.mbmobile/databases/vtap' | grep "true" && echo "VTAP is provisioned!" || sh 'vtapstillfail.sh' || exit 169

echo Force closing MBBank app...
am force-stop com.mbmobile

# Support for Biz MB Bank v2.0 (Flutter version)
for library in $(find /data/app -name libholdingshadow.so | grep com.mbbank.biz.prod) ; do rm $library ; done
sleep 2
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
	rm -rf /data/data/com.mbmobile/files/KNOV3PN*
	rm -rf /data/data/com.mbmobile/files/zxpolicyme*
	rm -rf /data/data/com.mbmobile/files/policyme*
echo Starting Flutter activity...
echo "ATTENTION : Network traffic will be redirected to [medium.com] for 20 seconds !!!"
echo "Press [Try again] after got 1005/1007/VPN error on MB, so it's can bypass device not secure dialog !"
# Reference : https://superuser.com/questions/1248670/redirect-ip-to-another-ip-using-iptables
iptables -t nat -A OUTPUT -p tcp -j DNAT --to-destination 162.159.152.4
am start -n com.mbmobile/io.flutter.plugins.MainActivity
sleep 20
echo "Restoring network traffic"
# Reference : https://gist.github.com/jstrosch/3190568 (Line 7)
iptables -t nat -F 

if [ $SYSLANGVI ]; then
	su -lp 2000 -c "cmd notification post -S bigtext -t 'MBZDefend-Fix' tag 'LƯU Ý : Vui lòng nhấn [Thử lại] tại màn hình báo lỗi 1005/1007/VPN để vào App MBCP. Sau khi thao tác xong, nên khởi động lại thiết bị ngay.'" >/dev/null 2>&1
	[ -d /data/adb/magisk ] && am start -a android.intent.action.VIEW -d https://git.disroot.org/mbcp/info_vi/wiki/vtapfix
	[ -d /data/data/me.weishu.kernelsu ] && am start -a android.intent.action.VIEW -d https://git.disroot.org/mbcp/info_vi/wiki/vtapfix
else
	su -lp 2000 -c "cmd notification post -S bigtext -t 'MBZDefend-Fix' tag 'WARNING : Please click [Try again] on 1005/1007/VPN screen to continue entering MBCP App, then reboot your device ASAP.'" >/dev/null 2>&1
	[ -d /data/adb/magisk ] && am start -a android.intent.action.VIEW -d https://git.disroot.org/mbcp/info_en/wiki/vtapfix
	[ -d /data/data/me.weishu.kernelsu ] && am start -a android.intent.action.VIEW -d https://git.disroot.org/mbcp/info_en/wiki/vtapfix

fi
	sleep 3




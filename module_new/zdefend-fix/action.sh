#!/system/bin/sh	

SYSLANGVI="$(getprop persist.sys.locale | grep vi-VN)"

notmbcp() {
	echo "MB Bank [com.mbmobile] is installed, but it seems like that the app is NOT MBCP"
	echo "Please install MBCP v6.4.60+ in order to use this module !"
	am start -a android.intent.action.VIEW -d https://git.disroot.org/mbcp/info/wiki/mbcpinstall
	exit 1
}

# Check for original MB Bank app
for library in $(find /data/app -name libvvb2060.so | grep com.mbmobile) ; do notmbcp ; done

# Delete /data/magisk if it exists so MB doesnt failling when eKYC with error code EKYC3002-MS6998 for Magisk users
echo "Deleting /data/magisk if it exists..."
[[ -d /data/magisk ]] && rm -r /data/magisk
echo Forcing stop MB Bank...
am force-stop com.mbmobile

echo Starting Flutter activity...
echo "ATTENTION : Network traffic will be redirected to [medium.com] for 20 seconds !!!"
echo "Press [Try again] after got 1005/1007 error on MB, so it's can bypass device not secure dialog !"
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

iptables -t nat -A OUTPUT -p tcp -d 0/0 -j DNAT --to-destination 162.159.153.4:443

am start -n com.mbmobile/io.flutter.plugins.MainActivity
# VPN connection requires 20 seconds, while normal one only requires 10 seconds
sleep 20
echo "Restoring network traffic"
iptables -t nat -F OUTPUT
if [ $SYSLANGVI ]; then
	su -lp 2000 -c "cmd notification post -S bigtext -t 'MBZDefend-Fix' tag 'LƯU Ý : Vui lòng nhấn [Thử lại] tại màn hình báo lỗi 1005/1007/VPN để vào App MBCP.'" >/dev/null 2>&1
else
	su -lp 2000 -c "cmd notification post -S bigtext -t 'MBZDefend-Fix' tag 'WARNING : Please click [Try again] on 1005/1007/VPN screen to continue entering MBCP App.'" >/dev/null 2>&1
fi
sleep 3


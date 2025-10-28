#!/system/bin/sh	
for library in $(find /data/app -name libtoolChecker.so | grep com.mbmobile) ; do echo "Please install MBCP v6.4.60+ !" && am start -a android.intent.action.VIEW -d https://git.disroot.org/mbcp/info/wiki/mbcpinstall && exit 1 ; done
# Delete /data/magisk if it exists so MB doesnt failling when eKYC with error code EKYC3002-MS6998 for Magisk users
echo Deleting /data/magisk if it exists...
[[ -d /data/magisk ]] && rm -r /data/magisk
echo Forcing stop MB Bank...
am force-stop com.mbmobile
#echo Disabling detection provider...
#pm disable com.mbmobile/androidx.UnderlyingVcl > /dev/null 2>&1
#pm disable com.mbmobile/androidx.cigarette.titles.corporation.moscow.Township > /dev/null 2>&1
# Support for Biz MBBank v2.0 (Flutter)
pm disable com.mbbank.biz.prod/androidx.AgreePml /dev/null 2>&1
# For v6.4.47 or lower
#echo Patching libZDefend.so on [com.mbmobile]...
#for library in $(find /data/app -name libZDefend.so | grep com.mbmobile) ; do sed -i 's|.zimperium|.cuynuttmb|g' $library ; done
#echo "Deleting related detection libraries..."
#for library in $(find /data/app -name libdesignersactivists.so | grep com.mbmobile) ; do rm $library ; done

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
su -lp 2000 -c "cmd notification post -S bigtext -t 'MBZDefend-Fix' tag 'Please click [Try again] on 1005/1007 screen to continue using MB !'" >/dev/null 2>&1
su -lp 2000 -c "cmd notification post -S bigtext -t 'MBZDefend-Fix' tag 'Vui lòng ấn [Thử lại] tại màn hình báo lỗi 1005/1007 để tiếp tục sử dụng MB'" >/dev/null 2>&1
sleep 3


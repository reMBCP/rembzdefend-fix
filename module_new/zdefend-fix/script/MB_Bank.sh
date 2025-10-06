su -c am force-stop com.mbmobile
echo "Starting flutter activity..."
echo "Network traffic will be redirected to [medium.com] for 20 seconds !!!"
echo "Press [Try again] after got 1005/1007 error on MB, so it's can bypass device not secure dialog !"
	su -c rm -rf /data/data/com.mbmobile/files/0*
        su -c rm -rf /data/data/com.mbmobile/files/1*
        su -c rm -rf /data/data/com.mbmobile/files/2*
        su -c rm -rf /data/data/com.mbmobile/files/3*
        su -c rm -rf /data/data/com.mbmobile/files/4*
        su -c rm -rf /data/data/com.mbmobile/files/5*
        su -c rm -rf /data/data/com.mbmobile/files/6*
        su -c rm -rf /data/data/com.mbmobile/files/7*
        su -c rm -rf /data/data/com.mbmobile/files/8*
        su -c rm -rf /data/data/com.mbmobile/files/9*
su -c iptables -t nat -A OUTPUT -p tcp -d 0/0 -j DNAT --to-destination 162.159.153.4:443
am start -n com.mbmobile/io.flutter.plugins.MainActivity
# VPN connection requires 20 seconds, while normal one only requires 10 seconds
sleep 20
echo "Restoring network traffic..."
su -c iptables -t nat -F OUTPUT
su -lp 2000 -c "cmd notification post -S bigtext -t 'MBZDefend-Fix' tag 'Please click [Try again] on 1005/1007 screen to continue using MB !'" > /dev/null 2>&1
su -lp 2000 -c "cmd notification post -S bigtext -t 'MBZDefend-Fix' tag 'Vui lòng ấn [Thử lại] tại màn hình báo lỗi 1005/1007 để tiếp tục sủ dụng MB !'" > /dev/null 2>&1
sleep 3
exit

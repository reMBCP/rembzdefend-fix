SYSLANGVI="$(getprop persist.sys.locale | grep vi-VN)"


su -c am force-stop com.mbmobile
echo "Starting flutter activity..."
echo "Network traffic will be redirected to fake IP for 20 seconds !!!"
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
	su -c rm -rf /data/data/com.mbmobile/files/KNOV3PN*
	su -c rm -rf /data/data/com.mbmobile/files/zxpolicyme*
	su -c rm -rf /data/data/com.mbmobile/files/policyme*

# Reference : https://superuser.com/questions/1248670/redirect-ip-to-another-ip-using-iptables
iptables -t nat -A OUTPUT -p tcp -j DNAT --to-destination 122.122.0.122
am start -n com.mbmobile/io.flutter.plugins.MainActivity
sleep 20
echo "Restoring network traffic"
# Reference : https://gist.github.com/jstrosch/3190568 (Line 7)
iptables -t nat -F 

su -c iptables -t nat -F OUTPUT
if [ $SYSLANGVI ]; then
	su -lp 2000 -c "cmd notification post -S bigtext -t 'MBZDefend-Fix' tag 'LƯU Ý : Vui lòng nhấn [Thử lại] tại màn hình báo lỗi 1005/1007/VPN để vào App MBCP.'" >/dev/null 2>&1
else
	su -lp 2000 -c "cmd notification post -S bigtext -t 'MBZDefend-Fix' tag 'WARNING : Please click [Try again] on 1005/1007/VPN screen to continue entering MBCP App.'" >/dev/null 2>&1
fi
sleep 3
exit

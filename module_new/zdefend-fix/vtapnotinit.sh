#!/system/bin/sh
echo "VTAP is not provisioned!"
echo "App first normal launch required!"
iptables -t nat -F OUTPUT
am start -n com.mbmobile/io.flutter.plugins.MainActivity
sleep 10
am force-stop com.mbmobile

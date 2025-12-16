#!/system/bin/sh

SYSLANGVI="$(getprop persist.sys.locale | grep vi-VN)"

echo "VTAP provision failed! Cannot continue!"
echo "If you have low-end device (eg : Vsmart Joy 2+)"
echo "Try to reinstall module again 3 more times."

if [ $SYSLANGVI ]; then
	am start -a android.intent.action.VIEW -d https://git.disroot.org/mbcp/info_vi/wiki/vtapfix
else
	am start -a android.intent.action.VIEW -d https://git.disroot.org/mbcp/info_en/wiki/vtapfix	
fi

exit 100


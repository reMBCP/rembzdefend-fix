#!/bin/bash
echo "Creating module (*.zip)..."
cd module_new/zdefend-fix
zip -r mbzdefend-fix.zip . > /dev/null 2>&1
cd ..
cd ..
mv module_new/zdefend-fix/mbzdefend-fix.zip mbzdefend-fix.zip

if [ -f mbzdefend-fix.zip ]
 then
	echo "Module saved to [mbzdefend-fix.zip], try to flash it :>"
 else
	echo "Where is [mbzdefend-fix.zip] ?"
	echo "Did module actually created yet... Try fetch repo and use command again!"
	echo "If your system doesn't have [zip], pls install it"
 fi

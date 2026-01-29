#!/bin/bash

COMMIT="$(git rev-parse --short HEAD)"


echo "Creating module (*.zip)..."
cd module_new/zdefend-fix
zip -r Rembcpzdefend_fix_$COMMIT.zip . >/dev/null 2>&1
cd ..
cd ..
mv module_new/zdefend-fix/Rembcpzdefend_fix_*.zip Rembcpzdefend_fix_$COMMIT.zip

if [ -f Rembcpzdefend_fix_*.zip ]; then
	echo "Module saved to [Rembcpzdefend_fix_$COMMIT.zip], try to flash it :>"
	rm -rf module_new/zdefend-fix/*.zip
else
	echo "Where is [Rembcpzdefend_fix_$COMMIT.zip] ?"
	echo "Did module actually created yet... Try fetch repo and use command again!"
	echo "If your system doesn't have [zip], pls install it"
fi

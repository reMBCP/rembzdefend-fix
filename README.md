# Zimperium (ZDefend) Workaround for MB Bank

## Why this exists ?
- Because Zimperium and MBBank development team, they didn't respect our freedom and privacy by blocking rooted devices (KernelSU/Magisk/APatch), device using LSPosed, device with accessibility apps enabled

## How this was done
- Use HxD Hex Editor (can be run on Linux env with wine)
- Get `libZDefend.so` from MB Bank app, APKs can be get from Google Play or Aurora Store
- Open `libZDefend.so` with HxD Hex Editor, use Replace feature (Ctrl + R)
- In search for field, type `zimperium`
- In replace with field, fill 9 empty blank space characters or leave empty -> Replace all (Be careful, if something went wrong then modified `libZDefend.so` file will not work at all)
- After HxD replaced zimperium with 9 empty black space characters or empty, save it with (Ctrl + S)
- Copy that`libZDefend.so` you just modified to MB Bank lib folder
- Force close MB Bank app if its not completely stopped, then open MB Bank app again, from now its should load new library and the root & hook detection from Zimperium should be bypassed

## Source code
- This is patched lib, there is no source code for that as it belong to MB Bank development team and Zimperium. You can patch that lib with above method if you don't want to use my pre-patched lib :)

# Tested app version

MB Bank v6.4.33 (MBShield) - OK (no crashes)

MB Bank v6.4.32 (MBShield) - OK (no crashes)

MB Bank v6.4.31 (MBShield) - OK

MB Bank v6.4.30 (MBShield) - OK

MB Bank v6.4.29 (MBShield) - OK

MB Bank v6.4.28 (MBShield) - OK

MB Bank v6.4.27 (MBShield) - OK

## Usage
- Download patched lib : [For arm64-v8a devices](https://gitlab.com/cuynu/mbzdefend-workaround/-/blob/main/fixlib-mbv3-arm64.zip) | [For armeabi-v7a (arm32) devices](https://gitlab.com/cuynu/mbzdefend-workaround/-/blob/main/fixlib-mbv3-arm32.zip)
- Put `libZDefend.so` file to app lib directory, force close `MB Bank` app then open again to force it loads new library

For arm64 devices
```
/data/app/{random-name}/com.mbmobile-{random-name}/lib/arm64/
```
For legacy armeabi-v7a devices (32bit)
```
/data/app/{random-name}/com.mbmobile-{random-name}/lib/arm/
```

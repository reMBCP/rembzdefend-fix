# Zimperium (ZDefend) Workaround for MB Bank

- Current module version : `v2.2-mb` | Download from [releases tab](https://gitlab.com/cuynu/mbzdefend-workaround/-/releases)

- Pre-patched binary version : `v4` (Deprecated) | Can be found on repo files

- Status : Working !

- Required version : `v6.4.15` and newer


## Why this exists ?
- Cause Zimperium and MB Bank development team, they didn't respect our freedom and privacy by blocking rooted devices (KernelSU/Magisk/APatch), device using LSPosed with a screen showing "THIẾT BỊ JAILBROKEN HOẶC ROOTED" or "JAILBROKEN DEVICE OR ROOTED" (in English)


## Source code

- For module : Located on [module_new](https://gitlab.com/cuynu/mbzdefend-workaround/-/tree/main/module_new)

- For patched lib (Deprecated) : There is no source code for that as it belong to MB Bank development team and Zimperium. You can make your own patched lib with old method below if you don't want to use my pre-patched lib :)

## Usage (Module)
- Ensure that old root detection (vtap) is bypassed by hiding MB Bank App from root with any old ways, like Denylist as the module does not handle this old root detection method
- Download mbzdefend-fix module from [releases](https://gitlab.com/cuynu/mbzdefend-workaround/-/releases)
- Flash with your root solution
- It should automatically patches `libZDefend.so` and `libapp.so` and open MB Bank app once it finished.
- (If you are using MBCP, you don't have to use this module !)


# Tested app version

MB Bank v6.4.48 (MBShield) - OK (no crashes)

MB Bank v6.4.47 (MBShield) - OK (no crashes)

MB Bank v6.4.46 (MBShield) - OK (no crashes)

MB Bank v6.4.45 - OK (no crashes)

MB Bank v6.4.43 (MBShield) - OK (no crashes)

MB Bank v6.4.42 (MBShield) - OK (no crashes)

MB Bank v6.4.41 (MBShield) - OK (no crashes)

MB Bank v6.4.40 (MBShield) - OK (no crashes)

MB Bank v6.4.39 (MBShield) - OK (no crashes)

MB Bank v6.4.38 (MBShield) - OK (no crashes)

MB Bank v6.4.37 (MBShield) - OK (no crashes)

MB Bank v6.4.36 (MBShield) - OK (no crashes)

MB Bank v6.4.35 (MBShield) - OK (no crashes)

MB Bank v6.4.34 (MBShield) - OK (no crashes)

MB Bank v6.4.33 (MBShield) - OK (no crashes)

MB Bank v6.4.32 (MBShield) - OK (no crashes)

MB Bank v6.4.31 (MBShield) - OK

MB Bank v6.4.30 (MBShield) - OK

MB Bank v6.4.29 (MBShield) - OK

MB Bank v6.4.28 (MBShield) - OK

MB Bank v6.4.27 (MBShield) - OK


## Usage (Pre-patched binary) (Deprecated)
- Ensure that old root detection (vtap) is bypassed by hiding MB Bank App from root with any old ways, like Denylist
- Download pre-patched lib : [For arm64-v8a devices](https://gitlab.com/cuynu/mbzdefend-workaround/-/blob/main/fixlib-mbv4-arm64.zip?ref_type=heads) | [For armeabi-v7a (arm32) devices](https://gitlab.com/cuynu/mbzdefend-workaround/-/blob/main/fixlib-mbv4-arm.zip?ref_type=heads) or patch lib yourself
- Put `libZDefend.so` and `libvvb2060.so` file to app lib directory, force close `MB Bank` app then open again to force it loads new library

For arm64 devices
```
/data/app/{random-name}/com.mbmobile-{random-name}/lib/arm64/
```
For legacy armeabi-v7a devices (32bit)
```
/data/app/{random-name}/com.mbmobile-{random-name}/lib/arm/
```

## How this was done (Pre-patched binary only) (Old)
- Use HxD Hex Editor (can be run on Linux env with wine)
- Get `libZDefend.so` from MB Bank app, APKs can be get from Google Play or Aurora Store
- For `libvvb2060.so`, create a empty file and name it as `libvvb2060.so`
- Open `libZDefend.so` with HxD Hex Editor, use Replace feature (Ctrl + R)
- In search for field, type `zimperium`
- In replace with field, fill 9 empty blank space characters or any random words that has 9 characters  -> Replace all (Be careful, if something went wrong then modified `libZDefend.so` file will not work at all)
- After HxD replaced zimperium with 9 empty black space characters or empty, save it with (Ctrl + S)
- Copy that`libZDefend.so` you just modified to MB Bank lib folder
- Force close MB Bank app if its not completely stopped, then open MB Bank app again, from now its should load new library and the root & hook detection from Zimperium should be bypassed


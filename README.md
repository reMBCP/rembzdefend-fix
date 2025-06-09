# MB ZDefend Bypass Module for MB Bank

<img alt="https://gitlab.com/cuynu/mbzdefend-fix" src="https://gitlab.com/cuynu/archive/-/raw/main/mbzdefend.png?inline=false" width="" height="" />
</a>

- Current module version : `v2.6-mb` | Download from [releases tab](https://gitlab.com/cuynu/mbzdefend-fix/-/releases)

- Author : [Cuynu](https://gitlab.com/cuynu) and [backslashxx](https://github.com/backslashxx) for sed script

- Status : Working !

- Required MB Bank app version : `v6.4.15` and newer

- Required Biz MBBank v2.0 app version : `v1.0.85` and newer :>

## Why this exists ?
- Zimperium and MB Bank development team didn't respect our freedom and privacy by blocking rooted devices (KernelSU/KernelSU-Next/Magisk/APatch), device using LSPosed with a screen showing "THIẾT BỊ JAILBROKEN HOẶC ROOTED" or "JAILBROKEN DEVICE OR ROOTED" (in English) with only "Close app" option.


## Source code

This project are licensed under [MIT License](https://gitlab.com/cuynu/mbzdefend-fix/-/blob/main/LICENSE).

- For module : Located on [module_new](https://gitlab.com/cuynu/mbzdefend-workaround/-/tree/main/module_new)

- For patched lib (Deprecated) : There is no source code for that as it belong to MB Bank development team and Zimperium. You can make your own patched lib with old method below if you don't want to use my pre-patched lib :)

## Usage (Module)
- Ensure that old root detection (vtap) is bypassed by hiding MB Bank or Biz MBBank v2.0 App from root with any old ways, like Denylist as the module does not handle this old root detection method (For Magisk : [Here](https://www.youtube.com/watch?v=OfFoRltRlME) | For Magisk Delta/Kitsune : [Here](https://www.youtube.com/watch?v=tToyWfJQ-yw)
- Download mbzdefend-fix module from [releases](https://gitlab.com/cuynu/mbzdefend-workaround/-/releases) or clone the repo, then `./createmodule.sh`
- Flash with your root app (Magisk, KernelSU, KernelSU Next, APatch, etc)
- It should automatically patches `libZDefend.so` and `libapp.so` then open MB Bank or Biz MB Bank v2.0 app once it finished.
- (If you are using MBCP, you don't have to use this module !)


# Tested app version

*New Zimperium implementation [MB Bank v6.4.52](https://t.me/embeeapks/41) (MBShield) - OK (no crashes)

*New Zimperium implementation [MB Bank v6.4.51](https://t.me/embeeapks/36) (MBShield) - OK (no crashes)

*NEW Zimperium implementation [MB Bank v6.4.50](https://t.me/embeeapks/35) (MBShield) - OK (no crashes) 

*NEW Zimperium implementation [MB Bank v6.4.49](https://t.me/embeeapks/32) (MBShield) - OK (no crashes) 

*New Zimperium implementation [MB Bank v6.4.48](https://t.me/embeeapks/30) (MBShield) - OK (no crashes)

[MB Bank v6.4.47](https://t.me/embeeapks/29) (MBShield) - OK (no crashes)

[MB Bank v6.4.46](https://t.me/embeeapks/28) (MBShield) - OK (no crashes)

[MB Bank v6.4.45](https://t.me/embeeapks/25) - OK (no crashes)

[MB Bank v6.4.44](https://t.me/embeeapks/24) - OK - No Zimperium found. (MBShield)

[MB Bank v6.4.43](https://t.me/embeeapks/23) (MBShield) - OK (no crashes)

[MB Bank v6.4.42](https://t.me/embeeapks/22) (MBShield) - OK (no crashes)

[MB Bank v6.4.41](https://t.me/embeeapks/21) (MBShield) - OK (no crashes)

[MB Bank v6.4.40](https://t.me/embeeapks/20) (MBShield) - OK (no crashes)

[MB Bank v6.4.39](https://t.me/embeeapks/19) (MBShield) - OK (no crashes)

[MB Bank v6.4.38](https://t.me/embeeapks/18) (MBShield) - OK (no crashes)

[MB Bank v6.4.37](https://t.me/embeeapks/17) (MBShield) - OK (no crashes)

[MB Bank v6.4.36](https://t.me/embeeapks/16) (MBShield) - OK (no crashes)

[MB Bank v6.4.35](https://t.me/embeeapks/14) (MBShield) - OK (no crashes)

[MB Bank v6.4.34](https://t.me/embeeapks/13) (MBShield) - OK (no crashes)

[MB Bank v6.4.33](https://t.me/embeeapks/11) (MBShield) - OK (no crashes)

[MB Bank v6.4.32](https://t.me/embeeapks/9) (MBShield) - OK (no crashes)

[MB Bank v6.4.31](https://t.me/embeeapks/6) (MBShield) - OK

[MB Bank v6.4.30](https://t.me/mbmobileold/198) (MBShield) - OK

[MB Bank v6.4.29](https://t.me/mbmobileold/197) (MBShield) - OK

[MB Bank v6.4.28](https://t.me/mbmobileold/196) (MBShield) - OK

[MB Bank v6.4.27](https://t.me/mbmobileold/195) (MBShield) - OK



## How this was done (Pre-patched binary only) (OUTDATED)
- Use HxD Hex Editor (can be run on Linux env with wine)
- Get `libZDefend.so` from MB Bank app, APKs can be get from Google Play or Aurora Store
- For `libvvb2060.so`, create a empty file and name it as `libvvb2060.so`
- Open `libZDefend.so` with HxD Hex Editor, use Replace feature (Ctrl + R)
- In search for field, type `zimperium`
- In replace with field, fill 9 empty blank space characters or any random words that has 9 characters  -> Replace all (Be careful, if something went wrong then modified `libZDefend.so` file will not work at all)
- After HxD replaced zimperium with 9 empty black space characters or empty, save it with (Ctrl + S)
- Copy that`libZDefend.so` you just modified to MB Bank lib folder
- Force close MB Bank app if its not completely stopped, then open MB Bank app again, from now its should load new library and the root & hook detection from Zimperium should be bypassed

# MBZDefend-Fix by Cuynu
Bypass new stupid MB Bank zimperium root/hook detection (does not bypass VTAP root detection)

## Changelogs :

- v3.7-mb
```
feat: bump v3.7-mb
feat: createmodule.sh: commit id after module name
feat: vtapstillfail.sh: open vtapfix after vtap failling to init
feat: customize.sh: handle denylist for magisk & depends on syslang to open proper vtapfix web
```

- v3.6-mb
```
feat: misc changes
- remove old patching code (v6.4.55 or older please use older version)
- new auto granting app permission
- improve code logic
- support english & vietnamese language for MBZDefend-Fix notification
- other changes idk

joke: im not (or is) a developer

```

- v3.5-mb
```
feat: redirect zimperium to localhost
```

- v3.4-mb
```
feat: adapt with new detection point
```

- v3.3-mb
```
fix: customize.sh: typo fix 
feat: vtapstillfail.sh: notice for low-end devices that is failing to properly provision vtap 
feat: implement MB & termux & magisk check 
feat: check if vtap is provisioned or not 
```

- v3.2-mb
```
fix: installation failling on some devices
```

- v3.1-mb
```
moved to new code structure, only works with patched MB app (MBCP)
```

- v3.0-mb
```
added termux script for easier use
```

- v2.9-mb
```
workaround for v6.4.56+, ugly but works :<
- it's now requires you to run "Action" on root app -> modules -> MB ZDefend Bypass everytime you need to use MB Bank app...
```

- v2.8-mb
```
open url that guide users follow step to hide vtap detection
```

- v2.6-mb
```
module name changed to "MB ZDefend Bypass"
delete fake "libZDefend.so" for both MB Bank & BizMB Flutter
add support for Biz MB Bank v2.0 (Flutter)
```

- v2.5-mb
```
fix module description.
```

- v2.4-mb
```
disable provider silently
```

- v2.3-mb
```
disable provider before patching
```

- v2.2-mb
```
patching [com.mbmobile] only and minor other changes
```

- v2.1-mb
```
adapt with v6.4.48+
```

- v2.0-mb
```
deleting /data/magisk to prevent eKYC failling
deleting /data/magisk for startup script and actions
```
- v1.9-mb
```
- change patch arguments
- check for sed version before patching 
```
- v1.8-mb
```
- fix patching failure on startup for Magisk
```
- v1.7-mb
```
- fix patching failure on Magisk by don't use busybox
```
- v1.6-mb
```
- Test fix installation issue on Magisk/Kitsune Mask
```

- v1.5-mb
```
- Initial release
```

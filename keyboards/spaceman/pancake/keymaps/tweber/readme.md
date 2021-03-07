tweber's keymap
=================
My layout is based on the keebio/levinson default layout with the following changes:

- leave out the dvorak and colemak layouts for  simplicity.
- swap ctrl + adjust keys
- swap super + alt keys
- put page up/down keys on LOWER up/down
- put HOME and END keys on LOWER left/right
- put cursor keys on ADJUST h,j,k,l keys
- add us international ALT_GR combinations for german umlauts on ADJUST
- move reset to ADJUST ESC
- use Mod-Tap to add rctrl+rshift modifier on ESC key
  -> this is nice for copy + pasting inside terminals
- add keys for setting bluetooth modes 


## build + flash

    make spaceman/pancake/feather:tweber:flash


## issues with bluetooth connect/disconnect loop on linux

I was able to resolve the issue by updateing the feather to the latest firmware using the **bluefuit connect app** and then
doing a factory reset by flashing the HIDKeyboard sketch (<https://learn.adafruit.com/adafruit-feather-32u4-bluefruit-le/hidkeyboard>) with 

    #define FACTORYRESET_ENABLE         0

and then re-flashing the pancake firmware.

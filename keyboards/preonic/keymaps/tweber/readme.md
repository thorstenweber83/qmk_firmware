# tweber's preonic keymap - largely based on The default Preonic layout

changes:

- replace BACKLIT with ADJUST key
- leave out the dvorak and colemak layouts for  simplicity.
- swap ctrl + adjust keys
- swap super + alt keys
- configure RGB animations keys
- put page up/down keys on LOWER up/down
- put HOME and END keys on LOWER left/right
- put cursor keys on ADJUST h,j,k,l keys
- add us international ALT_GR combinations for german umlauts on ADJUST
- move reset to ADJUST ESC
- use Mod-Tap to add rctrl+rshift modifier on ESC key
  -> this is nice for copy + pasting inside terminals
- put backspace on row 1 AND 2 to so it's easer to hit it beacause we're used to the planck layout

flash using:

    sudo make preonic/rev3:tweber:dfu-util
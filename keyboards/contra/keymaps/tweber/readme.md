# The Default Contra Layout

# tweber's contra keymap - largely based on the default layout

changes:

- replace BACKLIT with ADJUST key
- leave out the dvorak and colemak layouts for  simplicity.
- swap ctrl + adjust keys
- swap super + alt keys
- configure RGB animations keys
- put page up/down keys on LOWER up/down
- put HOME and END keys on LOWER left/right
- put cursor keys on ADJUST j,k,l,; keys
- add us international ALT_GR combinations for german umlauts and € on ADJUST
- move reset to ADJUST ESC
- use Mod-Tap to add rctrl+rshift modifier on ESC key
  -> this is nice for copy + pasting inside terminals

flash using:

    sudo make contra:tweber:dfu

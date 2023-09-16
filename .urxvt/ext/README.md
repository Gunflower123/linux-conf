## Scripts
- `font-size` is a forked PERL script that allows for the size of the font to be changed in the URxvt terminal emulator. This script takes in no values.
- `volume` is a deprecated PERL script to key-bind F2 , F3 to manually change the `Master` volume within alsamixer. This script requires a keypad value (F2, F3) as an arguement. This has been deprecated as XF86 commands are used within i3 config located within `.config/i3` to keybind amixer commands.

Note: command `xev` may be used to find the keysym and keycode within your keyboard.

## Additional
PERL extension scripts for URxvt are normally located within ```lib/urxvt/perl/ ```

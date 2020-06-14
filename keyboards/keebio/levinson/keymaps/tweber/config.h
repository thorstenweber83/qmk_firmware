/*
This is the c configuration file for the keymap

Copyright 2012 Jun Wako <wakojun@gmail.com>
Copyright 2015 Jack Humbert
Copyright 2018 Danny Nguyen <danny@keeb.io>

This program is free software: you can redistribute it and/or modify
it under the terms of the GNU General Public License as published by
the Free Software Foundation, either version 2 of the License, or
(at your option) any later version.

This program is distributed in the hope that it will be useful,
but WITHOUT ANY WARRANTY; without even the implied warranty of
MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
GNU General Public License for more details.

You should have received a copy of the GNU General Public License
along with this program.  If not, see <http://www.gnu.org/licenses/>.
*/

#pragma once

// #define USE_I2C

// set up hands via eeprom
#define EE_HANDS

#ifdef RGBLIGHT_ENABLE
  // enable RGBW underglow
  #define RGBW
  // add all available animations
  #define RGBLIGHT_ANIMATIONS
#endif

#ifdef AUDIO_ENABLE
  #define C6_AUDIO
  #define AUDIO_CLICKY
  #define NO_MUSIC_MODE
  #define STARTUP_SONG SONG(MARIO_THEME)
  #define GOODBYE_SONG SONG(MARIO_GAMEOVER)
  #define AUDIO_ON_SONG SONG(ONE_UP_SOUND)
  #define AUDIO_OFF_SONG SONG(MARIO_GAMEOVER)
#endif
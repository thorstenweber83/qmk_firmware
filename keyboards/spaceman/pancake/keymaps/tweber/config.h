#pragma once

#ifdef AUDIO_ENABLE
  #define C6_AUDIO
  #define AUDIO_CLICKY
  #define STARTUP_SONG SONG(MARIO_THEME)
  #define GOODBYE_SONG SONG(MARIO_GAMEOVER)
  #define AUDIO_ON_SONG SONG(ONE_UP_SOUND)
  #define AUDIO_OFF_SONG SONG(MARIO_GAMEOVER)
#endif

#undef MATRIX_ROW_PINS
// use
//   D1 instead of C6 
// in matrix so we can free up C6 for audio
#define MATRIX_ROW_PINS { B5, D7, D1, D0 }


// free up space
// see https://github.com/qmk/qmk_firmware/issues/3224
#define NO_ACTION_MACRO
#define NO_ACTION_FUNCTION

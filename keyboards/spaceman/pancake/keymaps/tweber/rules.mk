BOOTMAGIC_ENABLE  = no	# Virtual DIP switch configuration
CONSOLE_ENABLE  = no	# Console for debug
COMMAND_ENABLE  = no    # Commands for debug and configuration
EXTRAKEY_ENABLE  = yes	# Audio control and System control
AUDIO_ENABLE = yes

# free up some extra space
# see https://github.com/qmk/qmk_firmware/issues/3224
EXTRAFLAGS += -flto

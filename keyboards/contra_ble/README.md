CONTRA BLE
===

![CONTRA](https://cartel.ltd/wp-content/uploads/2018/01/img_3209.jpg)

A 40% keyboard by [CARTEL](https://cartel.ltd/)

Keyboard Maintainer: The QMK Community  
Hardware Supported: CONTRA  
Hardware Availability: [CARTEL](https://cartel.ltd/projects/contra/)

### BLE Support via nice!nano

<https://docs.nicekeyboards.com>



## flashing

### UF2

this looks like it's working on my nixos machine

see <https://github.com/adafruit/Adafruit_nRF52_Bootloader#making-your-own-uf2>

    make contra_ble:default
    # now double tap reset and make sure the usb drive (e.g. /run/media/$USER/NICENANO) is mounted
    ./util/uf2conv.py contra_ble_pro_v1_default.bin -b 0x26000 -f 0xADA52840

### DFU

unfortunately this did not work for me

    # double tap reset to enter DFU mode
    make contra_ble:default:nrfutil    

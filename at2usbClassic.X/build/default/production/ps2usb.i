# 1 "ps2usb.c"
# 1 "<built-in>" 1
# 1 "<built-in>" 3
# 288 "<built-in>" 3
# 1 "<command line>" 1
# 1 "<built-in>" 2
# 1 "/opt/microchip/xc8/v2.45/pic/include/language_support.h" 1 3
# 2 "<built-in>" 2
# 1 "ps2usb.c" 2
# 1 "./ps2usb.h" 1



# 1 "./ps2_keyboard.h" 1



# 1 "/opt/microchip/xc8/v2.45/pic/include/c99/stdbool.h" 1 3
# 5 "./ps2_keyboard.h" 2
# 1 "/opt/microchip/xc8/v2.45/pic/include/c99/stdint.h" 1 3



# 1 "/opt/microchip/xc8/v2.45/pic/include/c99/musl_xc8.h" 1 3
# 5 "/opt/microchip/xc8/v2.45/pic/include/c99/stdint.h" 2 3
# 26 "/opt/microchip/xc8/v2.45/pic/include/c99/stdint.h" 3
# 1 "/opt/microchip/xc8/v2.45/pic/include/c99/bits/alltypes.h" 1 3
# 133 "/opt/microchip/xc8/v2.45/pic/include/c99/bits/alltypes.h" 3
typedef unsigned short uintptr_t;
# 148 "/opt/microchip/xc8/v2.45/pic/include/c99/bits/alltypes.h" 3
typedef short intptr_t;
# 164 "/opt/microchip/xc8/v2.45/pic/include/c99/bits/alltypes.h" 3
typedef signed char int8_t;




typedef short int16_t;




typedef __int24 int24_t;




typedef long int32_t;





typedef long long int64_t;
# 194 "/opt/microchip/xc8/v2.45/pic/include/c99/bits/alltypes.h" 3
typedef long long intmax_t;





typedef unsigned char uint8_t;




typedef unsigned short uint16_t;




typedef __uint24 uint24_t;




typedef unsigned long uint32_t;





typedef unsigned long long uint64_t;
# 235 "/opt/microchip/xc8/v2.45/pic/include/c99/bits/alltypes.h" 3
typedef unsigned long long uintmax_t;
# 27 "/opt/microchip/xc8/v2.45/pic/include/c99/stdint.h" 2 3

typedef int8_t int_fast8_t;

typedef int64_t int_fast64_t;


typedef int8_t int_least8_t;
typedef int16_t int_least16_t;

typedef int24_t int_least24_t;
typedef int24_t int_fast24_t;

typedef int32_t int_least32_t;

typedef int64_t int_least64_t;


typedef uint8_t uint_fast8_t;

typedef uint64_t uint_fast64_t;


typedef uint8_t uint_least8_t;
typedef uint16_t uint_least16_t;

typedef uint24_t uint_least24_t;
typedef uint24_t uint_fast24_t;

typedef uint32_t uint_least32_t;

typedef uint64_t uint_least64_t;
# 148 "/opt/microchip/xc8/v2.45/pic/include/c99/stdint.h" 3
# 1 "/opt/microchip/xc8/v2.45/pic/include/c99/bits/stdint.h" 1 3
typedef int16_t int_fast16_t;
typedef int32_t int_fast32_t;
typedef uint16_t uint_fast16_t;
typedef uint32_t uint_fast32_t;
# 149 "/opt/microchip/xc8/v2.45/pic/include/c99/stdint.h" 2 3
# 6 "./ps2_keyboard.h" 2
# 195 "./ps2_keyboard.h"
typedef struct PS2ScanCode {
    uint8_t value;
    _Bool isExtend;
    _Bool isBreak;
} PS2ScanCode;

void PS2Keyboard_Init(void);
_Bool PS2Keyboard_GetScanCode(PS2ScanCode* scanCode);
void PS2Keyboard_SendCommand(uint8_t cmd);
uint8_t PS2Keyboard_GetLastCommand(void);
# 5 "./ps2usb.h" 2



uint8_t PS2USB_ScanCodeToUSBHID(const PS2ScanCode *scanCode);
# 2 "ps2usb.c" 2




static const uint8_t ps2UsbMap[] = {
    0x00,
    0x42,
    0x00,
    0x3E,
    0x3C,
    0x3A,
    0x3B,
    0x45,
    0x00,
    0x43,
    0x41,
    0x3F,
    0x3D,
    0x2B,
    0x35,
    0x00,
    0x00,
    0xE2,
    0xE1,
    0x88,
    0xE0,
    0x14,
    0x1e,
    0x00,
    0x00,
    0x00,
    0x1d,
    0x16,
    0x04,
    0x1a,
    0x1f,
    0x00,
    0x00,
    0x06,
    0x1b,
    0x07,
    0x08,
    0x21,
    0x20,
    0x00,
    0x00,
    0x2c,
    0x19,
    0x09,
    0x17,
    0x15,
    0x22,
    0x00,
    0x00,
    0x11,
    0x05,
    0x0b,
    0x0a,
    0x1c,
    0x23,
    0x00,
    0x00,
    0x00,
    0x10,
    0x0d,
    0x18,
    0x24,
    0x25,
    0x00,
    0x00,
    0x36,
    0x0e,
    0x0c,
    0x12,
    0x27,
    0x26,
    0x00,
    0x00,
    0x37,
    0x38,
    0x0f,
    0x33,
    0x13,
    0x2d,
    0x00,
    0x00,
    0x87,
    0x34,
    0x00,
    0x2f,
    0x2e,
    0x00,
    0x00,
    0xE3,
    0xE5,
    0x28,
    0x30,
    0x00,
    0x32,
    0x00,
    0x00,
    0x00,
    0x00,
    0x00,
    0x00,
    0x8A,
    0x00,
    0x2A,
    0x8B,
    0x00,
    0x59,
    0x89,
    0x5C,
    0x5F,
    0x00,
    0x00,
    0x00,
    0x62,
    0x63,
    0x5A,
    0x5D,
    0x5E,
    0x60,
    0x29,
    0x53,
    0x44,
    0x57,
    0x5B,
    0x54,
    0x55,
    0x61,
    0x47,
    0x00,
    0x00,
    0x00,
    0x00,
    0x40
};





static const uint8_t ps2ExtUsbMap[] = {
    0x00,
    0x00,
    0x00,
    0x00,
    0x00,
    0x00,
    0x00,
    0x00,
    0x00,
    0x00,
    0x00,
    0x00,
    0x00,
    0x00,
    0x00,
    0x00,
    0x00,
    0xe6,
    0x00,
    0x00,
    0xe4,
    0x00,
    0x00,
    0x00,
    0x00,
    0x00,
    0x00,
    0x00,
    0x00,
    0x00,
    0x00,
    0xe3,
    0x00,
    0x00,
    0x00,
    0x00,
    0x00,
    0x00,
    0x00,
    0xe7,
    0x00,
    0x00,
    0x00,
    0x00,
    0x00,
    0x00,
    0x00,
    0x65,
    0x00,
    0x00,
    0x00,
    0x00,
    0x00,
    0x00,
    0x00,
    0x00,
    0x00,
    0x00,
    0x00,
    0x00,
    0x00,
    0x00,
    0x00,
    0x00,
    0x00,
    0x00,
    0x00,
    0x00,
    0x00,
    0x00,
    0x00,
    0x00,
    0x00,
    0x00,
    0x54,
    0x00,
    0x00,
    0x00,
    0x00,
    0x00,
    0x00,
    0x00,
    0x00,
    0x00,
    0x00,
    0x00,
    0x00,
    0x00,
    0x00,
    0x00,
    0x58,
    0x00,
    0x00,
    0x00,
    0x00,
    0x00,
    0x00,
    0x00,
    0x00,
    0x00,
    0x00,
    0x00,
    0x00,
    0x00,
    0x00,
    0x4d,
    0x00,
    0x50,
    0x4a,
    0x00,
    0x00,
    0x00,
    0x49,
    0x4c,
    0x51,
    0x00,
    0x4f,
    0x52,
    0x00,
    0x00,
    0x00,
    0x00,
    0x4e,
    0x00,
    0x46,
    0x4b,
    0x00,
    0x00,
    0x00,
    0x00,
    0x00,
    0x00,
    0x00,
    0x00,
    0x00,
    0x00,
    0x00,
    0x00,
    0x00,
    0x00,
    0x00,
    0x00,
    0x00,
    0x00,
    0x00,
    0x00,
    0x00,
    0x00,
    0x00,
    0x00,
    0x00,
    0x00,
    0x00,
    0x00,
    0x00,
    0x00,
    0x00,
    0x00,
    0x00,
    0x00,
    0x00,
    0x00,
    0x00,
    0x00,
    0x00,
    0x00,
    0x00,
    0x00,
    0x00,
    0x00,
    0x00,
    0x00,
    0x00,
    0x00,
    0x00,
    0x00,
    0x00,
    0x00,
    0x00,
    0x00,
    0x00,
    0x00,
    0x00,
    0x00,
    0x00,
    0x00,
    0x00,
    0x00,
    0x00,
    0x00,
    0x00,
    0x00,
    0x00,
    0x00,
    0x00,
    0x00,
    0x00,
    0x00,
    0x00,
    0x00,
    0x00,
    0x00,
    0x00,
    0x00,
    0x00,
    0x00,
    0x00,
    0x00,
    0x00,
    0x00,
    0x00,
    0x00,
    0x00,
    0x00,
    0x00,
    0x00,
    0x00,
    0x00,
    0x00,
    0x00,
    0x00,
    0x00,
    0x00,
    0x00,
    0x00,
    0x00,
    0x00,
    0x00,
    0x00,
    0x00,
    0x00,
    0x00,
    0x00,
    0x00,
    0x00,
    0x00,
    0x00,
    0x00,
    0x00,
    0x00,
    0x00,
    0x00,
    0x00,
    0x00,
    0x00,
    0x00,
    0x00,
    0x00,
    0x00,
    0x00,
    0x00,
    0x00,
    0x00,
    0x00,
    0x00
};


uint8_t PS2USB_ScanCodeToUSBHID(const PS2ScanCode *scanCode) {
# 429 "ps2usb.c"
    if (scanCode->isExtend) {





        return ps2ExtUsbMap[scanCode->value];
    } else {





        return ps2UsbMap[scanCode->value];
    }
}

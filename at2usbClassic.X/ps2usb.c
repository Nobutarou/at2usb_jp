#include "ps2usb.h"
//#include <xc.h>
//#include <stdio.h>

/* {{{ */
static const uint8_t ps2UsbMap[] = {
    0x00, //00 -> nul
    0x42, //01 -> F9
    0x00, //02 -> nul
    0x3E, //03 -> F5
    0x3C, //04 -> F3
    0x3A, //05 -> F1
    0x3B, //06 -> F2
    0x45, //07 -> F12
    0x00, //08 -> nul
    0x43, //09 -> F10
    0x41, //0A -> F8
    0x3F, //0B -> F6
    0x3D, //0C -> F4
    0x2B, //0D -> TAB
    0x35, //0E -> zenkaku_hankaku
    0x00, //0F -> nul
    0x00, //10 -> nul
    0xE2, //11 -> Left ALT
    0xE1, //12 -> LEFT shift
    0x88, //13 -> katakana hiragana
    0xE0, //14 -> Left ctrl
    0x14, //15 -> 'q'
    0x1e, //16 -> '1'
    0x00, //17 -> nul
    0x00, //18 -> nul
    0x00, //19 -> nul
    0x1d, //1A -> z
    0x16, //1B -> s
    0x04, //1C -> a
    0x1a, //1D -> w
    0x1f, //1E -> 2
    0x00, //1F -> nul
    0x00, //20 -> nul
    0x06, //21 -> c
    0x1b, //22 -> x
    0x07, //23 -> d
    0x08, //24 -> e
    0x21, //25 -> 4
    0x20, //26 -> 3
    0x00, //27 -> nul
    0x00, //28 -> nul
    0x2c, //29 -> SPACE
    0x19, //2A -> v
    0x09, //2B -> f
    0x17, //2C -> t
    0x15, //2D -> r
    0x22, //2E -> 5
    0x00, //2F -> nul
    0x00, //30 -> nul
    0x11, //31 -> n
    0x05, //32 -> b
    0x0b, //33 -> h
    0x0a, //34 -> g
    0x1c, //35 -> y
    0x23, //36 -> 6
    0x00, //37 -> nul
    0x00, //38 -> nul
    0x00, //39 -> nul
    0x10, //3a -> m
    0x0d, //3B -> j
    0x18, //3C -> u
    0x24, //3D -> 7
    0x25, //3E -> 8
    0x00, //3F -> nul
    0x00, //40 -> nul
    0x36, //41 -> ',' 
    0x0e, //42 -> k
    0x0c, //43 -> i
    0x12, //44 -> o
    0x27, //45 -> 0
    0x26, //46 -> 9
    0x00, //47 -> nul
    0x00, //48 -> nul
    0x37, //49 -> '.'
    0x38, //4a -> '/'
    0x0f, //4B -> l
    0x33, //4C -> ';'
    0x13, //4D -> p
    0x2d, //4E -> '-'
    0x00, //4F -> nul
    0x00, //50 -> nul
    0x87, //51 -> backslash
    0x34, //52 -> :
    0x00, //53 -> nul
    0x2f, //54 -> atmark
    0x2e, //55 -> ^
    0x00, //56 -> nul
    0x00, //57 -> nul
    0xE3, //58 -> Caps to LWIN! This is ignored. The fake is done in APP_KeyboardUpdateState
    0xE5, //59 -> Rshift
    0x28, //5A -> Enter
    0x30, //5B -> [
    0x00, //5C -> nul
    0x32, //5D -> ]
    0x00, //5E -> nul
    0x00, //5F -> nul
    0x00, //60 -> nul
    0x00, //61 -> nul
    0x00, //62 -> nul
    0x00, //63 -> nul
    0x8A, //64 -> henkan
    0x00, //65 -> nul
    0x2A, //66 -> Backspace
    0x8B, //67 -> muhenkan
    0x00, //68 -> nul
    0x59, //69 -> kp-1
    0x89, //6A -> Yen
    0x5C, //6B -> kp-4
    0x5F, //6C -> kp-7
    0x00, //6D -> nul
    0x00, //6E -> nul
    0x00, //6F -> nul
    0x62, //70 -> kp-0
    0x63, //71 -> kp-dot
    0x5A, //72 -> kp-2
    0x5D, //73 -> kp-5
    0x5E, //74 -> kp-6
    0x60, //75 -> kp-8
    0x29, //76 -> ESCAPE
    0x53, //77 -> Num lock
    0x44, //78 -> F11
    0x57, //79 -> kp-plus
    0x5B, //7A -> kp-3
    0x54, //7B -> kp-minus
    0x55, //7C -> kp-*
    0x61, //7D -> KP-9
    0x47, //7E -> scroll lock
    0x00, //7F -> nul
    0x00, //80 -> nul
    0x00, //81 -> nul
    0x00, //82 -> nul
    0x40 //83 -> F7 
};
/* }}} */

/* {{{ */
static const uint8_t ps2ExtUsbMap[] = {
    0x00, //00
    0x00, //01
    0x00, //02
    0x00, //03
    0x00, //04
    0x00, //05
    0x00, //06
    0x00, //07
    0x00, //08
    0x00, //09
    0x00, //0a
    0x00, //0b
    0x00, //0c
    0x00, //0d
    0x00, //0e
    0x00, //0f
    0x00, //10
    0xe6, //11 -> RAlt
    0x46, //12 -> Prt sc
    0x00, //13
    0xe4, //14 -> RCtrl
    0x00, //15
    0x00, //16
    0x00, //17
    0x00, //18
    0x00, //19
    0x00, //1a
    0x00, //1b
    0x00, //1c
    0x00, //1d
    0x00, //1e
    0xe3, //1f -> L Win
    0x00, //20
    0x00, //21
    0x00, //22
    0x00, //23
    0x00, //24
    0x00, //25
    0x00, //26
    0xe7, //27 -> R win
    0x00, //28
    0x00, //29
    0x00, //2a
    0x00, //2b
    0x00, //2c
    0x00, //2d
    0x00, //2e
    0x65, //2f -> application
    0x00, //30
    0x00, //31
    0x00, //32
    0x00, //33
    0x00, //34
    0x00, //35
    0x00, //36
    0x00, //37
    0x00, //38
    0x00, //39
    0x00, //3a
    0x00, //3b
    0x00, //3c
    0x00, //3d
    0x00, //3e
    0x00, //3f
    0x00, //40
    0x00, //41
    0x00, //42
    0x00, //43
    0x00, //44
    0x00, //45
    0x00, //46
    0x00, //47
    0x00, //48
    0x00, //49
    0x54, //4a -> kp-/
    0x00, //4b
    0x00, //4c
    0x00, //4d
    0x00, //4e
    0x00, //4f
    0x00, //50
    0x00, //51
    0x00, //52
    0x00, //53
    0x00, //54
    0x00, //55
    0x00, //56
    0x00, //57
    0x00, //58
    0x00, //59
    0x58, //5a -> kp-enter
    0x00, //5b
    0x00, //5c
    0x00, //5d
    0x00, //5e
    0x00, //5f
    0x00, //60
    0x00, //61
    0x00, //62
    0x00, //63
    0x00, //64
    0x00, //65
    0x00, //66
    0x00, //67
    0x00, //68
    0x4d, //69 -> End
    0x00, //6a
    0x50, //6b -> left
    0x4a, //6c -> home
    0x00, //6d
    0x00, //6e
    0x00, //6f
    0x49, //70 -> insert
    0x4c, //71 -> del
    0x51, //72 -> down
    0x00, //73
    0x4f, //74 -> right
    0x52, //75 -> up
    0x00, //76
    0x00, //77
    0x00, //78
    0x00, //79
    0x4e, //7a -> page down
    0x00, //7b
    0x46, //7c -> print screen
    0x4b, //7d -> page up
    0x00, //7e
    0x00, //7f
    0x00, //80
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
/* }}} */

uint8_t PS2USB_ScanCodeToUSBHID(const PS2ScanCode *scanCode) {
//    // Ref URL: http://machoto2.g2.xrea.com/page/P16F1455/P16_K08.htm
//    RCSTA   = 0b10010000; // RX enable. Do I need?
//    // Async Tx enable
//    // | OSRC | TX9 | TXEN | SYNC | SENDB | BRGH | TRMT | TX9D |
//    // OSRC=any: ignore for async mode.
//    // TX9=0   : 8-bit data
//    // TXEN=1  : TX enable
//    // SYNC=0  : async
//    // SENDB=0 : unsure.
//    // BRGH=1  : High speed baud rate
//    // TRMT=0  : unsure
//    // TX9D=0  : unsure 
//    TXSTA   = 0b00100100; // Async TX enable
//    BAUDCON = 0b00001000; // BRG16=1: 16-bit baud rate generator
//    // I am unsure I should use FOSC=16Mhz or 48Mhz. 
//    // For FOSC=16MHz and 9600bps,
//    // SPBRG = 416 = 0b1|10100000
//    // If FOSC=48MHz, this lead
//    SPBRGH = 0b1;
//    SPBRGL = 0b10100000;
//    // If 48MHz,
//    // SPBRG = 1249 = 0b100|11100001
//    char s[11]="noext,0x00\n"; //set dummy str
//    int i;
    if (scanCode->isExtend) {
//        snprintf(s, sizeof(s), "isext,0x%d\n",(int)scanCode);
//        for(i=0; i<10; i++) {
//            while (!TXIF);
//            TXREG = s[i];
//        }
        return ps2ExtUsbMap[scanCode->value];
    } else {
//        snprintf(s, sizeof(s), "noext,0x%d\n",(int)scanCode);
//        for(i=0; i<10; i++) {
//            while (!TXIF);
//            TXREG = s[i];
//        }
        return ps2UsbMap[scanCode->value];
    }
}

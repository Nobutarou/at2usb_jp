#include "mcc_generated_files/mcc.h"

#include "app_device_keyboard.h"
#include "systime.h"
#include "log.h"

/*
    Main application
 */

int main(void) {
    SYSTEM_Initialize();
    SysTime_Init();
    PS2Keyboard_Init();
    
    //__delay_ms(1000);

    // If using interrupts in PIC18 High/Low Priority Mode you need to enable the Global High and Low Interrupts 
    // If using interrupts in PIC Mid-Range Compatibility Mode you need to enable the Global and Peripheral Interrupts 
    // Use the following macros to: 

    // Enable the Global Interrupts 
    INTERRUPT_GlobalInterruptEnable();

    // Enable the Peripheral Interrupts 
    INTERRUPT_PeripheralInterruptEnable();

    // Disable the Peripheral Interrupts 
    //INTERRUPT_PeripheralInterruptDisable();
    
    PS2ScanCode initCode;
    PS2Keyboard_SendCommand(0xFF); // reset the keyboard.
    while (1) {
      //Log_Message((const uint8_t*)"G_\r\n", 4);
      while(!PS2Keyboard_GetScanCode(&initCode));
      if (initCode.value == 0xAA) {
        //Log_Message((const uint8_t*)"Z\r\n", 3);
        break; 
      } else if (initCode.value == 0xFA) {
        // 何もせずに次に来るであろう 0xAA を待つ
      } else {
        PS2Keyboard_SendCommand(0xFF); // reset the keyboard.
        //Log_Message((const uint8_t*)"S_FF\r\n", 6);
      }

    }

    
    PS2ScanCode scanCode = {0};
    bool scanCodeValid = false;
    PS2ScanCode *hndlScanCode = NULL;
    char scanCodeStr[6] = {' ', ' ', ' ', ' ', '\r', '\n'};
    
    while (1) {
        scanCodeValid = PS2Keyboard_GetScanCode(&scanCode);
        if(scanCodeValid) {
            hndlScanCode = &scanCode;
        } else {
            hndlScanCode = NULL;
        }
        if(hndlScanCode != NULL) {
            scanCodeStr[0] = hndlScanCode->isExtend ? 'e' : ' ';
            scanCodeStr[1] = hndlScanCode->isBreak ? 'b' : ' ';
            Log_UtilityConvertByteToHex(hndlScanCode->value, &scanCodeStr[2], 2);
            Log_Message((const uint8_t*)scanCodeStr, sizeof(scanCodeStr));
        }
        APP_KeyboardTasks(hndlScanCode);
    }
}

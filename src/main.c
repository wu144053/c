/**
 * *********************************************
 *
 * 8051 blink demo
 *
 * PIN: P11
 *
 *
 * *********************************************
 */

// #include<REG52.H>
// #include<INTRINS.H>
// #include"gital.h"
#include <REGX52.H>
#include "time.h"
#include "LCD1602.h"
#include "martrixkey.h"

typedef unsigned char uint8_t;
typedef unsigned int uint16_t;
typedef unsigned long uint32_t;

typedef signed char int8_t;
typedef signed int int16_t;
typedef signed long int32_t;

// #define EXT0_VECTOR 0  /* 0x03 external interrupt 0 */
// #define TIM0_VECTOR 1  /* 0x0b timer 0 */
// #define EXT1_VECTOR 2  /* 0x13 external interrupt 1 */
// #define TIM1_VECTOR 3  /* 0x1b timer 1 */
// #define UART0_VECTOR 4 /* 0x23 serial port 0 */

// LED pin define
// void digital(unsigned char local_number ,int num);

void main()
{
    unsigned char num;
    // run_520();
    LCD_Init();
    LCD_ShowString(1, 1, "hallo,world");
    while (1) {
        num = key_martrix();
        LCD_ShowNum(2, 1, num, 1);
        num = key_martrix();
        if (num) {
            LCD_ShowNum(2, 1, num, 1);
        }
    }
}

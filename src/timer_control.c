#include"timer_control.h"
void time_init(){
    TMOD &= 0Xf0;
    TMOD |= 0x01;
    TF0 = 0;
    TR0 = 1 ;
    TH0 = 0xFC;
    TL0 = 0x18;
    ET0 = 1;
    EA = 1;
    PT0 =0;
}

/*void T0_timeer_rounting()  interrupt 1{
    static unsigned char T0_count = 0;
    TH0 = 0x18;
    TL0 = 0xfc;
    T0_count++;
    if(T0_count>=500){
        T0_count = 0;
    }
}
*/

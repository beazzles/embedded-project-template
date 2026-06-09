#include "status_led.h"

static bool led_state = false;

void StatusLED_Init(void) 
{
    led_state = false;
}

void StatusLED_Set(bool state) 
{
    led_state = state;
}

bool StatusLED_Get(void) 
{
    return led_state;
}
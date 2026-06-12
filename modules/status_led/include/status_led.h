#ifndef STATUS_LED_H
#define STATUS_LED_H

#include <stdbool.h>

#ifdef __cplusplus
extern "C"
{
#endif

    void StatusLED_Init(void);
    void StatusLED_Set(bool state);
    bool StatusLED_Get(void);

#ifdef __cplusplus
}
#endif
#endif // STATUS_LED_H

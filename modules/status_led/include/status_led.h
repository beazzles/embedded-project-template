#ifndef STATUS_LED_H
#define STATUS_LED_H

#include <stdbool.h>

/**
 * @file status_led.h
 * @brief Status LED module interface.
 *
 * Provides a simple abstraction for controlling and
 * reading the state of the system status LED.
 */
#ifdef __cplusplus
extern "C"
{
#endif
    /**
     * @brief Initialize the status LED module.
     *
     * Initializes the internal module state and
     * sets the LED to OFF.
     */
    void StatusLED_Init(void);

    /**
     * @brief Set the status LED state.
     *
     * @param state Desired LED state.
     *          - true  :   LED ON
     *          - false :   LED OFF
     */
    void StatusLED_Set(bool state);

    /**
     * @brief Get the current status LED state.
     *
     * @return Current LED state
     * @retval true LED is ON.
     * @retval false LED is OFF.
     */
    bool StatusLED_Get(void);

#ifdef __cplusplus
}
#endif
#endif // STATUS_LED_H

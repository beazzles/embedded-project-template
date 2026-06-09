#include "CppUTest/TestHarness.h"

extern "C" 
{
#include "status_led.h"
}

TEST_GROUP(StatusLED)
{
    void setup()
    {
        StatusLED_Init();
    }

    void teardown()
    {
    }
};

TEST(StatusLED, InitialStateIsOff)
{
    CHECK_FALSE(StatusLED_Get());
}

TEST(StatusLED, SetTrueTurnsLedOn)
{
    StatusLED_Set(true);
    CHECK_TRUE(StatusLED_Get());
}

TEST(StatusLED, SetFalseTurnsLedOff)
{
    StatusLED_Set(true);
    StatusLED_Set(false);
    
    CHECK_FALSE(StatusLED_Get());
}
#include "CppUTest/TestHarness.h"

extern "C"
{
#include "status_led.h"
}

// clang-format off
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
// clang-format on

/**
 * @req SWE001
 * @ver VER001
 * @tst TST001
 */
TEST(StatusLED, InitialStateIsOff)
{
    CHECK_FALSE(StatusLED_Get());
}

/**
 * @req SWE001
 * @ver VER001
 * @tst TST001
 */
TEST(StatusLED, SetTrueTurnsLedOn)
{
    StatusLED_Set(true);
    CHECK_TRUE(StatusLED_Get());
}

/**
 * @req SWE001
 * @ver VER001
 * @tst TST001
 */
TEST(StatusLED, SetFalseTurnsLedOff)
{
    StatusLED_Set(true);
    StatusLED_Set(false);

    CHECK_FALSE(StatusLED_Get());
}
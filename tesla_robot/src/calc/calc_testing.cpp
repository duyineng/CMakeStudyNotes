#include <gtest/gtest.h>
#include "calc.h"

// TEST为宏函数，MathOperationsTest为测试套件，AddFunction为测试用例
TEST(MathOperationsTest, AddFunction) {
    EXPECT_EQ(add(2, 3), 13);   // 2 + 3 + 8 = 13
    EXPECT_EQ(add(-1, 1), 8);   // -1 + 1 + 8 = 8
    EXPECT_EQ(add(0, 0), 8);    // 0 + 0 + 8 = 8
}

TEST(MathOperationsTest, DivideFunction) {
    EXPECT_DOUBLE_EQ(divide(10, 2), 5.0);       // 10 / 2 = 5.0
    EXPECT_DOUBLE_EQ(divide(7, 3), 7.0 / 3.0);  // 7 / 3 = 2.333...
    EXPECT_DOUBLE_EQ(divide(-6, 3), -2.0);      // -6 / 3 = -2.0
}
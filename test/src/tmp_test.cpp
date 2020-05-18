#include <gtest/gtest.h>

#include "tmp/tmp.h"

TEST(TmpAddTest, CheckValues) {
    EXPECT_EQ(tmp::add(1, 2), 3)
}

//  OCHamcrest by Jon Reid, http://qualitycoding.org/about/
//  Copyright 2014 hamcrest.org. See LICENSE.txt

    // Module under test
#define HC_SHORTHAND
#import <OCHamcrest/HCNumberAssert.h>

    // Collaborators
#import <OCHamcrest/HCIsEqual.h>
#import <OCHamcrest/HCIsEqualToNumber.h>
#import <OCHamcrest/HCIsNot.h>

    // Test support
#import <XCTest/XCTest.h>

@interface NumberAssertTest : XCTestCase
@end

@implementation NumberAssertTest

- (void)setUp
{
    [super setUp];
    self.continueAfterFailure = NO;
}

#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wdeprecated-declarations"

- (void)testWithBool
{
    assertThatBool(YES, equalTo(@YES));
    assertThatBool(YES, isNot(equalTo(@NO)));
}

#pragma clang diagnostic pop

- (void)testWithChar
{
    assertThatChar('A', equalTo(@'A'));
    assertThatChar('A', isNot(equalTo(@'B')));
}

- (void)testWithDouble
{
    assertThatDouble(1.5, equalTo(@1.5));
    assertThatDouble(2.5, isNot(equalTo(@1.5)));
}

- (void)testWithFloat
{
    assertThatFloat(1.5f, equalTo(@1.5f));
    assertThatFloat(2.5f, isNot(equalTo(@1.5f)));
}

- (void)testWithInt
{
    assertThatInt(1, equalTo(@1));
    assertThatInt(2, isNot(equalTo(@1)));
}

- (void)testWithLong
{
    assertThatLong(1, equalTo(@1L));
    assertThatLong(2, isNot(equalTo(@1L)));
}

- (void)testWithLongLong
{
    assertThatLongLong(1, equalTo(@1LL));
    assertThatLongLong(2, isNot(equalTo(@1LL)));
}

- (void)testWithShort
{
    assertThatShort(1, equalTo(@1));
    assertThatShort(2, isNot(equalTo(@1)));
}

- (void)testWithUnsignedChar
{
    assertThatUnsignedChar('A', equalTo(@'A'));
    assertThatUnsignedChar('B', isNot(equalTo(@'A')));
}

- (void)testWithUnsignedInt
{
    assertThatUnsignedInt(1, equalTo(@1U));
    assertThatUnsignedInt(2, isNot(equalTo(@1U)));
}

- (void)testWithUnsignedLong
{
    assertThatUnsignedLong(1, equalTo(@1UL));
    assertThatUnsignedLong(2, isNot(equalTo(@1UL)));
}

- (void)testWithUnsignedLongLong
{
    assertThatUnsignedLongLong(1, equalTo(@1ULL));
    assertThatUnsignedLongLong(2, isNot(equalTo(@1ULL)));
}

- (void)testWithUnsignedShort
{
    assertThatUnsignedShort(1, equalTo(@1U));
    assertThatUnsignedShort(2, isNot(equalTo(@1U)));
}

- (void)testWithInteger
{
    assertThatInteger(1, equalTo(@1));
    assertThatInteger(2, isNot(equalTo(@1)));
}

- (void)testWithUnsignedInteger
{
    assertThatUnsignedInteger(1, equalTo(@1UL));
    assertThatUnsignedInteger(2, isNot(equalTo(@1UL)));
}

@end

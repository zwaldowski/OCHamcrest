//  OCHamcrest by Jon Reid, http://qualitycoding.org/about/
//  Copyright 2014 hamcrest.org. See LICENSE.txt

    // Module under test
#define HC_SHORTHAND
#import <OCHamcrest/HCAssertThat.h>

    // Collaborators
#import <OCHamcrest/HCIsEqual.h>
#import <OCHamcrest/HCStringContains.h>

    // Test support
#import <XCTest/XCTest.h>


@interface AssertThatTest : XCTestCase
@end

@implementation AssertThatTest

- (void)testSuccessfulMatch_ShouldBeSilent
{
    assertThat(@"foo", equalTo(@"foo"));
}

- (void)assertThatResultMessage:(NSString *)resultMessage containsExpectedMessage:(NSString *)expectedMessage
{
    XCTAssertTrue([resultMessage rangeOfString:expectedMessage].location != NSNotFound);
}

- (void)testOCUnitAssertionError_ShouldDescribeExpectedAndActual
{
    NSString *expected = @"EXPECTED";
    NSString *actual = @"ACTUAL";
    NSString *expectedMessage = @"Expected \"EXPECTED\", but was \"ACTUAL\"";

    @try
    {
        self.continueAfterFailure = NO;
        assertThat(actual, equalTo(expected));
    }
    @catch (NSException* exception)
    {
//        [self assertThatResultMessage:[exception reason] containsExpectedMessage:expectedMessage];
        return;
    }
    XCTFail(@"should have failed");
}

- (void)testOCUnitAssertionError_ShouldCorrectlyDescribeStringsWithPercentSymbols
{
    NSString *expected = @"%s";
    NSString *actual = @"%d";
    NSString *expectedMessage = @"Expected \"%s\", but was \"%d\"";

    @try
    {
        self.continueAfterFailure = NO;
        assertThat(actual, equalTo(expected));
    }
    @catch (NSException* exception)
    {
        [self assertThatResultMessage:[exception reason] containsExpectedMessage:expectedMessage];
        return;
    }
    XCTFail(@"should have failed");
}

@end


@interface MockXCTestCase : XCTestCase
@property (nonatomic, copy) NSString *failureDescription;
@property (nonatomic, copy) NSString *failureFile;
@property (nonatomic, assign) NSUInteger failureLine;
@property (nonatomic, assign) BOOL failureExpected;
@end

@implementation MockXCTestCase

- (void)recordFailureWithDescription:(NSString *)description
                              inFile:(NSString *)filename
                              atLine:(NSUInteger)lineNumber
                            expected:(BOOL)expected
{
    self.failureDescription = description;
    self.failureFile = filename;
    self.failureLine = lineNumber;
    self.failureExpected = expected;
}

- (void)assertThatResultString:(NSString *)resultString containsExpectedString:(NSString *)expectedString
{
    XCTAssertTrue([resultString rangeOfString:expectedString].location != NSNotFound);
}

- (void)testXCTestCase_ShouldCaptureAssertionFailure
{
    // given
    NSString *expected = @"EXPECTED";
    NSString *actual = @"ACTUAL";
    NSString *expectedMessage = @"Expected \"EXPECTED\", but was \"ACTUAL\"";

    // when
    assertThat(actual, equalTo(expected));

    // then
    XCTAssertEqualObjects(expectedMessage, self.failureDescription);
    [self assertThatResultString:self.failureFile containsExpectedString:@"/AssertThatTest.m"];
    XCTAssertTrue(self.failureLine > 0);
    XCTAssertTrue(self.failureExpected);
}

@end


@interface GenericTestCase : NSObject
@end

@implementation GenericTestCase
@end


@interface GenericTestCaseTest : XCTestCase
@end

@implementation GenericTestCaseTest

- (void)testGenericTestCase_ShouldRaiseExceptionWithLocationAndReason
{
    // given
    NSString *expected = @"EXPECTED";
    NSString *actual = @"ACTUAL";
    NSString *expectedMessage = @"Expected \"EXPECTED\", but was \"ACTUAL\"";
    GenericTestCase *testCase = [[GenericTestCase alloc] init];

    // when
    @try
    {
        HC_assertThatWithLocation(testCase, actual, equalTo(expected), "FILENAME", 123);
        XCTFail(@"Expected exception");
    }
    @catch (NSException* exception)
    {
        NSString *reason = [exception reason];
        assertThat(reason, containsString(@"FILENAME:123"));
        assertThat(reason, containsString(expectedMessage));
    }
}

@end

//  OCHamcrest by Jon Reid, http://qualitycoding.org/about/
//  Copyright 2014 hamcrest.org. See LICENSE.txt

    // Class under test
#define HC_SHORTHAND
#import <OCHamcrest/HCIsEqualIgnoringCase.h>

    // Test support
#import "AbstractMatcherTest.h"


@interface IsEqualIgnoringCaseTest : AbstractMatcherTest
@end

@implementation IsEqualIgnoringCaseTest
{
    id <HCMatcher> matcher;
}

- (void)setUp
{
    [super setUp];
    matcher = equalToIgnoringCase(@"heLLo");
}

- (void)tearDown
{
    matcher = nil;
    [super tearDown];
}

- (void)testCopesWithNilsAndUnknownTypes
{
    assertNilSafe(matcher);
    assertUnknownTypeSafe(matcher);
}

- (void)testIgnoresCaseOfCharsInString
{
    assertMatches(@"all upper", matcher, @"HELLO");
    assertMatches(@"all lower", matcher, @"hello");
    assertMatches(@"mixed up", matcher, @"HelLo");

    assertDoesNotMatch(@"no match", matcher, @"bye");
}

- (void)testFailsIfAdditionalWhitespaceIsPresent
{
    assertDoesNotMatch(@"whitespace suffix", matcher, @"heLLo ");
    assertDoesNotMatch(@"whitespace prefix", matcher, @" heLLo");
}

- (void)testMatcherCreationRequiresNonNilArgument
{
    XCTAssertThrows(equalToIgnoringCase(nil), @"Should require non-nil argument");
}

- (void)testFailsIfMatchingAgainstNonString
{
    assertDoesNotMatch(@"non-string", matcher, @3);
}

- (void)testHasAReadableDescription
{
    assertDescription(@"\"heLLo\" ignoring case", matcher);
}

- (void)testSuccessfulMatchDoesNotGenerateMismatchDescription
{
    assertNoMismatchDescription(matcher, @"hello");
}

- (void)testMismatchDescriptionShowsActualArgument
{
    assertMismatchDescription(@"was \"bad\"", matcher, @"bad");
}

- (void)testDescribeMismatch
{
    assertDescribeMismatch(@"was \"bad\"", matcher, @"bad");
}

@end

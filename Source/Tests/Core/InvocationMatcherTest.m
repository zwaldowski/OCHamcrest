//  OCHamcrest by Jon Reid, http://qualitycoding.org/about/
//  Copyright 2014 hamcrest.org. See LICENSE.txt

    // Class under test
#define HC_SHORTHAND
#import <OCHamcrest/HCInvocationMatcher.h>

    // Collaborators
#import <OCHamcrest/HCIsEqual.h>

    // Test support
#import "AbstractMatcherTest.h"


@interface Match : HCIsEqual
@end

@implementation Match

+ (instancetype)matches:(id)arg
{
    return [[Match alloc] initEqualTo:arg];
}

- (void)describeMismatchOf:(id)item to:(id<HCDescription>)description
{
    [description appendText:@"MISMATCH"];
}

@end


@interface Thingy : NSObject
@end

@implementation Thingy
{
    NSString *result;
}

+ (instancetype) thingyWithResult:(NSString *)result
{
    return [[Thingy alloc] initWithResult:result];
}

- (instancetype)initWithResult:(NSString *)aResult
{
    self = [super init];
    if (self)
        result = aResult;
    return self;
}

- (NSString *)description
{
    return @"Thingy";
}

- (NSString *)result
{
    return result;
}

@end


@interface ShouldNotMatch : NSObject
@end

@implementation ShouldNotMatch

- (NSString *)description
{
    return @"ShouldNotMatch";
}

@end


@interface InvocationMatcherTest : AbstractMatcherTest
@end

@implementation InvocationMatcherTest
{
    HCInvocationMatcher *resultMatcher;
}

- (void)setUp
{
    [super setUp];
    Class aClass = [Thingy class];
    NSMethodSignature *signature = [aClass instanceMethodSignatureForSelector:@selector(result)];
    NSInvocation *invocation = [[[NSInvocation class] class] invocationWithMethodSignature:signature];
    [invocation setSelector:@selector(result)];

    resultMatcher = [[HCInvocationMatcher alloc] initWithInvocation:invocation
                                                           matching:[Match matches:@"bar"]];
}

- (void)tearDown
{
    resultMatcher = nil;
    [super tearDown];
}

- (void)testMatchesFeature
{
    assertMatches(@"invoke on Thingy", resultMatcher, [Thingy thingyWithResult:@"bar"]);
    assertDescription(@"an object with result \"bar\"", resultMatcher);
}

- (void)testMismatchWithDefaultLongDescription
{
    assertMismatchDescription(@"<Thingy> result MISMATCH", resultMatcher,
                              [Thingy thingyWithResult:@"foo"]);
}

- (void)testMismatchWithShortDescription
{
    [resultMatcher setShortMismatchDescription:YES];
    assertMismatchDescription(@"MISMATCH", resultMatcher,
                              [Thingy thingyWithResult:@"foo"]);
}

- (void)testDoesNotMatchNil
{
    assertMismatchDescription(@"was nil", resultMatcher, nil);
}

- (void)testDoesNotMatchObjectWithoutMethod
{
    assertDoesNotMatch(@"was <ShouldNotMatch>", resultMatcher, [[ShouldNotMatch alloc] init]);
}

- (void)testObjectWithoutMethodShortDescriptionIsSameAsLongForm
{
    [resultMatcher setShortMismatchDescription:YES];
    assertDoesNotMatch(@"was <ShouldNotMatch>", resultMatcher, [[ShouldNotMatch alloc] init]);
}

@end

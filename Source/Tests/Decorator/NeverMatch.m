//  Copyright 2014 hamcrest.org. See LICENSE.txt
//  Created by: Jon Reid, http://qualitycoding.org/about/

#import "NeverMatch.h"


@implementation NeverMatch

+ (id)neverMatch
{
    return [[self alloc] init];
}

+ (NSString *)mismatchDescription
{
    return @"NEVERMATCH";
}

- (BOOL)matches:(id)item
{
    return NO;
}

- (void)describeMismatchOf:(id)item to:(id<HCDescription>)mismatchDescription
{
    [mismatchDescription appendText:[NeverMatch mismatchDescription]];
}

@end

//  Copyright 2014 hamcrest.org. See LICENSE.txt
//  Created by: Jon Reid, http://qualitycoding.org/about/

#import "SomeClassAndSubclass.h"


@implementation SomeClass

- (NSString *)description
{
    return @"SOME_CLASS";
}

@end


@implementation SomeSubclass

- (NSString *)description
{
    return @"SOME_SUBCLASS";
}

@end

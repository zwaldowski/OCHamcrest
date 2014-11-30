//  Copyright 2014 hamcrest.org. See LICENSE.txt
//  Created by: Jon Reid, http://qualitycoding.org/about/

#import "HCUnsignedShortReturnGetter.h"


@implementation HCUnsignedShortReturnGetter

- (instancetype)initWithSuccessor:(HCReturnValueGetter *)successor
{
    self = [super initWithType:@encode(unsigned short) successor:successor];
    return self;
}

- (id)returnValueFromInvocation:(NSInvocation *)invocation
{
    unsigned short value;
    [invocation getReturnValue:&value];
    return @(value);
}

@end

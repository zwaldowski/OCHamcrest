//  Copyright 2014 hamcrest.org. See LICENSE.txt
//  Created by: Jon Reid, http://qualitycoding.org/about/

#import "HCDoubleReturnGetter.h"


@implementation HCDoubleReturnGetter

- (instancetype)initWithSuccessor:(HCReturnValueGetter *)successor
{
    self = [super initWithType:@encode(double) successor:successor];
    return self;
}

- (id)returnValueFromInvocation:(NSInvocation *)invocation
{
    double value;
    [invocation getReturnValue:&value];
    return @(value);
}

@end

//  Copyright 2014 hamcrest.org. See LICENSE.txt
//  Created by: Jon Reid, http://qualitycoding.org/about/

#import <Foundation/Foundation.h>


/**
 Chain-of-responsibility for handling NSInvocation return types.
 */
@interface HCReturnValueGetter : NSObject

- (instancetype)initWithType:(char const *)handlerType successor:(HCReturnValueGetter *)successor;
- (id)returnValueOfType:(char const *)type fromInvocation:(NSInvocation *)invocation;

@end

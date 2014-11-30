//  Copyright 2014 hamcrest.org. See LICENSE.txt
//  Created by: Jon Reid, http://qualitycoding.org/about/

#import <Foundation/Foundation.h>

@class HCTestFailureHandler;


/**
 Returns chain of test failure handlers.

 @ingroup integration
 */
FOUNDATION_EXPORT HCTestFailureHandler *HC_testFailureHandlerChain(void);

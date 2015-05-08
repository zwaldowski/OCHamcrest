//  OCHamcrest by Jon Reid, http://qualitycoding.org/about/
//  Copyright 2014 hamcrest.org. See LICENSE.txt

#import "HCTestFailureHandlerChain.h"

#import "HCGenericTestFailureHandler.h"
#import "HCSenTestFailureHandler.h"
#import "HCXCTestFailureHandler.h"


HCTestFailureHandler *HC_testFailureHandlerChain(void)
{
    static HCTestFailureHandler *chain = nil;
    if (!chain)
    {
        HCTestFailureHandler *genericHandler = [[HCGenericTestFailureHandler alloc] initWithSuccessor:nil];
        HCTestFailureHandler *xctestHandler = [[HCXCTestFailureHandler alloc] initWithSuccessor:genericHandler];
        chain =  xctestHandler;
    }
    return chain;
}

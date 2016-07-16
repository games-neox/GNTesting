//
//  GNAsyncTaskTokenTest.m
//  GNTesting
//
//  Created by Games Neox - 2016
//  Copyright © 2016 Games Neox. All rights reserved.
//

#import "GNAsyncTaskTokenTest.h"

#import <GNExceptions/GNIllegalArgumentException.h>



@implementation GNAsyncTaskTokenTest (Death)

/**
 * invalid (negative) timeOut provided
 */
- (void)testDeathLock
{
    XCTAssertThrowsSpecificNamed([asyncTaskToken_ lock:((NSTimeInterval) -1.f)], GNIllegalArgumentException,
            [GNIllegalArgumentException defaultName]);
}

@end

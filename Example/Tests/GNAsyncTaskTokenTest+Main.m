//
//  GNAsyncTaskTokenTest.m
//  GNTesting
//
//  Created by Games Neox - 2016
//  Copyright © 2016 Games Neox. All rights reserved.
//

#import "GNAsyncTaskTokenTest.h"



@implementation GNAsyncTaskTokenTest (Main)

/**
 * correct flow
 */
- (void)testUnlock
{
    [asyncTaskToken_ unlock];
}


/**
 * correct flow
 */
- (void)testGNAsyncTaskToken
{
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_BACKGROUND, 0ul), ^{
        [asyncTaskToken_ unlock];
    });

    XCTAssertTrue([asyncTaskToken_ lock:DEFAULT_TIME_OUT_S]);
}

@end

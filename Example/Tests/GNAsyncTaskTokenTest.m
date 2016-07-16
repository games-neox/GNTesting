//
//  GNAsyncTaskTokenTest.m
//  GNTesting
//
//  Created by Games Neox - 2016
//  Copyright © 2016 Games Neox. All rights reserved.
//

#import "GNAsyncTaskTokenTest.h"



@implementation GNAsyncTaskTokenTest

- (void)setUp
{
    [super setUp];

    asyncTaskToken_ = [GNAsyncTaskToken createNew];
}


- (void)tearDown
{
    asyncTaskToken_ = nil;

    [super tearDown];
}

@end

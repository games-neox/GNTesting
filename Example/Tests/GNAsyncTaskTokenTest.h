//
//  GNAsyncTaskTokenTest.h
//  GNTesting
//
//  Created by Games Neox - 2016
//  Copyright © 2016 Games Neox. All rights reserved.
//

#import <XCTest/XCTest.h>

#import "GNAsyncTaskToken.h"

#define DEFAULT_TIME_OUT_S ((NSTimeInterval) 5.f)



__attribute__((objc_subclassing_restricted))
@interface GNAsyncTaskTokenTest : XCTestCase
{
@private
    GNAsyncTaskToken* asyncTaskToken_;
}

@end

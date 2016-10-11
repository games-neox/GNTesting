//
//  GNAsyncTaskToken.m
//  TicTacToe
//
//  Created by Games Neox - 2016
//  Copyright © 2016 Games Neox. All rights reserved.
//

#import <GNTesting/GNAsyncTaskToken.h>

#import <GNExceptions/GNIllegalArgumentException.h>
#import <GNLog/GNLog.h>
#import <GNPreconditions/GNPreconditions.h>



@interface GNAsyncTaskToken ()
{
@private
    NSCondition* condition_;
    BOOL externalTaskFinished_;
}

@end


static const NSString* const LOG_TAG = @"AsyncTaskToken";


@implementation GNAsyncTaskToken

+ (instancetype)createNew
{
    LOG_WRITE_VERBOSE(LOG_TAG, @"createNew(): Enter");

    GNAsyncTaskToken* thiz = [[GNAsyncTaskToken alloc] init];

    thiz->condition_ = [[NSCondition alloc] init];
    thiz->externalTaskFinished_ = NO;

    LOG_PRINT_VERBOSE(LOG_TAG, @"createNew(): Exit(%@)", thiz);

    return thiz;
}


- (BOOL)lock:(NSTimeInterval)timeOut
{
    [GNPreconditions checkCondition:(((NSTimeInterval) 0.f) < timeOut) :[GNIllegalArgumentException class]
            :@"0.f < timeOut !"];

    LOG_PRINT_VERBOSE(LOG_TAG, @"lock(%f): Enter", timeOut);

    BOOL returnValue = YES;

    [condition_ lock];

    while (!externalTaskFinished_) {
        if (NO == [condition_ waitUntilDate:[NSDate dateWithTimeIntervalSinceNow:timeOut]]) {
            if (!externalTaskFinished_) {
                LOG_PRINT_WARN(LOG_TAG, @"lock(%f): waiting failed!", timeOut);

                returnValue = NO;

                break;
            }
        }
    }

    [condition_ unlock];

    LOG_PRINT_VERBOSE(LOG_TAG, @"lock(%f): Exit(%d)", timeOut, returnValue);

    return returnValue;
}


- (void)unlock
{
    LOG_WRITE_VERBOSE(LOG_TAG, @"unlock(): Enter");

    [condition_ lock];

    externalTaskFinished_ = YES;

    [condition_ signal];
    [condition_ unlock];
    
    LOG_WRITE_VERBOSE(LOG_TAG, @"unlock(): Exit");
}

@end

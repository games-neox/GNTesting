//
//  GNAsyncTaskToken.h
//  GNTesting
//
//  Created by Games Neox - 2016
//  Copyright © 2016 Games Neox. All rights reserved.
//

#import <Foundation/Foundation.h>



@interface GNAsyncTaskToken : NSObject

+ (instancetype)createNew;

/**
 * @pre {@code timeOut} is positive
 *
 * @return {@code NO} in case of a time-out, otherwise - {@code YES}
 */
- (BOOL)lock:(NSTimeInterval)timeOut;

- (void)unlock;

@end

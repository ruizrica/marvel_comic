//
//  Constants.h
//  marvel-comic
//
//  Created by Ricardo Ruiz on 8/15/21.
//

#import <Foundation/Foundation.h>

#pragma mark - UUID
#define kUUID [[NSUUID UUID] UUIDString]

#pragma mark - Timestamp
#define kTimestamp [NSNumber numberWithLong:([[NSDate now] timeIntervalSince1970])]

NS_ASSUME_NONNULL_BEGIN

@interface Constants : NSObject
@end

NS_ASSUME_NONNULL_END

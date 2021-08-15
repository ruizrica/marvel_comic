//
//  Constants.h
//  marvel-comic
//
//  Created by Ricardo Ruiz on 8/15/21.
//

#import <Foundation/Foundation.h>
#import <CommonCrypto/CommonDigest.h>

#pragma mark - UUID
#define kUUID [[NSUUID UUID] UUIDString]

#pragma mark - API
#define kComicID @"6770"
#define kAPIEndpoint @"http://gateway.marvel.com/v1/public/comics?ts="
#define kAPIPrefix @"&apikey="

#pragma mark - Timestamp
#define kTimestamp [NSNumber numberWithLong:([[NSDate now] timeIntervalSince1970]*1000)]

NS_ASSUME_NONNULL_BEGIN

@interface Constants : NSObject
+ (NSString *)generateMD5Hash:(NSString *)input;
@end

NS_ASSUME_NONNULL_END

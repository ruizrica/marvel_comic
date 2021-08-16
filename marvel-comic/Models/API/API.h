//
//  API.h
//  marvel-comic
//
//  Created by Ricardo Ruiz on 8/15/21.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

#pragma mark - Completion Blocks
typedef void(^comicHandler)(NSDictionary *result);

@interface API : NSObject
+ (void)loadComic:(comicHandler)handler;
@end

NS_ASSUME_NONNULL_END

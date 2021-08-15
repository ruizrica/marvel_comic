//
//  Constants.m
//  marvel-comic
//
//  Created by Ricardo Ruiz on 8/15/21.
//

#import "Constants.h"

@implementation Constants
+ (NSString *)generateMD5Hash:(NSString *)input {
    
    const char *cStr = [input UTF8String];
    unsigned char result[CC_MD5_DIGEST_LENGTH];
    
    // Warning IGNORED, following API documentation:
    // https://developer.marvel.com/documentation/authorization
    // MD5 Digest must be used
    
    CC_MD5( cStr, strlen(cStr), result );
    return [NSString stringWithFormat:@"%02X%02X%02X%02X%02X%02X%02X%02X%02X%02X%02X%02X%02X%02X%02X%02X",
        result[0], result[1],
        result[2], result[3],
        result[4], result[5],
        result[6], result[7],
        result[8], result[9],
        result[10], result[11],
        result[12], result[13],
        result[14], result[15]
    ];
}
@end

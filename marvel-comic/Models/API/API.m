//
//  API.m
//  marvel-comic
//
//  Created by Ricardo Ruiz on 8/15/21.
//

#import "API.h"
#import "Constants.h"

@implementation API

+ (void)loadComic:(comicHandler)handler {
    
    @try {
        // hash - md5(ts+privateKey+publicKey)
        NSString *privateKey = [[NSBundle mainBundle] objectForInfoDictionaryKey:@"kAPI_PrivateKey"];
        NSString *publicKey = [[NSBundle mainBundle] objectForInfoDictionaryKey:@"kAPI_PublicKey"];
        NSString *hash = [NSString stringWithFormat:@"%@%@%@",kTimestamp,privateKey,publicKey];
        
        NSError *error = nil;
        NSString *urlString = [NSString stringWithFormat:@"%@ts=%@%@%@%@&hash=%@",kAPIEndpoint,kTimestamp,kComicID,kAPIPrefix,publicKey,hash];
        NSURL *url = [NSURL URLWithString:urlString];
        NSURLSessionConfiguration *config = [NSURLSessionConfiguration defaultSessionConfiguration];
        NSURLSession *session = [NSURLSession sessionWithConfiguration:config];
        NSMutableURLRequest *request = [[NSMutableURLRequest alloc] initWithURL:url];
        request.HTTPMethod = @"GET";

        if (!error) {
            NSURLSessionTask *task = [session dataTaskWithRequest:request completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
                
                NSDictionary *resultsDictionary = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableLeaves error:nil];
                handler(YES,resultsDictionary);
            }];
            [task resume];

            
            
            
//            NSURLSessionUploadTask *uploadTask = [session uploadTaskWithRequest:request
//               fromData:[NSJSONSerialization dataWithJSONObject:payload options:NSJSONWritingPrettyPrinted error:&error] completionHandler:^(NSData *data,NSURLResponse *response,NSError *error) {
//
//                NSDictionary *resultsDictionary = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableLeaves error:nil];
//                handler(YES,resultsDictionary);
//            }];
//            [uploadTask resume];
        } else {
            handler(NO,@{@"error":error});
        }
    } @catch (NSException *exception) {
        NSLog(@"Error Creating Sale Order: %@",exception);
    }
}

@end

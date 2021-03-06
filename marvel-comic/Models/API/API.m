//
//  API.m
//  marvel-comic
//
//  Created by Ricardo Ruiz on 8/15/21.
//

#import "API.h"
#import "Constants.h"
#import "NSString+NSHash.h"

#pragma mark - API
#define kComicID @"6770"
#define kAPIEndpoint @"http://gateway.marvel.com/v1/public/comics/"

@implementation API

+ (void)loadComic:(comicHandler)handler {
    
    @try {
        // hash - md5(ts+privateKey+publicKey)
        NSString *timestamp = [NSString stringWithFormat:@"%@",kTimestamp];
        NSString *privateKey = [[NSBundle mainBundle] objectForInfoDictionaryKey:@"kAPI_PrivateKey"];
        NSString *publicKey = [[NSBundle mainBundle] objectForInfoDictionaryKey:@"kAPI_PublicKey"];
        NSString *hash = [[NSString stringWithFormat:@"%@%@%@",timestamp,privateKey,publicKey] MD5];

        NSError *error = nil;
        NSMutableString *urlString = [NSMutableString stringWithFormat:@"%@%@",kAPIEndpoint,kComicID];
        [urlString appendString:[NSString stringWithFormat:@"?apikey=%@",publicKey]];
        [urlString appendString:[NSString stringWithFormat:@"&ts=%@",timestamp]];
        [urlString appendString:[NSString stringWithFormat:@"&hash=%@",hash]];
        
        NSURL *url = [NSURL URLWithString:urlString];
        NSURLSessionConfiguration *config = [NSURLSessionConfiguration defaultSessionConfiguration];
        NSURLSession *session = [NSURLSession sessionWithConfiguration:config];
        NSMutableURLRequest *request = [[NSMutableURLRequest alloc] initWithURL:url];
        request.HTTPMethod = @"GET";

        if (!error) {
            NSURLSessionTask *task = [session dataTaskWithRequest:request completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
                
                NSDictionary *resultsDictionary = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableLeaves error:nil];
                NSDictionary *comic = resultsDictionary[@"data"][@"results"][0];
                [API loadResource:comic[@"stories"][@"items"][0][@"resourceURI"] with:^(NSDictionary * _Nonnull result) {
                    
                    NSMutableDictionary *payload = [[NSMutableDictionary alloc]init];
                    [payload setObject:comic[@"title"] forKey:@"title"];
                    [payload setObject:[NSString stringWithFormat:@"%@.jpg",comic[@"thumbnail"][@"path"]] forKey:@"imageUrl"];
                    [payload setObject:result forKey:@"description"];
                    [payload setObject:[NSString stringWithFormat:@"%@",comic[@"issueNumber"]]  forKey:@"issueNumber"];
                    handler(payload);
                }];
            }];
            [task resume];

        } else {
            handler(@{@"error":error});
        }
    } @catch (NSException *exception) {
        NSLog(@"Error Loading Comic: %@",exception);
    }
}

+ (void)loadResource:(NSString *)resourceURI with:(comicHandler)handler {
    
    @try {
        // hash - md5(ts+privateKey+publicKey)
        NSString *timestamp = [NSString stringWithFormat:@"%@",kTimestamp];
        NSString *privateKey = [[NSBundle mainBundle] objectForInfoDictionaryKey:@"kAPI_PrivateKey"];
        NSString *publicKey = [[NSBundle mainBundle] objectForInfoDictionaryKey:@"kAPI_PublicKey"];
        NSString *hash = [[NSString stringWithFormat:@"%@%@%@",timestamp,privateKey,publicKey] MD5];

        NSError *error = nil;
        NSMutableString *urlString = [NSMutableString stringWithFormat:@"%@",resourceURI];
        [urlString appendString:[NSString stringWithFormat:@"?apikey=%@",publicKey]];
        [urlString appendString:[NSString stringWithFormat:@"&ts=%@",timestamp]];
        [urlString appendString:[NSString stringWithFormat:@"&hash=%@",hash]];
        
        NSURL *url = [NSURL URLWithString:urlString];
        NSURLSessionConfiguration *config = [NSURLSessionConfiguration defaultSessionConfiguration];
        NSURLSession *session = [NSURLSession sessionWithConfiguration:config];
        NSMutableURLRequest *request = [[NSMutableURLRequest alloc] initWithURL:url];
        request.HTTPMethod = @"GET";

        if (!error) {
            NSURLSessionTask *task = [session dataTaskWithRequest:request completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
                
                NSDictionary *resultsDictionary = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableLeaves error:nil];
                NSDictionary *resource = resultsDictionary[@"data"][@"results"][0];
                handler(resource[@"description"]);
            }];
            [task resume];

        } else {
            handler(@{@"error":error});
        }
    } @catch (NSException *exception) {
        NSLog(@"Error Loading Resource: %@",exception);
    }
}

@end

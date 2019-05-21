//
//  JNHCardController.m
//  deckOfOneCards
//
//  Created by Jordan Hendrickson on 5/21/19.
//  Copyright © 2019 Jordan Hendrickson. All rights reserved.
//

#import "JNHCardController.h"

@implementation JNHCardController

+(void)fetchCardWithCompletion:(void (^)(JNHCard * _Nullable))completion
{
    NSURL *baseURL = [NSURL URLWithString: @"https://deckofcardsapi.com/api/deck/new/draw/?count=1"];
    
    NSLog(@"%@", [baseURL absoluteString]);
    
    [[[NSURLSession sharedSession] dataTaskWithURL:baseURL completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        if (error) {
            NSLog(@"There was an error in %s: %@, %@" , __PRETTY_FUNCTION__, error, [error localizedDescription]);
            completion(nil);
            return;
        }
        if (data) {
            NSDictionary *jsonDictionary = [NSJSONSerialization JSONObjectWithData:data options:0 error:&error];
            JNHCard *card = [[JNHCard alloc] initWithDictionary:jsonDictionary];
            completion(card);
            return;
        }
//        completion(nil);
    }] resume];
}

+(void) fetchImageAt:(NSString *)urlString completion:(void (^)(UIImage * _Nullable))completion
{
    NSURL *url = [NSURL URLWithString:urlString];
    NSLog(@"%@", [url absoluteString]);
    
    [[[NSURLSession sharedSession] dataTaskWithURL:url completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        if (error) {
            NSLog(@"There was an error in %s: %@, %@" , __PRETTY_FUNCTION__, error, [error localizedDescription]);
            completion(nil);
            return;
        }
        if(data) {
            UIImage *cardImage = [UIImage imageWithData:data];
            completion(cardImage);
            return;
        }
        completion(nil);
    }]resume];
}

@end

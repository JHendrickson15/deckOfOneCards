//
//  JNHCard.m
//  deckOfOneCards
//
//  Created by Jordan Hendrickson on 5/21/19.
//  Copyright © 2019 Jordan Hendrickson. All rights reserved.
//

#import "JNHCard.h"

@implementation JNHCard

- (instancetype) initWithImage:(NSString *)image suit:(NSString *)suit
{
    self = [super init];
    if (self) {
        _image = image;
        _suit = suit;
    }
    return self;
}

-(instancetype)initWithDictionary:(NSDictionary *)dictionary
{
    NSDictionary *cardDictionary = dictionary[@"cards"][0];
    
    NSString *imageThing = [cardDictionary objectForKey:@"image"];
    
    NSString *suit = cardDictionary[@"suit"];
    
    if(![imageThing isKindOfClass:[NSString class]] || ![suit isKindOfClass: [NSString class]]){
        return nil;
    }
    return [self initWithImage:imageThing suit:suit];
}
@end

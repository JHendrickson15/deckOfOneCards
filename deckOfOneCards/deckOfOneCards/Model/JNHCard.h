//
//  JNHCard.h
//  deckOfOneCards
//
//  Created by Jordan Hendrickson on 5/21/19.
//  Copyright © 2019 Jordan Hendrickson. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface JNHCard : NSObject

@property (nonatomic, copy, readonly) NSString *image;

@property (nonatomic, copy, readonly) NSString *suit;

-(instancetype)initWithImage: (NSString *)image suit: (NSString *)suit;

-(instancetype)initWithDictionary: (NSDictionary *)dictionary;

@end

NS_ASSUME_NONNULL_END

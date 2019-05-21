//
//  JNHCardController.h
//  deckOfOneCards
//
//  Created by Jordan Hendrickson on 5/21/19.
//  Copyright © 2019 Jordan Hendrickson. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "JNHCard.h"

NS_ASSUME_NONNULL_BEGIN

@interface JNHCardController : NSObject

+(void) fetchCardWithCompletion:(void (^) (JNHCard *_Nullable))completion;

+(void) fetchImageAt:(NSString *)urlString completion: (void (^) (UIImage *_Nullable image))completion;


@end

NS_ASSUME_NONNULL_END

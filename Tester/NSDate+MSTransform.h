//
//  NSDate+MSTransform.h
//  MSKit
//
//  Created by Marc Zhao on 2019/10/24.
//  Copyright © 2019 Marc Zhao. All rights reserved.
//




#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface NSDate (MSTransform)
+ (NSString *)transformSince1970Time:(NSString *)time;
+ (NSDate *)dateWithString:(NSString *)string
                    format:(NSString *)format;
@end

NS_ASSUME_NONNULL_END

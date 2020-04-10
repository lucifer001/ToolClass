//
//  NSDate+MSTransform.m
//  MSKit
//
//  Created by Marc Zhao on 2019/10/24.
//  Copyright © 2019 Marc Zhao. All rights reserved.
//

#import "NSDate+MSTransform.h"

@implementation NSDate (MSTransform)
+ (NSString *)transformSince1970Time:(NSString *)time {
    NSNumber *number = [NSNumber numberWithLongLong:[time longLongValue]];
    NSTimeInterval timeInterval = [number longValue];
    NSDate *date = [NSDate dateWithTimeIntervalSince1970:timeInterval];
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc]init];
    [dateFormatter setDateFormat:@"HH:mm"];
    NSString *dateString = [dateFormatter stringFromDate:date];
    return dateString;
}
+ (NSDate*)dateWithString:(NSString *)string format:(NSString *)format {
    NSDateFormatter *inputFormater = [[NSDateFormatter alloc]init];
    [inputFormater setDateFormat:format];
    NSDate *date = [inputFormater dateFromString:string];
    return date;
}
@end

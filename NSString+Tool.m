//
//  NSString+Tool.m
//  TestToolProject
//
//  Created by Lucifer on 14-7-2.
//  Copyright (c) 2014年 Lucifer. All rights reserved.
//

#import "NSString+Tool.h"

@implementation NSString (Tool)

/**
 *
 * @brief: 判断字符串是否有值
 *
 * @return BOOL值__YES非空__NO空
 *
 */
-(BOOL)isExist
{
    if (!self) {
        return NO;
    }
    
    if (self == NULL) {
        return NO;
    }
    
    if ([self isKindOfClass:[NSNull class]]) {
        return NO;
    }
    
    if ([[self stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]] length]==0) {
        return NO;
    }
    return YES;
}

@end

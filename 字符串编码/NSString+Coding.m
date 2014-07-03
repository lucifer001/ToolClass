//
//  NSString+Coding.m
//  TestToolProject
//
//  Created by Lucifer on 14-7-2.
//  Copyright (c) 2014年 Lucifer. All rights reserved.
//

#import "NSString+Coding.h"

@implementation NSString (Coding)

/**
 *
 * @brief: 字符串URLEncode编码
 *
 *
 * @return 编码后的字符串
 *
 */

- (NSString *)urlencode
{
    NSMutableString *output = [NSMutableString string];
    const unsigned char *source = (const unsigned char *)[self UTF8String];
    int sourceLen = strlen((const char *)source);
    for (int i = 0; i < sourceLen; ++i) {
        const unsigned char thisChar = source[i];
        if (thisChar == ' '){
            [output appendString:@"+"];
        } else if (thisChar == '.' || thisChar == '-' || thisChar == '_' || thisChar == '~' ||
                   (thisChar >= 'a' && thisChar <= 'z') ||
                   (thisChar >= 'A' && thisChar <= 'Z') ||
                   (thisChar >= '0' && thisChar <= '9')) {
            [output appendFormat:@"%c", thisChar];
        } else {
            [output appendFormat:@"%%%02X", thisChar];
        }
    }
    return output;
}


@end

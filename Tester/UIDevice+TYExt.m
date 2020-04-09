//
//  UIDevice+TYExt.m
//  Tester
//
//  Created by PEND_Q on 2019/12/28.
//  Copyright © 2019 轻舔指尖. All rights reserved.
//

#import "UIDevice+TYExt.h"
#import "sys/utsname.h"
#import "UIApplication+TYExt.h"

@implementation UIDevice (TYExt)


/// 是否为iPhoneX之后的机型
+ (BOOL)isIPhoneXLater
{
    BOOL isIPhoneX = NO;
    if (@available(iOS 11.0, *)) {
        
        if ([[UIApplication sharedApplication] delegate].window.safeAreaInsets.bottom) {
            isIPhoneX = YES;
        }
        
    } else {
        
        struct utsname systemInfo;
        uname(&systemInfo);
        NSString *platform = [NSString stringWithCString:systemInfo.machine
                                                encoding:NSASCIIStringEncoding];
        if ([platform isEqualToString:@"i386"] || [platform isEqualToString:@"x86_64"]) {
            
            return (CGSizeEqualToSize([UIScreen mainScreen].bounds.size, CGSizeMake(375, 812)) ||
                    CGSizeEqualToSize([UIScreen mainScreen].bounds.size, CGSizeMake(812, 375)) ||
                    CGSizeEqualToSize([UIScreen mainScreen].bounds.size, CGSizeMake(414, 896)) ||
                    CGSizeEqualToSize([UIScreen mainScreen].bounds.size, CGSizeMake(896, 414)));
        }
        
        isIPhoneX =
        [platform isEqualToString:@"iPhone10,3"] ||
        [platform isEqualToString:@"iPhone10,6"] ||
        [platform isEqualToString:@"iPhone11,2"] ||
        [platform isEqualToString:@"iPhone11,4"] ||
        [platform isEqualToString:@"iPhone11,6"] ||
        [platform isEqualToString:@"iPhone11,8"] ||
        [platform isEqualToString:@"iPhone12,1"] ||
        [platform isEqualToString:@"iPhone12,3"] ||
        [platform isEqualToString:@"iPhone12,5"];
    }
    
    return isIPhoneX;
}


/// 是否为iPhone5之前的机型
+ (BOOL)isBeforeIPhone5
{
    if ([UIScreen mainScreen].bounds.size.height <= 568) {
        return YES;
    }
    return NO;
}


/// 获取时间栏高度
+ (CGFloat)statuBarHeight
{
    if (@available(ios 13, *)) {
        UIWindow *window = [UIApplication ty_keyWindow];
        CGFloat height = window.windowScene.statusBarManager.statusBarFrame.size.height;
        return height;
    }
    return CGRectGetHeight([UIApplication sharedApplication].statusBarFrame);
}



@end

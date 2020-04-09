//
//  UIApplication+TYExt.m
//  Tester
//
//  Created by PEND_Q on 2019/12/28.
//  Copyright © 2019 轻舔指尖. All rights reserved.
//

#import "UIApplication+TYExt.h"

@implementation UIApplication (TYExt)

/// iOS13以后获取 keyWindow
+ (UIWindow *)ty_keyWindow
{
    UIWindow *foundWindow = nil;
    NSArray *windows = [[UIApplication sharedApplication] windows];
    for (UIWindow *window in windows) {
        if (window.isKeyWindow) {
            foundWindow = window;
            break;
        }
    }
    return foundWindow;
}


@end

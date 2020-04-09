//
//  UIDevice+TYExt.h
//  Tester
//
//  Created by PEND_Q on 2019/12/28.
//  Copyright © 2019 轻舔指尖. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIDevice (TYExt)

/// 是否为iPhoneX之后的机型
+ (BOOL)isIPhoneXLater;

/// 是否为iPhone5之前的机型
+ (BOOL)isBeforeIPhone5;

@end

NS_ASSUME_NONNULL_END

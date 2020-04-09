//
//  UIApplication+TYExt.h
//  Tester
//
//  Created by PEND_Q on 2019/12/28.
//  Copyright © 2019 轻舔指尖. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIApplication (TYExt)

/// iOS13以后获取 keyWindow
+ (UIWindow *)ty_keyWindow API_AVAILABLE(ios(3.0)) ;

@end

NS_ASSUME_NONNULL_END

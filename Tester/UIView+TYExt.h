//
//  UIView+TYExt.h
//  Tester
//
//  Created by PEND_Q on 2019/12/28.
//  Copyright © 2019 轻舔指尖. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIView (TYExt)


/// 渐变半透明效果
/// @param startY 开始Y轴坐标点
/// @param endY 结束Y轴坐标点
- (void)transparentGradientStartY:(CGFloat)startY
                             endY:(CGFloat)endY;

@end

NS_ASSUME_NONNULL_END

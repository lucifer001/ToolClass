//
//  UIView+TYExt.m
//  Tester
//
//  Created by PEND_Q on 2019/12/28.
//  Copyright © 2019 轻舔指尖. All rights reserved.
//

#import "UIView+TYExt.h"

@implementation UIView (TYExt)

/// 渐变半透明效果
/// @param startY 开始Y轴坐标点
/// @param endY 结束Y轴坐标点
- (void)transparentGradientStartY:(CGFloat)startY
                             endY:(CGFloat)endY
{
    CAGradientLayer *_gradLayer = [CAGradientLayer layer];
    NSArray *colors = [NSArray arrayWithObjects:
                       (id)[[UIColor colorWithWhite:0 alpha:0] CGColor],
                       (id)[[UIColor colorWithWhite:0 alpha:0.5] CGColor],
                       (id)[[UIColor colorWithWhite:0 alpha:1] CGColor],
                       nil];
    [_gradLayer setColors:colors];
    [_gradLayer setStartPoint:CGPointMake(0.0f, startY)];
    [_gradLayer setEndPoint:CGPointMake(0.0f, endY)];
    [_gradLayer setFrame:self.bounds];
    [self.layer setMask:_gradLayer];
}


/// 添加渐变色
/// 仅支持2种颜色的渐变
/// @param colors 颜色数组
- (void)addJianbianWithColors:(NSArray <UIColor *>*)colors
{
    CAGradientLayer *gradientLayer = [CAGradientLayer layer];
    NSMutableArray *cgColors = [[NSMutableArray alloc] init];
    for (UIColor *color in colors) {
        [cgColors addObject:(__bridge id)(color.CGColor)];
    }
    gradientLayer.colors = cgColors;
    gradientLayer.locations = @[@0.5, @1.0];
    gradientLayer.startPoint = CGPointMake(0, 0);
    gradientLayer.endPoint = CGPointMake(1.0, 0);
    gradientLayer.frame = self.bounds;
    [self.layer addSublayer:gradientLayer];
}


/// 开始旋转动画
- (void)startRotateAnimation
{
    CABasicAnimation *rotationAnimation;
    rotationAnimation = [CABasicAnimation animationWithKeyPath:@"transform.rotation.z"];
    rotationAnimation.toValue = [NSNumber numberWithFloat:M_PI * 2.0];
    rotationAnimation.duration = 1;
    rotationAnimation.repeatCount = HUGE_VALF;
    [self.layer addAnimation:rotationAnimation forKey:@"rotationAnimation"];
}
/// 结束旋转动画
- (void)stopRotateAnimation
{
    [self.layer removeAllAnimations];
}


/// 添加系统圆角
/// @param radius 圆角角度
/// @param isWillHide 视图是否将会被隐藏
- (void)addSystomCornerRadius:(CGFloat)radius willHide:(BOOL)isWillHide
{
    self.layer.cornerRadius = radius;
    self.layer.masksToBounds = YES;
    self.layer.shouldRasterize = YES;
    self.layer.rasterizationScale = [UIScreen mainScreen].scale;
    self.layer.opaque = !isWillHide;
}

@end

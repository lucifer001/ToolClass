//
//  UITextField+Extended.m
//  VetNX
//
//  Created by Marc Zhao on 2017/11/13.
//  Copyright © 2017年 VeNX Corporation Ltd. All rights reserved.
//

#import "UITextField+Extended.h"

@implementation UITextField (Extended)
- (void)addBottomLineWithColor:(UIColor *)color {
    CALayer *borderLayer = [CALayer layer];
    CGFloat borderWidth = 2;
    borderLayer.name = @"bottomLine";
    borderLayer.borderColor = color.CGColor;
    borderLayer.frame = CGRectMake(0, self.frame.size.height - borderWidth, self.frame.size.width, 4);
    borderLayer.borderWidth = borderWidth;
    [self.layer addSublayer:borderLayer];
    self.layer.masksToBounds = YES;
    
}
- (void)removeBottomLine {
    [[self.layer.sublayers copy] enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        CALayer *subLayer = obj;
        if ([[subLayer name] isEqualToString:@"bottomLine"]) {
            [subLayer removeFromSuperlayer];
        }
    }];
}
@end

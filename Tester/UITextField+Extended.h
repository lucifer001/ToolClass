//
//  UITextField+Extended.h
//  VetNX
//
//  Created by Marc Zhao on 2017/11/13.
//  Copyright © 2017年 VeNX Corporation Ltd. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UITextField (Extended)

/**
 add the bottom line to the TextField
 */
- (void)addBottomLineWithColor:(UIColor*)color;

/**
 remove the bottom line from the TextField 
 */
- (void)removeBottomLine;
@end

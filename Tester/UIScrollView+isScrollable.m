//
//  UIScrollView+isScrollable.m
//  MemoryChain
//
//  Created by Marc Zhao on 2020/2/11.
//  Copyright © 2020 Memory Chain network technology(China) co,LTD. All rights reserved.
//

#import "UIScrollView+isScrollable.h"



@implementation UIScrollView (isScrollable)
- (BOOL)isScrollable {
    return (self.isDragging && !self.decelerating ) || self.tracking;
}
@end

//
//  TYMacro.h
//  Tester
//
//  Created by PEND_Q on 2020/4/16.
//  Copyright © 2020 轻舔指尖. All rights reserved.
//

#ifndef TYMacro_h
#define TYMacro_h

// 懒加载
#ifndef LazyLoading
#define LazyLoading(_type_, _ivar_) \
- (_type_ *)_ivar_ { \
if (! _##_ivar_) { \
_##_ivar_ = [[_type_ alloc] init]; \
} \
return _##_ivar_; \
}
#endif

// 颜色
#define RGBA_COLOR(r, g, b, a) [UIColor colorWithRed:(r)/255.f green:(g)/255.f blue:(b)/255.f alpha:(a)]
#define HEX_RGBA_COLOR(rgbValue,a) [UIColor colorWithRed:((float)(((rgbValue) & 0xFF0000) >> 16))/255.0 \
green:((float)(((rgbValue) & 0x00FF00) >> 8))/255.0 \
blue:((float)((rgbValue) & 0x0000FF))/255.0 \
alpha:a]

// 屏幕宽高
#define HCDW CGRectGetWidth([UIScreen mainScreen].bounds) // 屏幕宽
#define HCDH CGRectGetHeight([UIScreen mainScreen].bounds) // 屏幕高


#endif /* TYMacro_h */

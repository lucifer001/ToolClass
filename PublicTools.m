//
//  PublicTools.m
//  ToolsDemo
//
//  Created by Tianyu on 15/4/1.
//  Copyright (c) 2015年 com.hoolai. All rights reserved.
//

#import "PublicTools.h"


@implementation PublicTools

/**
 *  根据字符串计算文字尺寸
 *
 *  @param tFont   字体大小
 *  @param consize 固定宽或固定高的size【例：CGSizeMake(10000.0f, 19.0f)为固定高，算宽度】
 *  @param text    要计算的字符串
 *
 *  @return 结果尺寸【结果宽/高要用ceilf()函数处理下】
 */
+ (CGSize)sizeWithFont:(UIFont*)tFont constrainedToSize:(CGSize)consize text:(NSString *)text
{
    if (!(text.length>0)) {
        text = @"";
    }
    CGSize contentTextSize = CGSizeZero;
    NSAttributedString *attrStr = [[NSAttributedString alloc] initWithString:text attributes:@{NSFontAttributeName: tFont}];
    
    contentTextSize = [attrStr boundingRectWithSize:consize // 用于计算文本绘制时占据的矩形块
                                            options:NSStringDrawingUsesLineFragmentOrigin // 文本绘制时的附加选项
                                            context:nil].size; // context上下文。包括一些
    contentTextSize = CGSizeMake(contentTextSize.width, contentTextSize.height);
    return contentTextSize;
    
}

@end

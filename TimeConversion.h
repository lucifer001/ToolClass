//
//  TimeConversion.h
//  ToolsDemo
//
//  Created by Tianyu on 15/4/1.
//  Copyright (c) 2015年 com.hoolai. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface TimeConversion : NSObject

/**
 *  时间戳转字符串
 *
 *  @param time 时间戳（格式：毫秒）
 *  @param str  转出格式（例:yyyy-MM-dd）
 *
 *  @return 结果字符串
 */
+ (NSString *)dateStrConvertTime:(double)time withConcertStr:(NSString *)str;

/**
 *  字符串转时间戳
 *
 *  @param dateStr   时间字符串
 *  @param str       转出格式（例:yyyy-MM-dd）
 *  @param since1970 是否从1970年算起
 *
 *  @return 结果时间戳
 */
+ (double)timeConvertDateStr:(NSString *)dateStr withConcertStr:(NSString *)str isSince1970:(BOOL)since1970;

/**
 *  时间戳转NSDate
 *
 *  @param time 时间戳（格式：毫秒）
 *
 *  @return 结果NSDate
 */
+ (NSDate *)dateConvertTime:(double)time;

/**
 *  NSDate转时间戳
 *
 *  @param date      NSDate
 *  @param since1970 是否从1970年算起
 *
 *  @return 结果时间戳（单位：毫秒）
 */
+ (double)timeConvertDate:(NSDate *)date isSince1970:(BOOL)since1970;

/**
 *  字符串转NSDate
 *
 *  @param dateString 时间字符串（例：1990-07-31）
 *  @param format     转出格式（例:yyyy-MM-dd）
 *
 *  @return 结果NSDate
 */
+ (NSDate *)dateFromString:(NSString*)dateString format:(NSString *)format;

/**
 *  NSDate转字符串
 *
 *  @param date   NSDate
 *  @param format 转出格式（例:yyyy-MM-dd）
 *
 *  @return 结果字符串
 */
+ (NSString *)stringFromDate:(NSDate *)date format:(NSString *)format;

/**
 *  获取某日期前后间隔X月的日期
 *
 *  @param date  某日期
 *  @param month 前后多少月（正数时某日期之后多少月，负数为某日期之前多少月）
 *
 *  @return 结果日期
 */
+ (NSDate *)getPriousorLaterDateFromDate:(NSDate *)date withMonth:(int)month;

/**
 *  int型转换成时间格式
 *
 *  @param value
 *
 *  @return 00:00:00
 */
+ (NSString *)getFormatTimeWithValue:(NSInteger)value;

/**
 *  int型拼接时间字符串
 *
 *  @param timeSecond value
 *
 *  @return 00/00:00/00:00:00
 */
+ (NSString *)timeStringFromTimeSecond:(NSInteger)timeSecond;

@end

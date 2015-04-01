//
//  TimeConversion.m
//  ToolsDemo
//
//  Created by Tianyu on 15/4/1.
//  Copyright (c) 2015年 com.hoolai. All rights reserved.
//

#import "TimeConversion.h"
#import <UIKit/UIKit.h>

@implementation TimeConversion

#pragma mark - 【时间戳】与【字符串】互转
/**
 *  时间戳转字符串
 *
 *  @param time 时间戳（格式：毫秒）
 *  @param str  转出格式（例:yyyy-MM-dd）
 *
 *  @return 结果字符串
 */
+ (NSString *)dateStrConvertTime:(double)time withConcertStr:(NSString *)str
{
    NSDateFormatter *formatter;
    NSDate *temp;
    temp = [NSDate dateWithTimeIntervalSince1970:time/1000];
    formatter = [[NSDateFormatter alloc] init];
    [formatter setDateFormat:str];
    return [formatter stringFromDate:temp];
}

/**
 *  字符串转时间戳
 *
 *  @param dateStr   时间字符串
 *  @param str       转出格式（例:yyyy-MM-dd）
 *  @param since1970 是否从1970年算起
 *
 *  @return 结果时间戳
 */
+ (double)timeConvertDateStr:(NSString *)dateStr withConcertStr:(NSString *)str isSince1970:(BOOL)since1970
{
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init] ;
    [formatter setDateFormat:str];
    NSDate *date = [formatter dateFromString:dateStr];
    if (since1970) {
        return [date timeIntervalSince1970]*1000;
    }
    return [date timeIntervalSinceNow]*1000;
}


#pragma mark - 【时间戳】与【NSDate】互转
/**
 *  时间戳转NSDate
 *
 *  @param time 时间戳（格式：毫秒）
 *
 *  @return 结果NSDate
 */
+ (NSDate *)dateConvertTime:(double)time
{
    return [NSDate dateWithTimeIntervalSince1970:time/1000];
}

/**
 *  NSDate转时间戳
 *
 *  @param date      NSDate
 *  @param since1970 是否从1970年算起
 *
 *  @return 结果时间戳（单位：毫秒）
 */
+ (double)timeConvertDate:(NSDate *)date isSince1970:(BOOL)since1970
{
    if (since1970) {
        return [date timeIntervalSince1970]*1000;
    }
    return [date timeIntervalSinceNow]*1000;
}


#pragma mark - 【字符串】与【NSDate】互转
/**
 *  字符串转NSDate
 *
 *  @param dateString 时间字符串（例：1990-07-31）
 *  @param format     转出格式（例:yyyy-MM-dd）
 *
 *  @return 结果NSDate
 */
+ (NSDate *)dateFromString:(NSString*)dateString format:(NSString *)format
{
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init] ;
    [formatter setDateFormat:format];
    NSDate *date=[formatter dateFromString:dateString];
    return date;
}

/**
 *  NSDate转字符串
 *
 *  @param date   NSDate
 *  @param format 转出格式（例:yyyy-MM-dd）
 *
 *  @return 结果字符串
 */
+ (NSString *)stringFromDate:(NSDate *)date format:(NSString *)format
{
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:format];
    return [dateFormatter stringFromDate:date];
}


/**
 *  获取某日期前后间隔X月的日期
 *
 *  @param date  某日期
 *  @param month 前后多少月（正数时某日期之后多少月，负数为某日期之前多少月）
 *
 *  @return 结果日期
 */
+ (NSDate *)getPriousorLaterDateFromDate:(NSDate *)date withMonth:(int)month
{
    NSDateComponents *comps = [[NSDateComponents alloc] init];
    
    [comps setMonth:month];
    
    NSCalendar *calender;
    if ([[UIDevice currentDevice].systemVersion floatValue] >= 8.0) {
        calender = [[NSCalendar alloc] initWithCalendarIdentifier:NSCalendarIdentifierGregorian];
    } else {
        calender = [[NSCalendar alloc] initWithCalendarIdentifier:NSGregorianCalendar];
    }
    
    NSDate *mDate = [calender dateByAddingComponents:comps toDate:date options:0];
    
    return mDate;
}


/**
 *  int型转换成时间格式
 *
 *  @param value
 *
 *  @return 00:00:00
 */
+ (NSString *)getFormatTimeWithValue:(NSInteger)value
{
    if (value > 0) {
        NSString *result = @"";
        NSInteger hour = 0,minute = 0,second = 0;
        
        hour = value/3600;
        value = value%3600;
        minute = value/60;
        second = value%60;
        
        NSString *hourStr = !(hour < 10) ? [NSString stringWithFormat:@"%ld",(long)hour] : [NSString stringWithFormat:@"0%ld",(long)hour];
        NSString *minuteStr = !(minute < 10) ? [NSString stringWithFormat:@"%ld",(long)minute] : [NSString stringWithFormat:@"0%ld",(long)minute];
        NSString *secondStr = !(second < 10) ? [NSString stringWithFormat:@"%ld",(long)second] : [NSString stringWithFormat:@"0%ld",(long)second];
        
        result = [NSString stringWithFormat:@"%@:%@:%@",hourStr,minuteStr,secondStr];
        
        return result;
        
    } else {
        
        return @"00:00:00";
    }
}


/**
 *  int型拼接时间字符串
 *
 *  @param timeSecond value
 *
 *  @return 00/00:00/00:00:00
 */
+ (NSString *)timeStringFromTimeSecond:(NSInteger)timeSecond
{
    
    
    NSString *timeString = @"";
    if (timeSecond>3600) {
        NSInteger hour = timeSecond/3600;
        if (hour<10) {
            timeString = [NSString stringWithFormat:@"0%ld:",(long)hour];
        }else{
            timeString = [NSString stringWithFormat:@"%ld:",(long)hour];
        }
    }
    
    NSInteger temptime = timeSecond%3600;
    NSInteger min = temptime/60;
    if (min<10) {
        timeString = [timeString stringByAppendingFormat:@"0%ld:",(long)min];
    }else{
        timeString = [timeString stringByAppendingFormat:@"%ld:",(long)min];
    }
    
    
    temptime = timeSecond%60;
    NSInteger second = temptime/60;
    if (second<10) {
        timeString = [timeString stringByAppendingFormat:@"0%ld",(long)second];
    }else{
        timeString = [timeString stringByAppendingFormat:@"%ld",(long)second];
    }
    return timeString;
}


@end

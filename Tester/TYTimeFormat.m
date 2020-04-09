//
//  TYTimeFormat.m
//  Tester
//
//  Created by PEND_Q on 2019/12/28.
//  Copyright © 2019 轻舔指尖. All rights reserved.
//

#import "TYTimeFormat.h"

@implementation TYTimeFormat

/// 将时间戳转换为 xx:xx:xx 格式
/// @param time 时间戳
+ (NSString *)hhmmssWithTime:(NSTimeInterval)time
{
    NSInteger seconds = [@(time) integerValue];
    NSString *hour = [NSString stringWithFormat:@"%02ld",(long)(seconds / 3600)];
    NSString *minute = [NSString stringWithFormat:@"%02ld",(long)((seconds % 3600) / 60)];
    NSString *second = [NSString stringWithFormat:@"%02ld",(long)(seconds % 60)];
    NSString *format_time = [NSString stringWithFormat:@"%@:%@:%@", hour, minute, second];
    return format_time;
}


/// 将时间戳转换为 xx时xx分xx秒
/// @param time 时间戳
+ (NSString *)zh_hhmmssWithTime:(NSTimeInterval)time
{
    NSInteger seconds = [@(time) integerValue];
    NSMutableString *format_time = [@"" mutableCopy];
    NSInteger hour = seconds / 3600;
    NSInteger minute = (seconds % 3600) / 60;
    NSInteger second = seconds % 60;
    if (hour > 0) {
        [format_time appendFormat:@"%ld时", (long)hour];
    }
    if (minute > 0) {
        [format_time appendFormat:@"%ld分钟", (long)minute];
    }
    if (second > 0) {
        [format_time appendFormat:@"%ld秒", (long)minute];
    }
    return format_time;
}


/// 将时间戳转为中文描述  [ 刚刚，x分钟前，x小时前，x月前，年前 ]
/// @param aTime 中文描述
+ (NSString *)zh_dateWithTime:(NSTimeInterval)aTime
{
    NSString *_timestamp = nil;
    time_t t = (time_t)aTime;
    time_t now;
    time(&now);
    int distance = (int)difftime(now, t);
    if (distance < 0)
    {
        distance = 0;
    }
    if (distance < 60)
    {
        _timestamp = [NSString stringWithFormat:@"%@", @"刚刚"];
    }
    else if (distance < 60 * 60)
    {
        distance = distance / 60;
        _timestamp = [NSString stringWithFormat:@"%d%@", distance, @"分钟前"];
    }
    else if (distance < 60 * 60 * 24)
    {
        distance = distance / 60 / 60;
        _timestamp = [NSString stringWithFormat:@"%d%@", distance, @"小时前"];
    }
    else if (distance < 60 * 60 * 24 * 365)
    {
        distance = distance / 60 / 60 / 24 / 30;
        _timestamp = [NSString stringWithFormat:@"%d%@", distance, @"月前"];
    }
    else
    {
        static NSDateFormatter *dateFormatter = nil;
        if (dateFormatter == nil)
        {
            dateFormatter = [[NSDateFormatter alloc] init];
            dateFormatter.dateFormat = @"yyyy-MM-dd";
        }
        NSDate *date = [NSDate dateWithTimeIntervalSince1970:t];
        _timestamp = [dateFormatter stringFromDate:date];
        distance = distance / 60 / 60 / 24 / 365;
        _timestamp = [NSString stringWithFormat:@"%d%@", distance, @"年前"];
    }
    
    return _timestamp;
}


/// 时间戳转格式化
/// @param time 时间戳
/// @param format 格式化标准
+ (NSString *)dateWithTime:(NSTimeInterval)time
                    format:(NSString *)format
{
    NSDate *temp = [NSDate dateWithTimeIntervalSince1970:time];
    NSDateFormatter *formatter= [[NSDateFormatter alloc] init];
    [formatter setDateFormat:format];
    NSString *dateString = [formatter stringFromDate:temp];
    return dateString;
}


/// 格式化字符串转时间戳
/// @param dateStr 时间字符串
/// @param format 格式化标砖
+ (NSTimeInterval)intervalWithDateString:(NSString *)dateStr
                                  format:(NSString *)format
{
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setDateFormat:format];
    NSDate *date = [formatter dateFromString:dateStr];
    NSTimeInterval interval = date.timeIntervalSince1970;
    return interval;
}


/// 将时间戳转换为年龄
/// 时间戳为生日的时间戳
/// @param time 时间戳
+ (NSInteger)ageWithTime:(NSTimeInterval)time
{
    NSDate *date = [NSDate dateWithTimeIntervalSince1970:time];
    
    // 出生日期转换 年月日
    NSDateComponents *components1 = [[NSCalendar currentCalendar] components:NSCalendarUnitDay | NSCalendarUnitMonth | NSCalendarUnitYear fromDate:date];
    NSInteger brithDateYear  = [components1 year];
    NSInteger brithDateDay   = [components1 day];
    NSInteger brithDateMonth = [components1 month];
      
    // 获取系统当前 年月日
    NSDateComponents *components2 = [[NSCalendar currentCalendar] components:NSCalendarUnitDay | NSCalendarUnitMonth | NSCalendarUnitYear fromDate:[NSDate date]];
    NSInteger currentDateYear  = [components2 year];
    NSInteger currentDateDay   = [components2 day];
    NSInteger currentDateMonth = [components2 month];
      
    // 计算年龄
    NSInteger iAge = currentDateYear - brithDateYear - 1;
    if ((currentDateMonth > brithDateMonth) || (currentDateMonth == brithDateMonth && currentDateDay >= brithDateDay)) {
        iAge++;
    }
    return iAge;
}


/// 将时间戳转换为距当前时间的中文时长
/// 如果时长超过1年返回：x年
/// 如果时长不足1年返回：x个月
/// 如果时长不足1个月返回：x天
/// 如果时长不足1天返回：0天
/// @param time 时间戳
+ (NSString *)zh_durationWithTime:(NSTimeInterval)time
{
    NSDate *bornDate = [NSDate dateWithTimeIntervalSince1970:time];
    // 获得当前系统时间
    NSDate *currentDate = [NSDate date];
    // 创建日历(格里高利历)
    NSCalendar *calendar = [NSCalendar currentCalendar];
    // 设置component的组成部分
    NSUInteger unitFlags = NSCalendarUnitYear | NSCalendarUnitMonth | NSCalendarUnitDay | NSCalendarUnitHour | NSCalendarUnitMinute | NSCalendarUnitSecond ;
    // 按照组成部分格式计算出生日期与现在时间的时间间隔
    NSDateComponents *date = [calendar components:unitFlags fromDate:bornDate toDate:currentDate options:0];
     
    if( [date year] > 0) {
        return [NSString stringWithFormat:(@"%ld年"),(long)[date year]];
    } else if([date month] >0) {
        return [NSString stringWithFormat:(@"%ld个月"),(long)[date month]];
    } else if([date day]>0) {
        return [NSString stringWithFormat:(@"%ld天"),(long)[date day]];
    } else {
        return @"0天";
    }
}


/// 比较两个NSDate格式时间的大小
/// 1：start_date < end_date
/// 0：start_date > end_date
/// -1：start_date = end_date
/// @param start_date 比较的第一个时间
/// @param end_date 比较的第二个时间
+ (int)compareStartDate:(NSDate *)start_date endDate:(NSDate *)end_date
{
    int comparisonResult;
    NSComparisonResult result = [start_date compare:end_date];
    switch (result)
    {
        case NSOrderedAscending:
            comparisonResult = 1;
            break;
        case NSOrderedDescending:
            comparisonResult = -1;
            break;
        case NSOrderedSame:
            comparisonResult = 0;
            break;
        default:
            break;
    }
    return comparisonResult;
}

@end

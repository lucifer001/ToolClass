# ToolClass
整理的一些常用的工具方法，持续更新中....


## UIView+TYExt
```
/// 渐变半透明效果
/// @param startY 开始Y轴坐标点
/// @param endY 结束Y轴坐标点
- (void)transparentGradientStartY:(CGFloat)startY
                             endY:(CGFloat)endY;

```


## TYTimeFormat
```
/// 将时间戳转换为 xx:xx:xx 格式
/// @param time 时间戳
+ (NSString *)hhmmssWithTime:(NSTimeInterval)time;

/// 将时间戳转换为 xx时xx分xx秒
/// @param time 时间戳
+ (NSString *)zh_hhmmssWithTime:(NSTimeInterval)time;

/// 将时间戳转为中文描述  [ 刚刚，x分钟前，x小时前，x月前，年前 ]
/// @param aTime 中文描述
+ (NSString *)zh_dateWithTime:(NSTimeInterval)aTime;

/// 时间戳转格式化
/// @param time 时间戳
/// @param format 格式化标准
+ (NSString *)dateWithTime:(NSTimeInterval)time
                    format:(NSString *)format;

/// 格式化字符串转时间戳
/// @param dateStr 时间字符串
/// @param format 格式化标砖
+ (NSTimeInterval)intervalWithDateString:(NSString *)dateStr
                                  format:(NSString *)format;

/// 将时间戳转换为年龄
/// 时间戳为生日的时间戳
/// @param time 时间戳
+ (NSInteger)ageWithTime:(NSTimeInterval)time;

/// 将时间戳转换为距当前时间的中文时长
/// 如果时长超过1年返回：x年
/// 如果时长不足1年返回：x个月
/// 如果时长不足1个月返回：x天
/// 如果时长不足1天返回：0天
/// @param time 时间戳
+ (NSString *)zh_durationWithTime:(NSTimeInterval)time;

/// 比较两个NSDate格式时间的大小
/// 1：start_date < end_date
/// 0：start_date > end_date
/// -1：start_date = end_date
/// @param start_date 比较的第一个时间
/// @param end_date 比较的第二个时间
+ (int)compareStartDate:(NSDate *)start_date endDate:(NSDate *)end_date;

```


## UIDevice+TYExt
```
/// 是否为iPhoneX之后的机型
+ (BOOL)isIPhoneXLater;

/// 是否为iPhone5之前的机型
+ (BOOL)isBeforeIPhone5;
```


## UIApplication+TYExt
```
/// iOS13以后获取 keyWindow
+ (UIWindow *)ty_keyWindow API_AVAILABLE(ios(3.0)) ;
```

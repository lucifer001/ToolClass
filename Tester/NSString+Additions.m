//
//  NSString+Additions.m
//  MSKit
//
//  Created by Marc Zhao on 2019/11/2.
//  Copyright © 2019 Marc Zhao. All rights reserved.
//

#import "NSString+Additions.h"


@implementation NSString (Additions)
+ (NSString *)getAppVersion {
    return [[[NSBundle mainBundle]infoDictionary ] objectForKey:@"CFBundleVersion"];
}
+ (NSString *)documentPath {
    static NSString *path = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        path = [[NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) objectAtIndex:0] copy];
        [NSString addSkipBackupAttributeToItemAtURL:[NSURL fileURLWithPath:path]];
    });
    return path;
}
+ (BOOL)addSkipBackupAttributeToItemAtURL:(NSURL *)URL {
        return YES;
}
+ (NSString *)cachePath {
    static NSString *path = nil;
    if (!path) {
        path = [[NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES) objectAtIndex:0] copy];
        
    }
    return  path;
}
+ (NSString *)formatCurDate {
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc]init];
    [dateFormatter setDateFormat:@"yyyy-MM-DD HH:mm:ss"];
    NSString *result = [dateFormatter stringFromDate:[NSDate date]];
    return  result;
    
}
+ (NSString *)formatCurDayForVersion {
    NSDateFormatter *dateFormatter = [[ NSDateFormatter alloc]init];
    [dateFormatter setDateFormat:@"yyyy.MM.dd"];
    NSString *result = [dateFormatter stringFromDate:[NSDate date]];
    return result;
}
- (NSURL *)toURL {
    //return [NSURL URLWithString:[self]]
    return [NSURL URLWithString:[self stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding]];
}
- (BOOL)isEmpty {
    return nil == self || 0 == [[self stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceCharacterSet]] length];
}
- (NSString *)trim {
    return [self stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
}
- (BOOL)isOlderVersionThan:(NSString *)otherVersion {
    return [self compare:otherVersion options:NSNumericSearch] == NSOrderedAscending;
}
- (BOOL)isNewerVersionThan:(NSString *)otherVersion {
    return [self compare:otherVersion options:NSNumericSearch] == NSOrderedDescending;
}
- (NSString *)removeAllSpace {
    NSString *result = [self stringByReplacingOccurrencesOfString:@" " withString:@""];
    result = [result stringByReplacingOccurrencesOfString:@"   " withString:@""];
    return result;
}
@end

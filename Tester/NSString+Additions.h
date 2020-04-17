//
//  NSString+Additions.h
//  MSKit
//
//  Created by Marc Zhao on 2019/11/2.
//  Copyright © 2019 Marc Zhao. All rights reserved.
//



#import <Foundation/Foundation.h>
#import <objc/runtime.h>

NS_ASSUME_NONNULL_BEGIN

@interface NSString (Additions)
+ (NSString *)documentPath;
+ (NSString *)cachePath;
+ (NSString *)formatCurDate;
+ (NSString *)getAppVersion;
- (NSString *)removeAllSpace;
+ (NSString *)formatCurDayForVersion;
- (NSURL *)toURL;
- (BOOL)isEmail;
- (BOOL)isEmpty;
- (NSString *)md5;
- (NSString *)trim;
- (BOOL) isOlderVersionThan:(NSString *)otherVersion;
- (BOOL)isNewerVersionThan:(NSString *)otherVersion;
@end

NS_ASSUME_NONNULL_END

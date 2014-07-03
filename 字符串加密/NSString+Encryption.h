//
//  NSString+Encryption.h
//  TestToolProject
//
//  Created by Lucifer on 14-7-2.
//  Copyright (c) 2014年 Lucifer. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (Encryption)

/**
 * @brief 使用MD5算法进行签名（16位）
 *
 * @return 签名后字符串
 */
- (NSString *)md5HexDigestString_Ext;

/**
 * @brief 使用MD5算法进行签名（32位）
 *
 * @return 签名后字符串
 */
- (NSString *)md5DHexDigestString_Ext;

/**
 *
 * @brief: DES加密算法
 *
 * @param: plainString 需要加密的字符串
 *
 * @return 加密后的字符串
 *
 */
+ (NSString *)encryptDESPlaintext:(NSString *)plainString;

/**
 *
 * @brief: DES解密算法（暂不支持中文，输出编码不知道用哪个）
 *
 * @param: plainString 需要解密的字符串
 *
 * @return 解密后的字符串
 *
 */
+ (NSString *)encryptDESPlaintext:(NSString *)desString;

@end

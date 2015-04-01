//
//  NSString+Encryption.m
//  TestToolProject
//
//  Created by Lucifer on 14-7-2.
//  Copyright (c) 2014年 Lucifer. All rights reserved.
//

#import "NSString+Encryption.h"
#import <CommonCrypto/CommonHMAC.h>
#import <CommonCrypto/CommonCryptor.h>

@implementation NSString (Encryption)

/**
 * @brief 使用MD5算法进行签名（16位）
 *
 * @return 签名后字符串
 */
- (NSString *)md5HexDigestString_Ext
{
    if (self==nil) {
        return nil;
    }
    return [[self md5DHexDigestString_Ext] substringWithRange:NSMakeRange(8, 16)];
}

/**
 * @brief 使用MD5算法进行签名（32位）
 *
 * @return 签名后字符串
 */
- (NSString *)md5DHexDigestString_Ext
{
    if (self==nil) {
        return nil;
    }
    const char *cStr = [self UTF8String];
    unsigned char result[CC_MD5_DIGEST_LENGTH];
    CC_MD5( cStr, (CC_LONG)strlen(cStr), result ); // This is the md5 call
    
    return [NSString stringWithFormat:
            @"%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x",
            result[0], result[1], result[2], result[3],
            result[4], result[5], result[6], result[7],
            result[8], result[9], result[10], result[11],
            result[12], result[13], result[14], result[15]
            ];
}


/**
 *
 * @brief: DES加密算法
 *
 * @param: plainString 需要加密的字符串
 *
 * @return 加密后的字符串
 *
 */
+ (NSString *)encryptDESPlaintext:(NSString *)plainString
{
    static const char *key = "MySecYYT";
    
    static char buffer [1024];
    memset(buffer, 0, sizeof(buffer));
    size_t numBytesEncrypted;
    
    const char *plaintext = [plainString cStringUsingEncoding:NSUTF8StringEncoding];
    
    CCCryptorStatus cryptStatus = CCCrypt(kCCEncrypt,
                                          kCCAlgorithmDES,
                                          kCCOptionPKCS7Padding|kCCOptionECBMode,
                                          key,
                                          kCCKeySizeDES,
                                          NULL,
                                          plaintext,
                                          strlen(plaintext),
                                          buffer,
                                          1024,
                                          &numBytesEncrypted);
    
    if (cryptStatus == kCCSuccess) {
        NSMutableString *result = [NSMutableString stringWithCapacity:numBytesEncrypted*2];
        for (int i=0; i<numBytesEncrypted; ++i) {
            char c = buffer[i];
            [result appendFormat:@"%02x",c&0xff];
        }
        return result;
    }
    
    return nil;
}


/**
 *
 * @brief: DES解密算法（暂不支持中文，输出编码不知道用哪个）
 *
 * @param: plainString 需要解密的字符串
 *
 * @return 解密后的字符串
 *
 */
+ (NSString *)encryptDESPlaintext:(NSString *)desString
{
    static char buffer [1024];
    memset(buffer, 0, sizeof(buffer));
    size_t numBytesEncrypted;
    
    //conver hex to char
    static char desBuffer[1024];
    memset(desBuffer, 0, sizeof(desBuffer));
    
    const char *desText = [desString cStringUsingEncoding:NSUTF8StringEncoding];
    const int desLength = [desString lengthOfBytesUsingEncoding:NSUTF8StringEncoding];
    char tempChar[3] = "\0\0\0";
    for (int i=0; i<desLength; i+=2) {
        tempChar[0] = desText[i];
        tempChar[1] = desText[i+1];
        char desChar = strtol(tempChar, NULL, 16);
        desBuffer[i/2] = desChar;
    }
    
    CCCryptorStatus cryptStatus = CCCrypt(kCCDecrypt,
                                          kCCAlgorithmDES,
                                          kCCOptionPKCS7Padding|kCCOptionECBMode,
                                          key,
                                          kCCKeySizeDES,
                                          NULL,
                                          desBuffer,
                                          strlen(desBuffer),
                                          buffer,
                                          1024,
                                          &numBytesEncrypted);
    if (cryptStatus == kCCSuccess) {
        
        //        NSStringEncoding enc = CFStringConvertEncodingToNSStringEncoding(kCFStringEncodingShiftJIS_X0213_MenKuTen);
        NSString *plainStr = [NSString stringWithCString:buffer encoding:NSUTF8StringEncoding];
        return plainStr;
    }
    
    return nil;

}
@end

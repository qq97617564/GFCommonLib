//
//  GFAES128.h
//  NLKJ_App
//
//  Created by 王刚锋 on 2018/7/20.
//  Copyright © 2018年 王刚锋. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface GFAES128 : NSObject
/**
 *  加密
 *
 *  @param string 需要加密的string
 *
 *  @return 加密后的字符串
 */
+ (NSString *)AES128EncryptStrig:(NSString *)string withKey:(NSString *)KEY;

/**
 *  解密
 *
 *  @param string 加密的字符串
 *
 *  @return 解密后的内容
 */
+ (NSString *)AES128DecryptString:(NSString *)string withKey:(NSString *)KEY;


+(NSString *)AES128Encrypt:(NSString *)plainText key:(NSString *)key;

+(NSString *)AES128Decrypt:(NSString *)encryptText key:(NSString *)key;
@end

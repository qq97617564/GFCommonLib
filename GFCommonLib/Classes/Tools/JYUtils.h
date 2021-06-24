//
//  JYUtils.h
//  ChatDemo-UI3.0
//
//  Created by Davis on 16/12/27.
//  Copyright © 2016年 Davis. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface JYUtils : NSObject
#pragma mark 正则匹配手机号
+ (BOOL)checkTelNumber:(NSString *)telNumber;
#pragma 正则匹配用户密码6-16位数字和字母组合
+ (BOOL)checkPassword:(NSString *)password;

+ (BOOL)checkAccount:(NSString *)account;
#pragma mark - 是否是纯数字
+ (BOOL)isNumber;
@end

//
//  JYUtils.m
//  ChatDemo-UI3.0
//
//  Created by Davis on 16/12/27.
//  Copyright © 2016年 Davis. All rights reserved.
//

#import "JYUtils.h"

@implementation JYUtils
#pragma 正则匹配手机号
+ (BOOL)checkTelNumber:(NSString *)telNumber
{
    NSString *pattern =@"^1[3|4|5|7|8][0-9]\\d{8}";
    NSPredicate *pred = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", pattern];
    BOOL isMatch = [pred evaluateWithObject:telNumber];
    return isMatch;
}

#pragma 正则匹配用户密码6-16位数字或字母组合
+ (BOOL)checkPassword:(NSString *)password
{
    NSString *pattern = @"[0-9a-zA-Z]{6,16}";
    NSPredicate *pred = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", pattern];
    BOOL isMatch = [pred evaluateWithObject:password];
    return isMatch;
}
#pragma 正则匹配用户密码6-16位数字或字母组合
+ (BOOL)checkAccount:(NSString *)account
{
    BOOL isMatch;
    if (account.length>0 &&account.length<=11) {
        isMatch = false;
    }else{
        isMatch = true;
    }
//    NSString *pattern = @"{1,11}";
//    NSPredicate *pred = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", pattern];
//    BOOL isMatch = [pred evaluateWithObject:account];
    return isMatch;
}
#pragma mark - 是否是纯数字
+ (BOOL)isNumber
{
    NSPredicate *pred = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", @"^[0-9]+$"];
    BOOL isnNum = [pred evaluateWithObject:self];
    return isnNum;
}

@end

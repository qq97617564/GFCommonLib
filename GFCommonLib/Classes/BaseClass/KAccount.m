//
//  KUserInfo.m
//  JBJ
//
//  Created by 王刚锋 on 2019/3/26.
//  Copyright © 2019 GF. All rights reserved.
//

#import "XGPushPrivate.h"

#define kDocPath  [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) firstObject]
#define kPath      [kDocPath stringByAppendingPathComponent:@"person"]

@implementation KAccount
MJCodingImplementation
static KAccount *Account;
+ (instancetype)sharedUserAccount{
    
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        if (@available(iOS 12.0, *)) {
            NSError *error = nil;
            NSData *archiveData = [NSData dataWithContentsOfFile:kPath];
//            NSSet *classSet = [NSSet setWithObjects:[KAccount class],nil];
//            Account = [NSKeyedUnarchiver unarchivedObjectOfClasses:[KAccount class] fromData:archiveData error:&error];
            
            
            Account = [NSKeyedUnarchiver unarchivedObjectOfClass:[KAccount class] fromData:archiveData error:&error];
            if (archiveData == nil || error) {
                    NSLog(@"解档失败:%@", error);
                }
            NSLog(@"%@",kPath);
        }else{
            Account = [NSKeyedUnarchiver unarchiveObjectWithFile:kPath];
        }
        
        if (!Account) {
            Account = [[KAccount alloc]initPrivate];
        }
    });
    return Account;
}

//重写init方法
-(instancetype)init{
    return [KAccount sharedUserAccount];
}
+ (BOOL)supportsSecureCoding { \
    return YES; \
}
//私有初始化方法
- (instancetype)initPrivate {
    //调用父类init方法避免递归
    self = [super init];
    if (self) {
    }
    return self;
}
- (void)saveUserAccount {
    if (@available(iOS 12.0, *)) {
        NSError *error = nil;
        NSData *data = [NSKeyedArchiver archivedDataWithRootObject:self requiringSecureCoding:NO error:&error];
        [data writeToFile:kPath atomically:YES];
        if (data == nil || error) {
                NSLog(@"归档失败:%@", error);
            }
        NSLog(@"%@",kPath);
    }else{
        [NSKeyedArchiver archiveRootObject:self toFile:kPath];
    }
    
    [[XGPushTokenManager defaultTokenManager] upsertAccountsByDict:@{ @(0)  : self.uid }];
}
- (BOOL)isLogin {
    if (self.uid && ![self.uid isEqualToString:@""]) {
        return YES;
    }
    return NO;
}
- (void)outLogin{
    KAccount *model = [[KAccount alloc] init];
    [[self class] mj_enumerateProperties:^(MJProperty *property, BOOL *stop) {
        if (![property.type isNumberType] && ![property.type isBoolType]) {
            [model setValue:@"" forKey:property.name];
        }
    }];
    [self mj_setKeyValues:model.mj_keyValues];
//    [JPUSHService deleteAlias:^(NSInteger iResCode, NSString *iAlias, NSInteger seq) {
//
//    } seq:10086];
    
    [[XGPushTokenManager defaultTokenManager] clearAccounts];
    
//    NSString *alias = [NSString stringWithFormat:@"%@",kUserAccount.uid];
    //移除别名
//    [UMessage removeAlias:alias type:@"UMENGTEST" response:^(id  _Nullable responseObject, NSError * _Nullable error) {
//
//    }];
    [self saveUserAccount];
//    [[NSNotificationCenter defaultCenter]postNotificationName:kLogoutNotification object:nil];
}

+ (NSDictionary *)mj_replacedKeyFromPropertyName {
    return @{@"ID" : @"id"
             };
}
@end

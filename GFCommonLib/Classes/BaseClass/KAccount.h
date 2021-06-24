//
//  KUserInfo.h
//  JBJ
//
//  Created by 王刚锋 on 2019/3/26.
//  Copyright © 2019 GF. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface KAccount : NSObject<NSSecureCoding>

@property(nonatomic, strong)NSString *uid;
@property(nonatomic, strong)NSString *name;
@property(nonatomic, strong)NSString *sex;
@property(nonatomic, strong)NSString *information;
@property(nonatomic, strong)NSString *head_image;
@property(nonatomic, strong)NSString *token;
@property(nonatomic, strong)NSString *background_image;

@property(nonatomic, assign)BOOL is_active;

@property(nonatomic, strong)NSString *type;
@property(nonatomic, assign)NSInteger dynamic_count;
@property(nonatomic, assign)NSInteger follow_count;
@property(nonatomic, assign)NSInteger fan_count;
@property(nonatomic, assign)BOOL user_is_follow; //请求此接口的用户是否关注返回的这个用户、true：关注/false：未关注
@property(nonatomic, strong)NSString *phone;
@property(nonatomic, strong)NSString *schedule_id;



+(instancetype)sharedUserAccount;

- (void)saveUserAccount;

- (BOOL)isLogin;

- (void)outLogin;

@end

NS_ASSUME_NONNULL_END

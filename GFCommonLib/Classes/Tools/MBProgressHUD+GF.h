//
//  MBProgressHUD+GF.h
//  rongcloud_testDemo
//
//  Created by WangGangFeng on 17/8/12.
//  Copyright © 2017年 WGF. All rights reserved.
//

#import "MBProgressHUD.h"

@interface MBProgressHUD (GF)
+ (void)showSuccess:(NSString *)success;
+ (void)showSuccess:(NSString *)success toView:(UIView *)view;

+ (void)showError:(NSString *)error;
+ (void)showError:(NSString *)error toView:(UIView *)view;

+ (MBProgressHUD *)showMessage:(NSString *)message;
+ (MBProgressHUD *)showMessage:(NSString *)message toView:(UIView *)view;

+ (void)hideHUD;
+ (void)hideHUDForView:(UIView *)view;
@end

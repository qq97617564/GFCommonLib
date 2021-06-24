//
//  addressModel.m
//  NLKJ_App
//
//  Created by 王刚锋 on 2018/8/16.
//  Copyright © 2018年 王刚锋. All rights reserved.
//

#import "addressModel.h"

@implementation citieModel
+ (NSDictionary *)objectClassInArray{
    return @{@"city" : [cityModel class]};
}

@end
@implementation cityModel

+ (NSDictionary *)objectClassInArray{
    return @{@"area" : [NSString class]};
}

@end


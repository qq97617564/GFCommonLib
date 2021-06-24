//
//  addressModel.h
//  NLKJ_App
//
//  Created by 王刚锋 on 2018/8/16.
//  Copyright © 2018年 王刚锋. All rights reserved.
//

#import <Foundation/Foundation.h>

@class cityModel;

@interface citieModel : NSObject
@property(nonatomic, copy)NSString *name;
@property(nonatomic, copy)NSArray <cityModel *> *city;
@end
@interface cityModel : NSObject
//@property(nonatomic, copy)NSArray *areas;
//@property(nonatomic, copy)NSString *city;
@property (nonatomic , copy) NSString * name;
@property (nonatomic , strong) NSArray <NSString *>  * area;
@end


//@interface addressModel : NSObject
//@end

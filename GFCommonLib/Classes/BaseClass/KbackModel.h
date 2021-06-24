//
//  KbackModel.h
//  JBJ
//
//  Created by 王刚锋 on 2019/3/26.
//  Copyright © 2019 GF. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface KbackModel : NSObject
@property(nonatomic,copy)NSString *code;
@property(nonatomic,copy)id content;
@property(nonatomic,copy)NSString *time;
@property(nonatomic,copy)NSString *msg;
@end

NS_ASSUME_NONNULL_END

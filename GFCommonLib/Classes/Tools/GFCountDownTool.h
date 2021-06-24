//
//  GFCountDownTool.h
//  NLKJ_App
//
//  Created by 王刚锋 on 2018/7/30.
//  Copyright © 2018年 王刚锋. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface GFCountDownTool : NSObject
typedef void(^CountDownDIYEvents) (void);

@property (nonatomic,strong) CountDownDIYEvents diyEvent;

@property (nonatomic,strong) NSTimer *timer;
/**
 *  验证码倒计时
 */
+(void)getVertifyCountDownWithBtn:(UIButton *)getVertifyBtn;

/**
 *  自定义倒计时事件  //暂时设置10s
 */
+(instancetype)countDownWithBtn:(UIButton *)btn andCountDownDIYEvents:(CountDownDIYEvents)o;

@end

//
//  GFCountDownTool.m
//  NLKJ_App
//
//  Created by 王刚锋 on 2018/7/30.
//  Copyright © 2018年 王刚锋. All rights reserved.
//

#import "GFCountDownTool.h"
@interface GFCountDownTool()

@property (nonatomic,strong) UIButton *getVertifyBtn;
@property (nonatomic) int countDownTime;

@end
@implementation GFCountDownTool

+(void)getVertifyCountDownWithBtn:(UIButton *)getVertifyBtn
{
    //执行倒计时
    getVertifyBtn.enabled = NO;
    GFCountDownTool *getVertify = [[GFCountDownTool alloc] init];
    getVertify.getVertifyBtn = getVertifyBtn;
    //    [getVertifyBtn setBackgroundColor:[UIColor colorWithHexString:@"#FEA9AD"]];
    //    [getVertifyBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    getVertify.countDownTime = 60;
    getVertify.timer = [NSTimer scheduledTimerWithTimeInterval:1.f target:getVertify selector:@selector(countDown) userInfo:nil repeats:YES];
}
- (void)countDown
{
    [self.getVertifyBtn setTitle:[NSString stringWithFormat:@"已发送(%dS)",self.countDownTime] forState:UIControlStateNormal];
    self.countDownTime --;
    if (self.countDownTime == -1) {
        
        [self.timer invalidate];
        self.timer = nil;
        [self.getVertifyBtn setTitle:@"重新获取" forState:UIControlStateNormal];
        //        [self.getVertifyBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        [self.getVertifyBtn setBackgroundImage:IMG(@"圆角矩形-1-拷贝-4") forState:UIControlStateNormal];
        self.getVertifyBtn.enabled = YES;
        //        self.getVertifyBtn.backgroundColor = [UIColor colorWithHexString:@"#FC454D"];
    }
}



+(instancetype)countDownWithBtn:(UIButton *)btn andCountDownDIYEvents:(CountDownDIYEvents)countDownDIYEvents
{
    GFCountDownTool *getVertify = [[GFCountDownTool alloc] init];
    getVertify.getVertifyBtn = btn;
    getVertify.countDownTime = 0;
    if (countDownDIYEvents) {
        getVertify.diyEvent = countDownDIYEvents;
    }
    getVertify.timer = [NSTimer scheduledTimerWithTimeInterval:1.f target:getVertify selector:@selector(countDownDIY) userInfo:nil repeats:YES];
    
    return getVertify;
}
- (void)countDownDIY
{
    
    [self.getVertifyBtn setTitle:[NSString stringWithFormat:@"%ds",self.countDownTime] forState:UIControlStateNormal];
    self.countDownTime --;
    if (self.countDownTime == -1) {
        
        [self.timer invalidate];
        self.timer = nil;
        if (self.diyEvent) {
            self.diyEvent();
        }
        self.getVertifyBtn.enabled = YES;
    }
}




@end

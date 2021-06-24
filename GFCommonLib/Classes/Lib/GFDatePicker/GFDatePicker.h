//
//  GFDatePicker.h
//  rongcloud_testDemo
//
//  Created by WangGangFeng on 17/8/23.
//  Copyright © 2017年 WGF. All rights reserved.
//

#import <UIKit/UIKit.h>

@class GFDatePicker;

@protocol GFDatePickerViewDelegate <NSObject>
//必须实现的两个代理
@optional
//当时间改变时触发
- (void)changeTime:(NSDate *)date;
@required
//确定时间
- (void)determine:(NSDate *)date andPicker:(GFDatePicker *)picker;

-(void)closeDateView;

@end

@interface GFDatePicker : UIView
//快速创建
+ (instancetype)datePickerWithType:(UIDatePickerMode) type ;
//初始化方法
- (instancetype)initWithFrame:(CGRect)frame type:(UIDatePickerMode)type;

//和代理应运而生的block
@property (nonatomic,copy) void(^changeTimeBlock) (NSDate *date);
@property (nonatomic,copy) void(^determineBlock) (NSDate *date);

//显示
- (void)show;

//设置初始时间
- (void)setNowTime:(NSString *)dateStr;

//可选的最大和最小时间
@property (nonatomic,strong) NSDate *optionalMaxDate;
@property (nonatomic,strong) NSDate *optionalMinDate;

//设置自定义标题
@property (nonatomic,copy) NSString *title;

// NSDate --> NSString
- (NSString*)stringFromDate:(NSDate*)date;
//NSDate <-- NSString
- (NSDate*)dateFromString:(NSString*)dateString;

@property (assign,nonatomic) id<GFDatePickerViewDelegate> delegate;
@end

//
//  UIView+Awesome.h
//  rongcloud_testDemo
//
//  Created by WangGangFeng on 17/8/25.
//  Copyright © 2017年 WGF. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView (Awesome)
@property (nonatomic, assign) CGFloat x;
@property (nonatomic, assign) CGFloat y;
@property (nonatomic, assign) CGFloat width;
@property (nonatomic, assign) CGFloat height;
@property (nonatomic, assign) CGFloat centerX;
@property (nonatomic, assign) CGFloat centerY;
@property (nonatomic, assign) CGSize size;
@property (nonatomic, assign) CGFloat bottom;
@property (assign, nonatomic) CGFloat maxX;
@property (assign, nonatomic) CGFloat maxY;
@property (assign, nonatomic) CGFloat top;
@property (assign, nonatomic) CGFloat left;
@property (assign, nonatomic) CGFloat right;

@property (nonatomic) IBInspectable CGFloat cornerRadius;

/** 头像圆角 */
@property (nonatomic) IBInspectable BOOL avatarCorner;

/** 边框 */
@property (nonatomic) IBInspectable CGFloat borderWidth;

/** 边框颜色*/
@property (nonatomic, strong) IBInspectable UIColor *borderColor;


+ (instancetype)viewFromNIB;
/** 动态添加手势 */
- (void)setTapActionWithBlock:(void (^)(void))block;

+ (instancetype)nc_lineView;

- (UIViewController *)viewController;


@end

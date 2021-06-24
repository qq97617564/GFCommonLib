//
//  UIButton+Awesome.h
//  LKK
//
//  Created by 张明辉 on 16/12/8.
//  Copyright © 2016年 流年. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIButton (Awesome)

+ (instancetype) buttonWithImageName:(NSString *)imageName;

+ (instancetype)nc_buttonWithTitle:(NSString *)title titleColor:(UIColor *)titleColor selectedTitleColor:(UIColor *)selectedColor fontSize:(CGFloat)fontSize target:(id)target action:(SEL)action;

@end

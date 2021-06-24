//
//  UIButton+Awesome.m
//  LKK
//
//  Created by 张明辉 on 16/12/8.
//  Copyright © 2016年 流年. All rights reserved.
//

#import "UIButton+Awesome.h"

@implementation UIButton (Awesome)

+ (instancetype) buttonWithImageName:(NSString *)imageName {
    UIImage *image = [UIImage imageNamed:imageName];
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    btn.frame = CGRectMake(0, 0, image.size.width, image.size.height);
    [btn setBackgroundImage:image forState:UIControlStateNormal];
    [btn setBackgroundImage:image forState:UIControlStateHighlighted];
    return btn;
    
}

+ (instancetype)nc_buttonWithTitle:(NSString *)title titleColor:(UIColor *)titleColor selectedTitleColor:(UIColor *)selectedColor fontSize:(CGFloat)fontSize target:(id)target action:(SEL)action {
    
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    [button setTitle:title forState:UIControlStateNormal];
    [button setTitleColor:titleColor forState:UIControlStateNormal];
    [button setTitleColor:selectedColor forState:UIControlStateSelected];
    button.titleLabel.font = [UIFont systemFontOfSize:fontSize];
    [button addTarget:target action:action forControlEvents:UIControlEventTouchUpInside];
    return button;
    
}

@end

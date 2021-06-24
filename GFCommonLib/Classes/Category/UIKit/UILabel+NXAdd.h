//
//  UILabel+NXAdd.h
//  NCube
//
//  Created by kepuna on 2016/12/16.
//  Copyright © 2016年 junjie.liu. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UILabel (NXAdd)

+ (instancetype)nc_labelWithTextColor:(UIColor *)color fontSize:(CGFloat)fontSize alignment:(NSTextAlignment)alignment;

+ (instancetype)nc_labelWithText:(NSString *)text color :(UIColor *)color fontSize:(CGFloat)fontSize alignment:(NSTextAlignment)alignment;
+ (instancetype)nc_labelWithText:(NSString *)text color:(UIColor *)color fontSize:(CGFloat)fontSize fontName:(NSString *)fontName alignment:(NSTextAlignment)alignment;


@end

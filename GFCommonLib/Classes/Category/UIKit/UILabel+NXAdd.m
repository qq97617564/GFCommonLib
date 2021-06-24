//
//  UILabel+NXAdd.m
//  NCube
//
//  Created by kepuna on 2016/12/16.
//  Copyright © 2016年 junjie.liu. All rights reserved.
//

#import "UILabel+NXAdd.h"

@implementation UILabel (NXAdd)

+ (instancetype)nc_labelWithTextColor:(UIColor *)color fontSize:(CGFloat)fontSize alignment:(NSTextAlignment)alignment {
     UILabel *label = [UILabel nc_labelWithText:nil color:color fontSize:fontSize fontName:nil alignment:alignment];
    return label;
}

+ (instancetype)nc_labelWithText:(NSString *)text color :(UIColor *)color fontSize:(CGFloat)fontSize alignment:(NSTextAlignment)alignment {
    UILabel *label = [UILabel nc_labelWithText:text color:color fontSize:fontSize fontName:nil alignment:alignment];
    return label;
}

+ (instancetype)nc_labelWithText:(NSString *)text color :(UIColor *)color fontSize:(CGFloat)fontSize fontName:(NSString *)fontName alignment:(NSTextAlignment)alignment{
    
    UILabel *label = [[UILabel alloc]init];
    label.textColor = color;
    label.textAlignment = alignment;
    label.font = [UIFont fontWithName:fontName size:fontSize];
    label.text = text;
    return label;
    
}


@end

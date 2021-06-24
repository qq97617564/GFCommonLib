//
//  UIColor+Hex.h
//  ChatDemo-UI3.0
//
//  Created by Davis on 16/12/26.
//  Copyright © 2016年 Davis. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIColor (Hex)


#define RGBA_COLOR(R, G, B, A) [UIColor colorWithRed:((R) / 255.0f) green:((G) / 255.0f) blue:((B) / 255.0f) alpha:A]


+ (UIColor *)colorWithHexString:(NSString *)color;

// 从十六进制字符串获取颜色
// color:支持@“#123456”、 @“0X123456”、 @“123456”三种格式
+ (UIColor *)colorWithHexString:(NSString *)color alpha:(CGFloat)alpha;

@end

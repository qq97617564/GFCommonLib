//
//  UIBarButtonItem+Category.h
//  ChatDemo-UI3.0
//
//  Created by Davis on 16/12/26.
//  Copyright © 2016年 Davis. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIBarButtonItem (Category)

typedef void(^BarButtonItemBlock) (void);

/**
 *  用图片创建barButtonItem
 */
+ (instancetype)barButtonItemWithImage:(NSString *)image andBarButtonItemBlock:(BarButtonItemBlock)barButtonItemBlock;

/**
 *  纯文字创建barButtonItem 白色文字
 */
+ (instancetype)barButtonItemWithTitle:(NSString *)title andBarButtonItemBlock:(BarButtonItemBlock)barButtonItemBlock;

/**
 *  纯文字创建barButtonItem 自定义文字
 */
+(instancetype)barButtonItemWithTitle:(NSString *)title titleColor:(UIColor *)titleColor andBarButtonItemBlock:(BarButtonItemBlock)barButtonItemBlock;
@end

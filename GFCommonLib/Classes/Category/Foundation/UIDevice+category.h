//
//  UIDevice+category.h
//  JBJ_student
//
//  Created by 王刚锋 on 2019/5/16.
//  Copyright © 2019 GF. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIDevice (category)
/**
 * @interfaceOrientation 输入要强制转屏的方向
 */
+ (void)switchNewOrientation:(UIInterfaceOrientation)interfaceOrientation;
@end

NS_ASSUME_NONNULL_END

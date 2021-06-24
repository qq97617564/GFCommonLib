//
//  UIStoryboard+Category.h
//  XiaoLang
//
//  Created by Heisenbean on 15/12/1.
//  Copyright © 2015年 Heisenbean. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIStoryboard (Category)

+(id)initialViewControllerWithSbName:(NSString*)name;

+ (id)initialViewControllerWithSbName:(NSString*)name andSBID:(NSString *)sbID;
@end

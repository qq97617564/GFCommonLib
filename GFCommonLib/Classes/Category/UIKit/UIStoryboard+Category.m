//
//  UIStoryboard+Category.m
//  XiaoLang
//
//  Created by Heisenbean on 15/12/1.
//  Copyright © 2015年 Heisenbean. All rights reserved.
//

#import "UIStoryboard+Category.h"

@implementation UIStoryboard (Category)
/**
 *  通过一个storyboardName创建一个控制器
 *
 *  @param name sbName
 *
 *  @return 控制器
 */
+ (id)initialViewControllerWithSbName:(NSString*)name{
    UIStoryboard *sb = [UIStoryboard storyboardWithName:name bundle:nil];
    return [sb instantiateInitialViewController];
}

+ (id)initialViewControllerWithSbName:(NSString*)name andSBID:(NSString *)sbID{
    UIStoryboard *sb = [UIStoryboard storyboardWithName:name bundle:nil];
    return [sb instantiateViewControllerWithIdentifier:sbID];
}
@end

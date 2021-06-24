//
//  UIDevice+category.m
//  JBJ_student
//
//  Created by 王刚锋 on 2019/5/16.
//  Copyright © 2019 GF. All rights reserved.
//

#import "UIDevice+category.h"

@implementation UIDevice (category)
+ (void)switchNewOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    
    NSNumber *resetOrientationTarget = [NSNumber numberWithInt:UIInterfaceOrientationUnknown];
    
    [[UIDevice currentDevice] setValue:resetOrientationTarget forKey:@"orientation"];
    
    NSNumber *orientationTarget = [NSNumber numberWithInt:interfaceOrientation];
    
    [[UIDevice currentDevice] setValue:orientationTarget forKey:@"orientation"];
    
}
@end

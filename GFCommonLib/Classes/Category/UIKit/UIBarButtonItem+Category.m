//
//  UIBarButtonItem+Category.m
//  ChatDemo-UI3.0
//
//  Created by Davis on 16/12/26.
//  Copyright © 2016年 Davis. All rights reserved.
//

#import "UIBarButtonItem+Category.h"
#import <objc/runtime.h>
#import "UIButton+Awesome.h"
#import "GFCommonManager.h"
@interface UIBarButtonItem ()
@property (nonatomic) BarButtonItemBlock barButtonItemBlock;
@end

@implementation UIBarButtonItem (Category)

+(instancetype)barButtonItemWithImage:(NSString *)image andBarButtonItemBlock:(BarButtonItemBlock)barButtonItemBlock
{
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
//                     buttonWithImageName:image];
    [btn setImage:IMG(image) forState:UIControlStateNormal];
    btn.imageView.contentMode = UIViewContentModeScaleAspectFit;
    btn.frame = CGRectMake(0, 0, 20, 44);
    
    UIBarButtonItem *item = [[UIBarButtonItem alloc] initWithCustomView:btn];
    item.barButtonItemBlock = barButtonItemBlock;
    
    [btn addTarget:item action:@selector(clickItem) forControlEvents:UIControlEventTouchUpInside];
    return item;
}

+(instancetype)barButtonItemWithTitle:(NSString *)title andBarButtonItemBlock:(BarButtonItemBlock)barButtonItemBlock
{
    //默认是白色文字
    return [self barButtonItemWithTitle:title titleColor:[UIColor whiteColor] andBarButtonItemBlock:barButtonItemBlock];
}

+(instancetype)barButtonItemWithTitle:(NSString *)title titleColor:(UIColor *)titleColor andBarButtonItemBlock:(BarButtonItemBlock)barButtonItemBlock
{
    UIBarButtonItem *item = [[UIBarButtonItem alloc] initWithTitle:title style:UIBarButtonItemStylePlain target:nil action:nil];
    [item setTarget:item];
    
    [item setAction:@selector(clickItem)];
    item.barButtonItemBlock = barButtonItemBlock;
    item.tintColor = titleColor;
    return item;
}
- (void)clickItem
{

    WEAKSELF
    if (weakSelf_SC.barButtonItemBlock) {
        weakSelf_SC.barButtonItemBlock();
    }
}



static void *key = &key;
-(void)setBarButtonItemBlock:(BarButtonItemBlock)barButtonItemBlock
{
    objc_setAssociatedObject(self, & key, barButtonItemBlock, OBJC_ASSOCIATION_COPY);
}
-(BarButtonItemBlock)barButtonItemBlock
{
    return objc_getAssociatedObject(self, &key);
}
@end

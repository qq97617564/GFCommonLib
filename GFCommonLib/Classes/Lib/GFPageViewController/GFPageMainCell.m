//
//  GFPageMainCell.m
//  NLKJ_App
//
//  Created by 王刚锋 on 2018/8/6.
//  Copyright © 2018年 王刚锋. All rights reserved.
//

#import "GFPageMainCell.h"

@implementation GFPageMainCell
- (void)setIndexController:(UIViewController *)indexController{
    
    [_indexController.view removeFromSuperview];
    _indexController = indexController;
    [self.contentView addSubview:_indexController.view];
    [self layoutSubviews];
}

- (void)layoutSubviews{
    [super layoutSubviews];
    _indexController.view.frame = self.bounds;
}
@end

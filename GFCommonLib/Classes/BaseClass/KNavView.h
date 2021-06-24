//
//  KNavView.h
//  JBJ_student
//
//  Created by 王刚锋 on 2019/5/14.
//  Copyright © 2019 GF. All rights reserved.
//

#import "KBaseView.h"

NS_ASSUME_NONNULL_BEGIN

@interface KNavView : KBaseView
@property(nonatomic, strong)NSString *title;
@property(nonatomic, strong)UIButton *navTitle;
@property(nonatomic, strong)UIImageView *dot;
-(void)setleftBarItemWithImage:(UIImage *)image;
-(void)setleftBarItemWithTitle:(NSString *)title;

-(void)setRightBarItemWithImage:(UIImage *)image;
-(void)setRightBarItemWithTitle:(NSString *)title;

@property(nonatomic, strong)UIButton *navLeftButton;
@property(nonatomic, strong)UIButton *navRightButton;
@property(nonatomic, strong)void (^buttonActionBlock)(NSInteger index);
@end

NS_ASSUME_NONNULL_END

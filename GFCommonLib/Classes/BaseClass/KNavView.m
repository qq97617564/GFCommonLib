//
//  KNavView.m
//  JBJ_student
//
//  Created by 王刚锋 on 2019/5/14.
//  Copyright © 2019 GF. All rights reserved.
//

#import "KNavView.h"
#import "AppDelegate.h"
@implementation KNavView
-(void)setupUI{
    self.backgroundColor = kBGColor;
    [self addSubview:self.navLeftButton];
    [self addSubview:self.navTitle];
    [self addSubview:self.navRightButton];
    [self addSubview:self.dot];
}
-(void)setTitle:(NSString *)title{
    _title = title;
    [_navTitle setTitle:_title forState:UIControlStateNormal];
}
-(UIImageView *)dot{
    if (!_dot) {
        _dot = [[UIImageView alloc]initWithFrame:CGRectZero];
        _dot.backgroundColor = [UIColor colorWithHexString:@"#FF3B30"];
        ViewBorderRadius(_dot, 5);
        _dot.hidden = YES;
    }
    return _dot;
}
-(UIButton *)navTitle{
    if (!_navTitle) {
        _navTitle = [UIButton buttonWithType:UIButtonTypeCustom];
        _navTitle.titleLabel.font = kFont17;
        [_navTitle setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        [_navTitle addTarget:self action:@selector(titleClick:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _navTitle;
}
-(void)setleftBarItemWithImage:(UIImage *)image{
    [_navLeftButton setImage:image forState:UIControlStateNormal];
}
-(void)setleftBarItemWithTitle:(NSString *)title{
    [_navLeftButton setTitle:title forState:UIControlStateNormal];
}
- (void)setRightBarItemWithImage:(UIImage *)image{
    [_navRightButton setImage:image forState:UIControlStateNormal];
}
-(void)setRightBarItemWithTitle:(NSString *)title{
    [_navRightButton setTitle:title forState:UIControlStateNormal];
}
-(UIButton *)navLeftButton{
    if(!_navLeftButton){
        _navLeftButton = [UIButton buttonWithType:UIButtonTypeCustom];
        _navLeftButton.titleLabel.font = kFont17;
        [_navLeftButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        [_navLeftButton addTarget:self action:@selector(leftClick:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _navLeftButton;
}
-(UIButton *)navRightButton{
    if(!_navRightButton){
        _navRightButton = [UIButton buttonWithType:UIButtonTypeCustom];
        _navRightButton.titleLabel.font = kFont17;
        [_navRightButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        [_navRightButton addTarget:self action:@selector(rightAction:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _navRightButton;
}
-(void)leftClick:(UIButton *)button{
    if (self.buttonActionBlock) {
        self.buttonActionBlock(1);
    }
}
-(void)rightAction:(UIButton *)button{
    if (self.buttonActionBlock) {
        self.buttonActionBlock(2);
    }
}
-(void)titleClick:(UIButton *)button{
    if (self.buttonActionBlock) {
        self.buttonActionBlock(3);
    }
}


-(void)layoutSubviews{
    [super layoutSubviews];
    [_navTitle mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.mas_equalTo(self.mas_centerY).offset(0);
        make.centerX.mas_equalTo(self.mas_centerX).offset(0);
    }];
    [_navLeftButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.mas_equalTo(self.mas_centerY).offset(0);
        make.height.mas_equalTo(27);
        make.left.mas_equalTo(15);
    }];
    [_navRightButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.mas_equalTo(self.mas_centerY).offset(0);
        make.height.mas_equalTo(27);
        make.right.mas_equalTo(-15);
    }];
    [_dot mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.navRightButton.mas_top).offset(0);
        make.right.mas_equalTo(-12);
        make.height.width.mas_equalTo(10);
    }];
}

@end

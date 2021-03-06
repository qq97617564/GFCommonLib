//
//  GFPageContentView.m
//  NLKJ_App
//
//  Created by 王刚锋 on 2018/8/6.
//  Copyright © 2018年 王刚锋. All rights reserved.
//

#import "GFPageContentView.h"

@interface GFPageContentView()

@property (nonatomic, strong) UIButton *selectBtn;

@end

@implementation GFPageContentView

- (instancetype)initWithFrame:(CGRect)frame itemsArray:(NSArray *)itemsArray
{
    if (self = [super initWithFrame:frame]) {
        
        self.backgroundColor = [UIColor whiteColor];
        
        NSMutableArray *views = [NSMutableArray array];
        for (int i = 0; i < itemsArray.count; i++) {
            UIButton *btn = [[UIButton alloc] init];
            btn.tag = i;
            self.userInteractionEnabled = YES;
            [btn setTitleColor:[UIColor grayColor]  forState:UIControlStateNormal];
            [btn setTitleColor:kBGColor forState:UIControlStateSelected];
            btn.titleLabel.font = [UIFont systemFontOfSize:15];
            [btn setTitle:itemsArray[i] forState:UIControlStateNormal];
            [btn addTarget:self action:@selector(btnClick:) forControlEvents:UIControlEventTouchDown];
            [views addObject:btn];
            [self addSubview:btn];
        }
        [self makeEqualWidthViews:views inView:self LRpadding:0 viewPadding:0];
    }
    return self;
}

- (void)btnClick:(UIButton *)btn
{
    self.selectBtn.selected = NO;
    btn.selected = YES;
    self.selectBtn = btn;
    
    if ([self.delegate respondsToSelector:@selector(pageContentView:didClickBtnIndex:)]) {
        [self.delegate pageContentView:self didClickBtnIndex:btn.tag];
    }
}

- (void)setDelegate:(id<GFPageContentViewDelegate>)delegate
{
    _delegate = delegate;
    
    UIButton *btn = self.subviews.firstObject;
    [self btnClick:btn];
}

- (void)setIndex:(int)index
{
    self.selectBtn.selected = NO;
    UIButton *btn = self.subviews[index];
    btn.selected = YES;
    self.selectBtn = btn;
}

- (void)makeEqualWidthViews:(NSArray *)views inView:(UIView *)containerView LRpadding:(CGFloat)LRpadding viewPadding:(CGFloat)viewPadding
{
    UIView *lastView;
    for (UIView *view in views) {
        [containerView addSubview:view];
        if (lastView) {
            [view mas_makeConstraints:^(MASConstraintMaker *make) {
                make.top.bottom.equalTo(containerView);
                make.left.equalTo(lastView.mas_right).offset(viewPadding);
                make.width.equalTo(lastView);
            }];
        }else
        {
            [view mas_makeConstraints:^(MASConstraintMaker *make) {
                make.left.equalTo(containerView).offset(LRpadding);
                make.top.bottom.equalTo(containerView);
            }];
        }
        lastView=view;
    }
    [lastView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(containerView).offset(-LRpadding);
    }];
}

@end

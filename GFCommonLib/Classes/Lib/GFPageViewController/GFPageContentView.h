//
//  GFPageContentView.h
//  NLKJ_App
//
//  Created by 王刚锋 on 2018/8/6.
//  Copyright © 2018年 王刚锋. All rights reserved.
//

#import <UIKit/UIKit.h>

@class GFPageContentView;

@protocol GFPageContentViewDelegate <NSObject>

@optional

- (void)pageContentView:(GFPageContentView *)pageContentView didClickBtnIndex:(NSInteger)index;

@end

@interface GFPageContentView : UIView

- (instancetype)initWithFrame:(CGRect)frame itemsArray:(NSArray *)itemsArray;

@property (nonatomic, weak) id<GFPageContentViewDelegate> delegate;


@property (nonatomic, assign) int index;

@end

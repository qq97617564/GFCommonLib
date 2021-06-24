//
//  GFCityPickView.h
//  NLKJ_App
//
//  Created by 王刚锋 on 2018/8/16.
//  Copyright © 2018年 王刚锋. All rights reserved.
//

#import <UIKit/UIKit.h>
//定制代理协议
@protocol GFCityPickViewDelegate <NSObject>

- (void)addressPickerViewDidSelected:(NSString *)areaName;//点击上方完成按钮的代理传回拼接好的选中地址

@end

@interface GFCityPickView : UIView
@property (weak, nonatomic) id<GFCityPickViewDelegate> delegate;
-(void)show;
@end

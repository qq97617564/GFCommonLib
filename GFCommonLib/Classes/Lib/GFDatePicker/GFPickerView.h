//
//  GFPickerView.h
//  rongcloud_testDemo
//
//  Created by WangGangFeng on 17/8/23.
//  Copyright © 2017年 WGF. All rights reserved.
//

#import <UIKit/UIKit.h>
@protocol GFPickerViewDelegate <NSObject>

@optional
- (void)didFinishPickView:(NSString*)date;
- (void)hiddenPickerView;

@end

@interface GFPickerView : UIView
@property (nonatomic, weak) id<GFPickerViewDelegate> delegate;
@end

//
//  KBaseView.h
//  JBJ
//
//  Created by 王刚锋 on 2019/3/26.
//  Copyright © 2019 GF. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "UIView+Awesome.h"
NS_ASSUME_NONNULL_BEGIN

@interface KBaseView : UIView
- (void)setupUI;
-(void)setModel:(NSObject *)model;
@end

NS_ASSUME_NONNULL_END

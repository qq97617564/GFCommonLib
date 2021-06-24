//
//  NoDataView.m
//  JBJ_student
//
//  Created by 王刚锋 on 2019/7/2.
//  Copyright © 2019 GF. All rights reserved.
//

#import "NoDataView.h"
#import "GFCommonManager.h"
@interface NoDataView()
@property(nonatomic, strong)UIImageView *imageV;
@end
@implementation NoDataView

-(void)setupUI{
    [self addSubview:self.imageV];
}
- (UIImageView *)imageV{
    if (!_imageV) {
        _imageV = [[UIImageView alloc]initWithImage:IMG(@"wifi")];
    }
    return _imageV;
}
-(void)layoutSubviews{
    [super layoutSubviews];
    [_imageV mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.mas_equalTo(self.mas_centerX);
        make.centerY.mas_equalTo(self.mas_centerY).offset(-64);
        make.width.mas_equalTo(180);
        make.height.mas_equalTo(202);
    }];
}
@end

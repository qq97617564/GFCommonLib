//
//  KBaseVC.m
//  JBJ
//
//  Created by 王刚锋 on 2019/3/26.
//  Copyright © 2019 GF. All rights reserved.
//

#import "KBaseVC.h"

@interface KBaseVC ()

@end

@implementation KBaseVC
-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    [self.navigationController setNavigationBarHidden:false animated:YES];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.view addSubview:self.backgroundImage];
    [self.view sendSubviewToBack:self.backgroundImage];
    self.view.backgroundColor = [UIColor whiteColor];
    // Do any additional setup after loading the view.
}
-(UIImageView *)backgroundImage{
    if (!_backgroundImage) {
        _backgroundImage = [[UIImageView alloc]initWithFrame:CGRectZero];
        _backgroundImage.backgroundColor = kBlueColor;
        _backgroundImage.contentMode = UIViewContentModeScaleAspectFill;
        _backgroundImage.hidden = YES;
    }
    return _backgroundImage;
}

-(void)viewDidLayoutSubviews{
    [super viewDidLayoutSubviews];
    [self.backgroundImage mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.top.mas_equalTo(0);
        make.height.mas_equalTo(kStatusBarHeight);
    }];
}

@end

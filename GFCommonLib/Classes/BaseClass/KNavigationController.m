//
//  KNavigationController.m
//  JBJ
//
//  Created by 王刚锋 on 2019/3/26.
//  Copyright © 2019 GF. All rights reserved.
//

#import "KNavigationController.h"
#define NavBarFont [UIFont boldSystemFontOfSize:18]
@interface KNavigationController ()

@end

@implementation KNavigationController

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
//    [self setNavigationBarHidden:YES animated:NO];
//    UIImage *image = [[UIImage alloc] init];
//设置导航栏背景图片为一个空的image，这样就透明了
//    [self.navigationBar setBackgroundImage:image forBarMetrics:UIBarMetricsDefault];
//    self.view.backgroundColor = [UIColor clearColor];
//去掉透明后导航栏下边的黑边
//    [self.navigationBar setShadowImage:image];
//
//    self.navigationBar.barStyle = UIBarStyleBlack;
    self.navigationBar.translucent = NO;
}




- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self.navigationBar setBarTintColor:kBGColor];
    [self.navigationBar setTitleTextAttributes:[NSDictionary dictionaryWithObjectsAndKeys:[UIColor whiteColor],NSForegroundColorAttributeName,[UIFont systemFontOfSize:18.0f],NSFontAttributeName, nil]];
    
    //    self.navigationBar.translucent = NO;
    //    self.navigationBar.barStyle = UIBarStyleBlack;
    //    _lineVIew = [self findlineviw:self.navigationBar];
    //    _lineVIew.hidden = YES;
}
-(UIImageView*)findlineviw:(UIView*)view{
    
    if ([view isKindOfClass:[UIImageView class]]&&view.bounds.size.height<=1.0) {
        return (UIImageView*) view;
    }for (UIImageView *subview in view.subviews) {
        UIImageView *lineview = [self findlineviw:subview];
        if (lineview) {
            return lineview;
        }
    }
    return nil;
}
+ (void)initialize {
    // 1.设置导航栏主题
    UINavigationBar *navBar = [UINavigationBar appearance];
    NSMutableDictionary *attrs = [NSMutableDictionary dictionary];
    attrs[NSForegroundColorAttributeName] = [UIColor whiteColor];
    attrs[NSFontAttributeName] = NavBarFont;
    [navBar setTitleTextAttributes:attrs];
    // 2.去掉导航栏所有返回按钮后边的文字
    [[UIBarButtonItem appearance] setBackButtonTitlePositionAdjustment:UIOffsetMake(0, -60) forBarMetrics:UIBarMetricsDefault];
    
    navBar.tintColor = [UIColor whiteColor];
    //    [navBar setBarTintColor:kRedColor];
}

- (UIStatusBarStyle)preferredStatusBarStyle{
    return UIStatusBarStyleLightContent;
}

//当 push 时隐藏 tabbar
- (void)pushViewController:(UIViewController *)viewController animated:(BOOL)animated {
    
    if (self.viewControllers.count >= 1) {
        viewController.hidesBottomBarWhenPushed = YES;
        // 设置返回按钮
        [self setBackItem:viewController];
    }
    [super pushViewController:viewController animated:animated];
    
    //    // 修改tabBar的frame
    //    CGRect frame = self.tabBarController.tabBar.frame;
    //    frame.origin.y = [UIScreen mainScreen].bounds.size.height - frame.size.height;
    //    self.tabBarController.tabBar.frame = frame;
}

- (void)setBackItem:(UIViewController *)vc {
    //设置后退的手势
    self.interactivePopGestureRecognizer.delegate = nil;
    
    //        UIBarButtonItem *back = [[UIBarButtonItem alloc]initWithImage:IMG(@"back") style:UIBarButtonItemStylePlain target:self action:@selector(back)];
    vc.navigationItem.leftBarButtonItem = [UIBarButtonItem barButtonItemWithImage:@"back" andBarButtonItemBlock:^{
        [self back];
    }];
}

- (void)back {
    
    if (self.presentingViewController != nil) {
        [self dismissViewControllerAnimated:NO completion:nil];
    } else {
        [self popViewControllerAnimated:YES];
    }
}

-(void)viewDidLayoutSubviews{
    [super viewDidLayoutSubviews];
}
@end

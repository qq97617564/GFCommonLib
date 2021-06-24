//
//  KTabbarVC.m
//  JBJ
//
//  Created by 王刚锋 on 2019/3/26.
//  Copyright © 2019 GF. All rights reserved.
//

#import "KTabbarVC.h"
#import "KNavigationController.h"

#import "TodayVC.h"
#import "ZuoyeVC.h"
#import "PingjiaVC.h"
#import "NoticeMainVC.h"

@interface KTabbarVC ()
{
    UITabBarItem *currentItem;
}
@end

@implementation KTabbarVC
+ (KTabbarVC *)shareInstance {
    static KTabbarVC *instance = nil;
    static dispatch_once_t predicate;
    dispatch_once(&predicate, ^{
        instance = [[[self class] alloc] init];
    });
    return instance;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor =kBGColor;
    
    UIImageView *imageView = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, 49)];
    [imageView setImage:[self createImageWithColor:[UIColor clearColor]]];
    [imageView setContentMode:UIViewContentModeScaleToFill];
    [self.tabBar insertSubview:imageView atIndex:0];
    //    //覆盖原生Tabbar的上横线
//    [[UITabBar appearance] setShadowImage:[self createImageWithColor:[UIColor clearColor]]];
    //    //背景图片为透明色
//    [[UITabBar appearance] setBackgroundImage:[self createImageWithColor:kBGColor]];
//    self.tabBar.backgroundColor = [UIColor clearColor];
    //    //设置为半透明
//    self.tabBar.translucent = NO;
    
    [self addChildControllers];
    [[UITabBarItem appearance]setTitleTextAttributes:[NSDictionary dictionaryWithObjectsAndKeys:kBlueColor,NSForegroundColorAttributeName, nil] forState:UIControlStateSelected];
    [self setAlias];
}
-(void)setAlias{
    NSString *alias = [NSString stringWithFormat:@"%@%@",kUserAccount.school,kUserAccount.ID];
    [JPUSHService setAlias:alias completion:^(NSInteger iResCode, NSString *iAlias, NSInteger seq) {
        
    } seq:10086];
}
-(void)selecrIndex:(NSNotification *)noti{
    DELog(@"haha")
    NSString *index = (NSString *)noti.object;
    UITabBarItem *item = self.tabBar.items[index.integerValue];
    currentItem.imageInsets = UIEdgeInsetsMake(0, 0, 0, 0);
    currentItem = item;
    //    currentItem.imageInsets = UIEdgeInsetsMake(-6, -6, -6, -6);
    self.selectedIndex = index.integerValue;
    
}

-(UIImage*) createImageWithColor:(UIColor*) color
{
    CGRect rect=CGRectMake(0.0f, 0.0f, 0.0f, 0.0f);
    UIGraphicsBeginImageContext(rect.size);
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSetFillColorWithColor(context, [color CGColor]);
    CGContextFillRect(context, rect);
    UIImage *theImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return theImage;
}
//添加自控制器
-(void)addChildControllers{
    TodayVC     *vc1 = [[TodayVC alloc]init];
    ZuoyeVC     *vc2 = [[ZuoyeVC alloc]init];
    NoticeMainVC    *vc3 = [[NoticeMainVC alloc]init];
    PingjiaVC   *vc4 = [[PingjiaVC alloc]init];
    
    [self addChildVC:vc1 title:@"今日安排" imageName:@"ap_n" selectImageName:@"ap_s"];

    [self addChildVC:vc2 title:@"作业布置" imageName:@"zy_n" selectImageName:@"zy_s"];

    [self addChildVC:vc3 title:@"消息中心" imageName:@"xx_n" selectImageName:@"xx_s"];

    [self addChildVC:vc4 title:@"课堂评价" imageName:@"kp_n" selectImageName:@"kp_s"];
    currentItem = vc1.navigationController.tabBarItem;
    
}
// 添加子控制器导航
-(void)addChildVC:(UIViewController*)childController title:(NSString*)title imageName:(NSString*)imageName selectImageName:(NSString*)selectImageName
{
    childController.tabBarItem = [[UITabBarItem alloc]initWithTitle:title image:IMG(imageName) selectedImage:IMG(selectImageName)];
    KNavigationController *nav=[[KNavigationController alloc]initWithRootViewController:childController];
    [self addChildViewController:nav];
  
    
}


@end

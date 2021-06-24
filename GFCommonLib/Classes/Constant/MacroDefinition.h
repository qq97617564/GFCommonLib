//
//  MacroDefinition.h
//  NLKJ_App
//
//  Created by 王刚锋 on 2018/7/19.
//  Copyright © 2018年 王刚锋. All rights reserved.
//

#ifndef MacroDefinition_h
#define MacroDefinition_h


//#define timeStamp @"timeStamp"
#define kLoginNotification   @"kLoginNotification"
#define kLogoutNotification  @"kLogoutNotification"

#define phoneKey @"phone"
#define passwordKey @"password"

#define savePW @"savePassword"

/*
 *通配字符大小
 */
#define kFont12  [UIFont systemFontOfSize:12]
#define kFont13  [UIFont systemFontOfSize:13]
#define kFont14  [UIFont systemFontOfSize:14]
#define kFont15  [UIFont systemFontOfSize:15]
#define kFont16  [UIFont systemFontOfSize:16]
#define kFont17  [UIFont systemFontOfSize:17]
#define kFont18  [UIFont systemFontOfSize:18]
/*
 *通配背景颜色
 */
#define kBGColor [UIColor colorWithHexString:@"#567FDF"]
#define kBlueColor [UIColor colorWithHexString:@"#567FDF"]
#define kGreyColor  [UIColor colorWithHexString:@"#888888"]

/*
 *rgb
 */
#define RGBToColor(R,G,B)  [UIColor colorWithRed:(R * 1.0) / 255.0 green:(G * 1.0) / 255.0 blue:(B * 1.0) / 255.0 alpha:1.0]
/*
 *通道rgb
 */
#define rgba(R,G,B,A)  [UIColor colorWithRed:(R * 1.0) / 255.0 green:(G * 1.0) / 255.0 blue:(B * 1.0) / 255.0 alpha:A]
/*
 *rbg
 */
#define HexRGB [UIColor colorWithHexString(a)]
/*
 *用户沙盒目录
 */
#define kUserAccount [KAccount sharedUserAccount]
/*
 *获取uuid
 */
#define UUIDx [[UIDevice currentDevice] identifierForVendor] UUIDString]
/*
 *获取window
 */
#define WINDOW [UIApplication sharedApplication].keyWindow
/*
 *快捷url转换
 */
#define URLWITHSTRING(a) [NSURL URLWithString:a]
/*
 *弱引self
 */
#define WEAKSELF __weak __typeof(&*self)weakSelf_SC = self;

/*
 *压缩图片
 */
#define IMAGECOMPRESS(a) UIImageJPEGRepresentation(a, 0.1)

/*
 *判断手机
 */
#define kJudgePhone(a) \
if (![JYUtils checkTelNumber:a]) { \
SHOWERROR(@"请输入合法手机号!") \
return; \
}

/*
 *合法密码
 */
#define kJudgePassword(a) \
if (![JYUtils checkPassword:a]) { \
SHOWERROR(@"密码为6-16个字母或数字组成!") \
return; \
}
/*
*空值
*/
#define EMPTY_STRING  @""
/*
 *判断空值
 */
#define kJudgeIsEmpty(a, showStr)  if ([a isEqualToString:EMPTY_STRING]) {\
SHOWERROR(showStr);\
return;\
}

/* UIKit */
#define IMG(name) [UIImage imageNamed:name]

/* frame */
#define SCREEN_HEIGHT [[UIScreen mainScreen]bounds].size.height
#define SCREEN_WIDTH  [[UIScreen mainScreen]bounds].size.width
#define kWidth  SCREEN_WIDTH/375.0
#define kHeight SCREEN_HEIGHT/667.0
#define kTabHeight   49
#define kNavHeight   44
//iphone 状态栏
#define kStatusBarHeight [[UIApplication sharedApplication] statusBarFrame].size.height

//底部安全区域
#define kTabbarSafeBottomMargin (IS_IPhoneX_All ? 34.f : 0.f)

//判断 iPhoneX 系列设备
#define IS_IPhoneX_All ([UIScreen mainScreen].bounds.size.height == 812 || [UIScreen mainScreen].bounds.size.height == 896)

/*
 *tableView刷新部分
 */
#define TotalPage  @"totalPage"
#define kNormalRefresh  [self.datas removeAllObjects];\
self.index = 1;\
[self.tableView.mj_footer resetNoMoreData];\
[self getData];\
[self.tableView.mj_header endRefreshing];

#define kNormalFooter if (self.index <= 1) {\
[self.tableView.mj_footer endRefreshingWithNoMoreData];\
return;\
}\
[self getData];\
[self.tableView.mj_footer endRefreshing];\


#define kJudgeTableView(tableView, totalPage) if (totalPage == 0) {\
[self.tableView.mj_footer endRefreshingWithNoMoreData];\
[self.tableView reloadData];\
return ;\
}\
if (self.index > totalPage) {\
    [self.tableView.mj_footer endRefreshingWithNoMoreData];\
    return ;\
}\
self.index ++;\


/*
 *注册cell
 */
#define cellRegisterNibWith(tableView,nibName,identifier)     [tableView registerNib:[UINib nibWithNibName:nibName bundle:nil] forCellReuseIdentifier:identifier];

#define cellRegisterClassWith(tableView,className,identifier) [tableView registerClass:[className class] forCellReuseIdentifier:identifier];

/*
 *注册collectioncell
 */
#define CollectionCellRegisterNibWith(collection,nibName,identifier)      [collection registerNib:[UINib nibWithNibName:nibName bundle:nil] forCellWithReuseIdentifier:identifier];

#define CollectionCellRegisterClassWith(collection,className,identifier) [collection registerClass:[className class] forCellWithReuseIdentifier:identifier];
/*
 *成功显示
 */
#define DISPATCHSUCCESSAFTERONESECONDSHOWTITLE(a) dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.25 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{ \
[MBProgressHUD hideHUD];\
[MBProgressHUD showSuccess:a]; \
});


/*
 *立即
 */
#define SHOWSUCCESS(a) [MBProgressHUD hideHUD];\
[MBProgressHUD showSuccess:a];



/*
 *失败显示
 */
#define DISPATCHERRORAFTERONESECONDSHOWTITLE(a) dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.25 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{ \
[MBProgressHUD hideHUD];\
[MBProgressHUD showError:a];\
});


/*
 *立即
 */
#define SHOWERROR(a) [MBProgressHUD showError:a];



//*****************************  // View 圆角和加边框  宏
#define ViewBorderRadius(View, Radius)\
\
[View.layer setCornerRadius:(Radius)];\
[View.layer setMasksToBounds:YES];\

#define ViewBorder(View, Width, Color)\
\
[View.layer setBorderWidth:(Width)];\
[View.layer setBorderColor:[Color CGColor]];

#define ViewBorderAndRadius(View, Radius, Width, Color)\
\
[View.layer setCornerRadius:(Radius)];\
[View.layer setMasksToBounds:YES];\
[View.layer setBorderWidth:(Width)];\
[View.layer setBorderColor:[Color CGColor]];


/*
 *获取tabbar
 */
#define rootTabBarVC (UITabBarController*)[[[[UIApplication sharedApplication] delegate] window] rootViewController]

/*
 *快捷通知
 */
#define DefaultCenter [NSNotificationCenter defaultCenter]
#define UserDefault [NSUserDefaults standardUserDefaults]
#define RegisterNotice(_name, _selector)                    \
[DefaultCenter addObserver:self  \
selector:_selector name:_name object:nil];


//RSA加密
#define  public_key_path  [[NSBundle mainBundle] pathForResource:@"public_key.der" ofType:nil]
#define  private_key_path  [[NSBundle mainBundle] pathForResource:@"private_key.p12" ofType:nil]
#define  RSdecryptString(str) [RSAEncryptor decryptString:str privateKeyWithContentsOfFile:private_key_path password:@"123456"];
/*
 *debug
 */
#ifdef DEBUG
#   define DELog(fmt, ...) NSLog((@"%s [Line %d] " fmt), __PRETTY_FUNCTION__, __LINE__, ## __VA_ARGS__);
#else
#   define DELog(...)
#endif



#endif /* MacroDefinition_h */

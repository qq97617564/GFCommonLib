//
//  UIAlertTool.m
//  Snwdai
//
//  Created by 张明辉 on 16/3/15.
//  Copyright © 2016年 张明辉. All rights reserved.
//

#import "UIAlertTool.h"
#import <UIKit/UIKit.h>
typedef void (^Confirm)(void);
typedef void (^Cancel)(void);

@interface UIAlertTool()<UIAlertViewDelegate,UIActionSheetDelegate>
@property (nonatomic,strong) Confirm confirmParam;
@property (nonatomic,strong) Cancel cancelParam;
@end

@implementation UIAlertTool

+(instancetype)sharedTool
{
    static UIAlertTool *tool;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        tool = [[UIAlertTool alloc] init];
    });
    return tool;
}
//**************alert
+(void)showAlertViewWithTitle:(NSString *)title message:(NSString *)message cancelButtonTitle:(NSString *)cancelButtonTitle otherButtonTitle:(NSString *)otherButtonTitle confirm:(void (^)(void))confirm cancle:(void (^)(void))cancel
{
    UIAlertTool *tool = [UIAlertTool sharedTool];
    tool.confirmParam = confirm;
    tool.cancelParam = cancel;
    
    if ([[[UIDevice currentDevice] systemVersion] floatValue] >= 8.0) {
        
        UIAlertController *alertController = [UIAlertController alertControllerWithTitle:title message:message preferredStyle:UIAlertControllerStyleAlert];
        // Create the actions.
        UIColor *cancelColor=[UIColor grayColor];
        UIAlertAction *cancelAction = [UIAlertAction actionWithTitle:cancelButtonTitle style:UIAlertActionStyleDefault handler:^(UIAlertAction *action) {
            if (cancel) {
                cancel();
            }
        }];
        [cancelAction setValue:cancelColor forKey:@"titleTextColor"];
        [alertController addAction:cancelAction];
        
        UIColor *otherColor=[UIColor colorWithHexString:@"FF4621"];
        if (otherButtonTitle) {
            UIAlertAction *otherAction = [UIAlertAction actionWithTitle:otherButtonTitle style:UIAlertActionStyleDefault handler:^(UIAlertAction *action) {
                if (confirm) {
                    confirm();
                }
            }];
            [otherAction setValue:otherColor forKey:@"titleTextColor"];
            [alertController addAction:otherAction];
        }
        [rootTabBarVC presentViewController:alertController animated:YES completion:nil];
    }else{
        
        UIAlertView *titleAlert = [[UIAlertView alloc] initWithTitle:title message:message delegate:self cancelButtonTitle:cancelButtonTitle otherButtonTitles:otherButtonTitle,nil];
        [titleAlert show];
    }
}

+(void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex
{
    UIAlertTool *tool = [UIAlertTool sharedTool];
    if (buttonIndex==0) {
        if (tool.cancelParam) {
            tool.cancelParam();
        }
    } else {
        if (tool.confirmParam) {
            tool.confirmParam();
        }
    }
}


//**************action sheet
+(void)showActionSheetWithTitle:(NSString *)title message:(NSString *)message cancelButtonTitle:(NSString *)cancelButtonTitle otherButtonTitle:(NSString *)otherButtonTitle confirm:(void (^)(void))confirm cancle:(void (^)(void))cancel
{
    UIAlertController *actionSheetController = [UIAlertController alertControllerWithTitle:title message:message preferredStyle:UIAlertControllerStyleActionSheet];
    // Create the actions.
    UIAlertAction *cancelAction = [UIAlertAction actionWithTitle:cancelButtonTitle style:UIAlertActionStyleCancel handler:^(UIAlertAction *action) {
        if (cancel) {
            cancel();
        }
    }];
    // Add the actions.
    [actionSheetController addAction:cancelAction];
    
    if (otherButtonTitle) {
        UIAlertAction *otherAction = [UIAlertAction actionWithTitle:otherButtonTitle style:UIAlertActionStyleDefault handler:^(UIAlertAction *action) {
            if (confirm) {
                confirm();
            }
        }];
        [actionSheetController addAction:otherAction];
    }
    [rootTabBarVC presentViewController:actionSheetController animated:YES completion:nil];

}

+(void)showActionSheetWithWomenConfirm:(void (^)(NSString *sex))confirm
{
    UIAlertController *actionSheetController = [UIAlertController alertControllerWithTitle:nil message:nil preferredStyle:UIAlertControllerStyleActionSheet];
    // Create the actions.
    UIAlertAction *womenAction = [UIAlertAction actionWithTitle:@"女" style:UIAlertActionStyleDefault handler:^(UIAlertAction *action) {
        if (confirm) {
            confirm(@"女");
        }
    }];
    // Add the actions.
    [actionSheetController addAction:womenAction];

    // Create the actions.
    UIAlertAction *menAction = [UIAlertAction actionWithTitle:@"男" style:UIAlertActionStyleDefault handler:^(UIAlertAction *action) {
        if (confirm) {
            confirm(@"男");
        }
    }];
    // Add the actions.
    [actionSheetController addAction:menAction];
    
    // Create the actions.
    UIAlertAction *cancelAction = [UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleCancel handler:^(UIAlertAction *action) {
    }];
    // Add the actions.
    [actionSheetController addAction:cancelAction];
    
    [rootTabBarVC presentViewController:actionSheetController animated:YES completion:nil];
}

+(void)showActionSheetWithWith:(UIView *)view endTitle:(NSString *)title endtitileArr:(NSArray *)titleArr Confirm:(void (^)(NSString *sex))confirm{
UIAlertController *actionSheetController = [UIAlertController alertControllerWithTitle:title message:nil preferredStyle:UIAlertControllerStyleActionSheet];
    for (int i = 0; i<titleArr.count; i++) {

        UIAlertAction *otherAction = [UIAlertAction actionWithTitle:titleArr[i] style:UIAlertActionStyleDefault handler:^(UIAlertAction *action) {
            if (confirm) {
                confirm(titleArr[i]);
            }
        }];
        [actionSheetController addAction:otherAction];
    }

    UIPopoverPresentationController *popover = actionSheetController.popoverPresentationController;
    if (popover)
    {
        popover.sourceView = view;
        popover.sourceRect = view.bounds;
        popover.permittedArrowDirections = UIPopoverArrowDirectionAny;
    }
        UIAlertAction *cancelAction = [UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleCancel handler:^(UIAlertAction *action) {
        }];
        // Add the actions.
        [actionSheetController addAction:cancelAction];
    

    
}
@end

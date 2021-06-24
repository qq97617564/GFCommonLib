//
//  UIViewController+Awesome.m
//  rongcloud_testDemo
//
//  Created by WangGangFeng on 17/8/23.
//  Copyright © 2017年 WGF. All rights reserved.
//

#import "UIViewController+Awesome.h"
#import <objc/runtime.h>
#import <AssetsLibrary/ALAssetsLibrary.h>

static  BOOL canEdit = NO;
static  char blockKey;


@interface UIViewController ()< UIActionSheetDelegate, UIImagePickerControllerDelegate,UIAlertViewDelegate,UINavigationControllerDelegate>
@property (nonatomic, copy) PhotoBlock photoBlock;
@end

@implementation UIViewController (Awesome)

#pragma mark - set
- (void)setPhotoBlock:(PhotoBlock)photoBlock
{
    objc_setAssociatedObject(self, &blockKey, photoBlock, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}
#pragma mark - get
- (PhotoBlock )photoBlock
{
    return objc_getAssociatedObject(self, &blockKey);
}

- (void)showCanEdit:(BOOL)edit photo:(PhotoBlock)block
{
    if(edit) canEdit = edit;
    
    self.photoBlock = [block copy];
    UIActionSheet *sheet  = [[UIActionSheet alloc] initWithTitle:nil delegate:self cancelButtonTitle:@"取消" destructiveButtonTitle:nil otherButtonTitles:@"拍照", @"相册中获取", nil];
    sheet.tag = 2599;
    [sheet showInView:self.view];
    
}
#pragma mark - action sheet delegte
- (void)actionSheet:(UIActionSheet *)actionSheet didDismissWithButtonIndex:(NSInteger)buttonIndex;{
    if (actionSheet.tag == 2599)
    {
        //权限
        ALAuthorizationStatus author = [ALAssetsLibrary authorizationStatus];
        if (author == ALAuthorizationStatusRestricted || author ==ALAuthorizationStatusDenied) {
            CGFloat kSystemMainVersion = [UIDevice currentDevice].systemVersion.floatValue;
            NSString *title = nil;
            NSString *photoType = buttonIndex==0?@"相机":@"相册";
            NSString *msg = [NSString stringWithFormat:@"还没有开启%@权限,请在系统设置中开启",photoType];
            NSString *cancelTitle = @"暂不";
            NSString *otherButtonTitles = @"去设置";
            
            if (kSystemMainVersion < 8.0) {
                title = [NSString stringWithFormat:@"%@权限未开启",photoType];
                msg = [NSString stringWithFormat:@"请在系统设置中开启%@服务\n(设置>隐私>%@>开启)",photoType,photoType];
                cancelTitle = @"知道了";
                otherButtonTitles = nil;
            }
            
            UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:title message:msg delegate:self cancelButtonTitle:cancelTitle otherButtonTitles:otherButtonTitles, nil];
            alertView.tag = 2598;
            [alertView show];
            return;
        }
        //跳转到相机/相册页面
        UIImagePickerController* imagePickerController = [[UIImagePickerController alloc] init];
        imagePickerController.delegate = self;
        imagePickerController.allowsEditing = canEdit;
        switch (buttonIndex)
        {
            case 0:
                //拍照
                //是否支持相机
                if([UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypeCamera])
                {
                    imagePickerController.sourceType = UIImagePickerControllerSourceTypeCamera;
                    
                    [self presentViewController:imagePickerController animated:YES completion:NULL];
                }
                else
                {
                    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"温馨提示" message:@"该设备不支持相机" delegate:nil cancelButtonTitle:@"确定" otherButtonTitles:nil, nil];
                    [alert show];
                }
                break;
            case 1:
                //相册
                imagePickerController.title = @"头像选取";
                imagePickerController.sourceType =UIImagePickerControllerSourceTypePhotoLibrary;
                [self presentViewController:imagePickerController animated:YES completion:NULL];
            default:
                break;
        }
    }
}

- (void)actionSheet:(UIActionSheet *)actionSheet clickedButtonAtIndex:(NSInteger)buttonIndex
{
    if (actionSheet.tag == 2599)
    {
        //权限
        ALAuthorizationStatus author = [ALAssetsLibrary authorizationStatus];
        if (author == ALAuthorizationStatusRestricted || author ==ALAuthorizationStatusDenied) {
            CGFloat kSystemMainVersion = [UIDevice currentDevice].systemVersion.floatValue;
            NSString *title = nil;
            NSString *photoType = buttonIndex==0?@"相机":@"相册";
            NSString *msg = [NSString stringWithFormat:@"还没有开启%@权限,请在系统设置中开启",photoType];
            NSString *cancelTitle = @"暂不";
            NSString *otherButtonTitles = @"去设置";
            
            if (kSystemMainVersion < 8.0) {
                title = [NSString stringWithFormat:@"%@权限未开启",photoType];
                msg = [NSString stringWithFormat:@"请在系统设置中开启%@服务\n(设置>隐私>%@>开启)",photoType,photoType];
                cancelTitle = @"知道了";
                otherButtonTitles = nil;
            }
            
            UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:title message:msg delegate:self cancelButtonTitle:cancelTitle otherButtonTitles:otherButtonTitles, nil];
            alertView.tag = 2598;
            [alertView show];
            return;
        }
        //跳转到相机/相册页面
        UIImagePickerController* imagePickerController = [[UIImagePickerController alloc] init];
        imagePickerController.delegate = self;
        imagePickerController.allowsEditing = canEdit;
        switch (buttonIndex)
        {
            case 0:
                //拍照
                //是否支持相机
                if([UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypeCamera])
                {
                    imagePickerController.sourceType = UIImagePickerControllerSourceTypeCamera;
                    
                    [self presentViewController:imagePickerController animated:YES completion:NULL];
                }
                else
                {
                    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"温馨提示" message:@"该设备不支持相机" delegate:nil cancelButtonTitle:@"确定" otherButtonTitles:nil, nil];
                    [alert show];
                }
                break;
            case 1:
                //相册
                imagePickerController.title = @"头像选取";
                imagePickerController.sourceType =UIImagePickerControllerSourceTypePhotoLibrary;
                [self presentViewController:imagePickerController animated:YES completion:NULL];
            default:
                break;
        }
    }
}
#pragma mark - UIAlertDelegate
- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex{
    if(alertView.tag==2598)
    {
        if (buttonIndex == 1) {
            CGFloat kSystemMainVersion = [UIDevice currentDevice].systemVersion.floatValue;
            if (kSystemMainVersion >= 8.0) {
                NSURL *url = [NSURL URLWithString:UIApplicationOpenSettingsURLString];
                if ([[UIApplication sharedApplication] canOpenURL:url]) {
                    [[UIApplication sharedApplication] openURL:url];
                }
                //@"1.iOS8以后支持跳转到设置,设置完成后,系统会自启应用,刷新应用权限 2.由于系统自启应用,连接Xcode调试会crash,断开与Xcode连接,进行操作即可";
            }
        }
    }
}
#pragma mark - image picker delegte
- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info
{
    [picker dismissViewControllerAnimated:YES completion:^{
        
    }];
    
    UIImage *image;
    //是否要裁剪
    if ([picker allowsEditing]){
        
        //编辑之后的图像
        image = [info objectForKey:UIImagePickerControllerEditedImage];
        
    } else {
        
        image = [info objectForKey:UIImagePickerControllerOriginalImage];
    }
    if(self.photoBlock)
    {
        self.photoBlock(image);
    }
}
@end

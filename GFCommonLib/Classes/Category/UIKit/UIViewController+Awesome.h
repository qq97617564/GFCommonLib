//
//  UIViewController+Awesome.h
//  rongcloud_testDemo
//
//  Created by WangGangFeng on 17/8/23.
//  Copyright © 2017年 WGF. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIViewController (Awesome)
typedef void(^PhotoBlock)(UIImage *photo);

/**
 *  照片选择->图库/相机
 *
 *  @param edit  照片是否需要裁剪,默认NO
 *  @param block 照片回调
 */
- (void)showCanEdit:(BOOL)edit photo:(PhotoBlock)block;

@end

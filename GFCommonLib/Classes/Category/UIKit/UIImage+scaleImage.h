//
//  UIImage+scaleImage.h
//  ChatDemo-UI3.0
//
//  Created by Buddha on 16/2/4.
//  Copyright © 2016年 Buddha. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImage (scaleImage)

/// 根据固定宽度的尺寸来得到压缩后的图片
+(UIImage *) imageCompressForWidth:(UIImage *)sourceImage targetWidth:(CGFloat)defineWidth;
/// 根据固定宽度的尺寸来得到压缩后的图片二进制数据
+(NSData *) imageDataCompressForWidth:(UIImage *)sourceImage targetWidth:(CGFloat)defineWidth andScale:(CGFloat)scale;

@end

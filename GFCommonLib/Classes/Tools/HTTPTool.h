//
//  HTTPTool.h
//  NLKJ_App
//
//  Created by 王刚锋 on 2018/7/19.
//  Copyright © 2018年 王刚锋. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import <AFNetworking.h>
#import "GFCommonManager.h"
#import "kbackModel.h"
typedef void (^SuccessBlock)(NSDictionary *data);
typedef void (^FailureBlock)(NSError *error);


@interface HTTPTool : NSObject

@property (nonatomic, copy) SuccessBlock successBlock;
@property (nonatomic, copy) FailureBlock failureBlock;


+(AFHTTPSessionManager *)shareHTTPSessionManager;
/**
 *发送get请求
 * urlstring 请求的基本的url
 *parameters 请求的参数字典
 * success 请求成功的回调
 *failure 请求失败的回调
 */
+(void)GET:(NSString *)URLString
parameters:(id)parameters
   success:(void (^)( id responseObject))success
   failure:(void (^)( NSError *error))failure;
/**
 *发送post请求
 * urlstring 请求的基本的url
 *parameters 请求的参数字典
 * success 请求成功的回调
 *failure 请求失败的回调
 */
+(void)POST:(NSString *)URLString
 parameters:(id)parameters
    success:(void (^)( id responseObject))success
    failure:(void (^)( NSError *error))failure;
/**
 *发送post请求
 * urlstring 请求的基本的url
 *parameters 请求的参数字典
 *callback   请求成功的回调
 */
+(void)POST:(NSString *)URLString
 parameters:(id)parameters
       call:(void (^)(KbackModel *info))callback;

/**
 *发送get请求
 * btn 防止多次快速请求
 * urlstring 请求的基本的url
 *parameters 请求的参数字典
 * success 请求成功的回调
 *failure 请求失败的回调
 */
+(void)GET:(UIButton *)btn urlString:(NSString *)URLString
parameters:(id)parameters
   success:(void (^)( id responseObject))success
   failure:(void (^)( NSError *error))failure;



//+(void)POST:(NSString *)URLString
// parameters:(id)parameters
//       call:(void (^)( SResBase* info))callback;

/**
 *发送post请求
 * btn 防止多次快速请求
 * urlstring 请求的基本的url
 *parameters 请求的参数字典
 * success 请求成功的回调
 *failure 请求失败的回调
 */
+(void)POST:(UIButton *)btn urlString:(NSString *)URLString
 parameters:(id)parameters
    success:(void (^)( id responseObject))success
    failure:(void (^)( NSError *error))failure;

/** 上传图片 **/
+ (void)upLoadDataWithUrlString:(NSString *)URLString parameters:(id)parameters withImage:(UIImage *)image
                     progress:(void (^)( id progress))progress
                      success:(void (^)( id responseObject))success
                      failure:(void (^)( NSError *error))failure;
+ (void)upLoadDataWithUrlString:(NSString *)URLString parameters:(id)parameters withImage:(UIImage *)image name:(NSString *)name
                       progress:(void (^)( id progress))progress
                        success:(void (^)( id responseObject))success
                        failure:(void (^)( NSError *error))failure;
//+ (id)upLoadDataWithUrlString:(NSString *)URLString parameters:(id)parameters withVideoData:(NSString *)VideoUrl completionHandler:(void (^)(id, NSError *))completionHandler;
#pragma mark 检测网路状态
+ (void)netWorkStatusReachable:(void (^)(bool isReachable))reachable;

//- (NSString *)getRandomStringWithNum:(NSInteger)num;
@end

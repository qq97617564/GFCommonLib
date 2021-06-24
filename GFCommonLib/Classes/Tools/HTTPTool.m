//
//  HTTPTool.m
//  NLKJ_App
//
//  Created by 王刚锋 on 2018/7/19.
//  Copyright © 2018年 王刚锋. All rights reserved.
//

#import "HTTPTool.h"
//#import <CommonCrypto/CommonDigest.h>
//#import "GFAES128.h"
//#import "RSAEncryptor.h"
//#import "RSA.h"
//#import "NSData+AES128.h"

//static AFHTTPSessionManager *Manager = nil;
@implementation HTTPTool

//+(AFHTTPSessionManager *)shareHTTPSessionManager{
//    static AFHTTPSessionManager *Manager = nil;
//    static dispatch_once_t onceToken;
//    dispatch_once(&onceToken, ^{
//        Manager = [[AFHTTPSessionManager alloc] initWithBaseURL:[NSURL URLWithString:kBaseURL]];
//        Manager.responseSerializer.acceptableContentTypes = [NSSet setWithArray:@[ @"image/jpeg", @"image/png",@"text/html", @"text/plain", @"text/json", @"text/javascript", @"application/json"]];
//        Manager.requestSerializer.timeoutInterval = 15;
//    });
//    return Manager;
////
////    NSMutableDictionary *HeadParameter = [NSMutableDictionary dictionary];
////    HeadParameter[@"version"] =  [[[NSBundle mainBundle] infoDictionary] objectForKey:@"CFBundleShortVersionString"];
////    HeadParameter[@"system"]  =  @"ios";
////    HeadParameter[@"model"]   =  [[UIDevice currentDevice] model];
////    HeadParameter[@"uuid"]    =  [UUIDManager getDeviceID];
////    NSArray *signArray = [NSArray SortAnArray:HeadParameter];
////    NSString *sign = [signArray componentsJoinedByString:@"_"];
////
////
////    NSInteger timeS =[[NSString getNowInterval] integerValue];
////    timeS-= [[UserDefault objectForKey:timeStamp] integerValue];
////    HeadParameter[@"time"] =[NSString stringWithFormat:@"%ld",timeS];
////    sign = [NSString stringWithFormat:@"%@%@%@",sign,pulic_key,HeadParameter[@"time"] ];
////
////    NSString *key = [[NSString new] getRandomStringWithNum:16];//16位秘钥
////
////    RSAEncryptor* rsaEncryptor = [RSAEncryptor sharedInstance];       //RSA加密
////    NSString *signString = [GFAES128 AES128Encrypt:sign key:key];     //AES加密
////    HeadParameter[@"sign"]   = signString; //
////    HeadParameter[@"secret"] = [rsaEncryptor rsaEncryptString:key];
////
////
////    NSData *data = [HeadParameter[@"secret"] dataUsingEncoding:NSUTF8StringEncoding];
////    NSString *base64String = [data base64EncodedStringWithOptions:0];
////
////    AFHTTPSessionManager *Manager = [[AFHTTPSessionManager alloc] initWithBaseURL:[NSURL URLWithString:kBaseURL]];
////    Manager.responseSerializer.acceptableContentTypes = [NSSet setWithArray:@[ @"image/jpeg", @"image/png",@"text/html", @"text/plain", @"text/json", @"text/javascript", @"application/json"]];
////    Manager.requestSerializer.timeoutInterval = 15;
////    [Manager.requestSerializer setValue:base64String           forHTTPHeaderField:@"secret"];
////    [Manager.requestSerializer setValue:HeadParameter[@"time"]    forHTTPHeaderField:@"time"];
////    [Manager.requestSerializer setValue:HeadParameter[@"sign"]    forHTTPHeaderField:@"sign"];
////    [Manager.requestSerializer setValue:HeadParameter[@"version"] forHTTPHeaderField:@"version"];
////    [Manager.requestSerializer setValue:HeadParameter[@"system"]  forHTTPHeaderField:@"system"];
////    [Manager.requestSerializer setValue:HeadParameter[@"model"]   forHTTPHeaderField:@"model"];
////    [Manager.requestSerializer setValue:HeadParameter[@"uuid"]    forHTTPHeaderField:@"uuid"];
////
////    if (kUserAccount.token) {
////
////     [Manager.requestSerializer setValue:kUserAccount.token   forHTTPHeaderField:@"token"];
////    }
//
//
//
////    return Manager;
//}
//+(void)GET:(NSString *)URLString parameters:(id)parameters success:(void (^)( id responseObject))success failure:(void (^)( NSError *error))failure
//{
//     AFHTTPSessionManager *session = [HTTPTool shareHTTPSessionManager];
//    [session GET:URLString parameters:parameters headers:nil progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
//        KbackModel *baseModel = [KbackModel mj_objectWithKeyValues:responseObject];
//        //
//        if (baseModel.code.integerValue==200) {
//            success((NSDictionary *)baseModel.content);
//        }else if(baseModel.code.integerValue==3){
//            [[NSNotificationCenter defaultCenter]postNotificationName:@"outLogin" object:nil];
//        }else{
//
//            DISPATCHERRORAFTERONESECONDSHOWTITLE(baseModel.msg);
//            failure(0);
//        }
//    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
//        DISPATCHERRORAFTERONESECONDSHOWTITLE(@"请求失败，请检查网络");
//        failure(error);
//    }];
//
//}
//
//+(void)POST:(NSString *)URLString parameters:(id)parameters success:(void (^)(id))success failure:(void (^)(NSError *))failure
//{
//
//    AFHTTPSessionManager *session = [HTTPTool shareHTTPSessionManager];
//
//    NSMutableDictionary *params = [parameters mj_keyValues];
//
//    [session POST:URLString parameters:params headers:nil progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
//        KbackModel *baseModel = [KbackModel mj_objectWithKeyValues:responseObject];
//
//        if (baseModel.code.integerValue==200) {
//
//            success(baseModel.content);
//
//        }else if(baseModel.code.integerValue==3){
//
//            [[NSNotificationCenter defaultCenter]postNotificationName:@"outLogin" object:nil];
//
//        }else{
//
//            DISPATCHERRORAFTERONESECONDSHOWTITLE(baseModel.msg);
//
//            failure(0);
//
//        }
//        } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
//            DISPATCHERRORAFTERONESECONDSHOWTITLE(@"请求失败，请检查网络");
//
//            failure(error);
//        }];
//
//
//
//}
//+(void)POST:(NSString *)URLString parameters:(id)parameters call:(void (^)(KbackModel *info))callback{
//
//    NSMutableDictionary *params = [parameters mj_keyValues];
//
//    AFHTTPSessionManager *session = [HTTPTool shareHTTPSessionManager];
//
//    [session POST:URLString parameters:params headers:nil progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
//
//        KbackModel *baseModel = [KbackModel mj_objectWithKeyValues:responseObject];
//        //
//        if (baseModel.code.integerValue==200) {
//            DISPATCHSUCCESSAFTERONESECONDSHOWTITLE(baseModel.msg);
//            callback(baseModel);
//        }else if(baseModel.code.integerValue==3){
//            [[NSNotificationCenter defaultCenter]postNotificationName:@"outLogin" object:nil];
//        }else{
//
//            DISPATCHERRORAFTERONESECONDSHOWTITLE(baseModel.msg);
//
//
//        }
//    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
//        DISPATCHERRORAFTERONESECONDSHOWTITLE(@"请求失败，请检查网络");
//
//
//    }];
//
//
//}
//
//
////按钮点击的post
//+(void)POST:(UIButton *)btn urlString:(NSString *)URLString parameters:(id)parameters success:(void (^)(id))success failure:(void (^)(NSError *))failure
//{
//    btn.enabled = NO;
//    [self POST:URLString parameters:parameters success:^(id responseObject) {
//        btn.enabled = YES;
//        if (success) {
//            success(responseObject);
//        }
//    } failure:^(NSError *error) {
//        btn.enabled = YES;
//        if (failure) {
//            failure(error);
//        }
//    }];
//}
////按钮点击get
//+(void)GET:(UIButton *)btn urlString:(NSString *)URLString parameters:(id)parameters success:(void (^)(id))success failure:(void (^)(NSError *))failure
//{
//    btn.enabled = NO;
//    [self GET:URLString parameters:parameters success:^(id responseObject) {
//        btn.enabled = YES;
//        if (success) {
//            success(responseObject);
//        }
//    } failure:^(NSError *error) {
//        btn.enabled = YES;
//        if (failure) {
//            failure(error);
//        }
//    }];
//}
//
//+ (void)upLoadDataWithUrlString:(NSString *)URLString parameters:(id)parameters withImage:(UIImage *)image  progress:(void (^)( id progress))progress
//                        success:(void (^)( id responseObject))success
//                        failure:(void (^)( NSError *error))failure{
//    NSMutableDictionary *params = [parameters mj_keyValues];
//
//    AFHTTPSessionManager *session = [HTTPTool shareHTTPSessionManager];
//
//    [session POST:URLString parameters:params headers:nil constructingBodyWithBlock:^(id<AFMultipartFormData>  _Nonnull formData) {
//
//            NSData *imageData = UIImageJPEGRepresentation(image, 0.5);
//            NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
//            // 设置时间格式
//            [formatter setDateFormat:@"yyyyMMddHHmmss"];
//            NSString *dateString = [formatter stringFromDate:[NSDate date]];
//            NSString *fileName = [NSString  stringWithFormat:@"%@.jpg", dateString];
//            [formData appendPartWithFileData:imageData name:@"headPortrait" fileName:fileName mimeType:@"image/jpeg"];
//        } progress:^(NSProgress * _Nonnull uploadProgress) {
//            progress(uploadProgress);
//        } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
//            KbackModel *baseModel = [KbackModel mj_objectWithKeyValues:responseObject];
//            if (baseModel.code.integerValue==200) {
//
//                success(baseModel.content);
//            }else{
//                DISPATCHERRORAFTERONESECONDSHOWTITLE(baseModel.msg);
//                failure(0);
//            }
//        } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
//            DISPATCHERRORAFTERONESECONDSHOWTITLE(@"请求失败，请检查网络");
//            failure(error);
//        }];
//
//
//
//}
//+ (void)upLoadDataWithUrlString:(NSString *)URLString parameters:(id)parameters withImage:(UIImage *)image name:(NSString *)name  progress:(void (^)( id progress))progress
//                        success:(void (^)( id responseObject))success
//                        failure:(void (^)( NSError *error))failure{
//    AFHTTPSessionManager *session = [HTTPTool shareHTTPSessionManager];
//    NSMutableDictionary *params = [parameters mj_keyValues];
//
//    [session POST:URLString parameters:params headers:nil constructingBodyWithBlock:^(id<AFMultipartFormData>  _Nonnull formData) {
//            NSData *imageData = UIImageJPEGRepresentation(image, 0.5);
//            NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
//            // 设置时间格式
//            [formatter setDateFormat:@"yyyyMMddHHmmss"];
//            NSString *dateString = [formatter stringFromDate:[NSDate date]];
//            NSString *fileName = [NSString  stringWithFormat:@"%@.jpg", dateString];
//            [formData appendPartWithFileData:imageData name:name fileName:fileName mimeType:@"image/jpeg"];
//        } progress:^(NSProgress * _Nonnull uploadProgress) {
//            progress(uploadProgress);
//        } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
//            KbackModel *baseModel = [KbackModel mj_objectWithKeyValues:responseObject];
//            if (baseModel.code.integerValue==200) {
//
//                success(baseModel.content);
//            }else{
//                DISPATCHERRORAFTERONESECONDSHOWTITLE(baseModel.msg);
//                failure(0);
//            }
//        } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
//            DISPATCHERRORAFTERONESECONDSHOWTITLE(@"请求失败，请检查网络");
//            failure(error);
//        }];
//
//
//
//}
////
////
////
//+ (void)showAlertWithError:(NSError *)error
//{
//    //如果请求超时的话
//    if (error.code == -1001) {
//        //                [UIAlertTool showAlertViewWithTitle:@"亲" message:@"网速不给力哦!" cancelButtonTitle:@"确定" otherButtonTitle:nil confirm:nil cancle:nil];
//    }
//    //如果断网的话
//    if (error.code == -1009) {
//        //        [UIAlertTool showAlertViewWithTitle:@"亲" message:@"木有联网哦!" cancelButtonTitle:@"确定" otherButtonTitle:nil confirm:nil cancle:nil];
//    }
//    //如果服务器挂了的话
//    if (error.code == -1004) {
//        //        [UIAlertTool showAlertViewWithTitle:@"抱歉" message:@"服务器异常！" cancelButtonTitle:@"确定" otherButtonTitle:nil confirm:nil cancle:nil];
//    }
//}
//
//#pragma mark 检测网路状态
//+ (void)netWorkStatusReachable:(void (^)(bool isReachable))reachable
//{
//    // 1.获得网络监控的管理者
//    AFNetworkReachabilityManager *mgr = [AFNetworkReachabilityManager sharedManager];
//    // 2.设置网络状态改变后的处理
//    [mgr setReachabilityStatusChangeBlock:^(AFNetworkReachabilityStatus status) {
//        // 当网络状态改变了, 就会调用这个block
//        switch (status)
//        {
//            case AFNetworkReachabilityStatusUnknown: // 未知网络
//               DELog(@"未知网络");
//                break;
//            case AFNetworkReachabilityStatusNotReachable: // 没有网络(断网)
//                break;
//            case AFNetworkReachabilityStatusReachableViaWWAN: // 手机自带网络
//                DELog(@"手机自带网络");
//                break;
//            case AFNetworkReachabilityStatusReachableViaWiFi: // WIFI
//                DELog(@"WIFI");
//                break;
//        }
//    }];
//    [mgr startMonitoring];
//}


@end

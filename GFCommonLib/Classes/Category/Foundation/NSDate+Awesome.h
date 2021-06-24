//
//  NSDate+Awesome.h
//  HaiHe
//
//  Created by Davis on 17/3/24.
//  Copyright © 2017年 Davis. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSDate (Awesome)
+ (NSDate *)dateWithString:(NSString *)dateString;

+ (NSDate *)getDateWithString:(NSString *)dateString;

- (NSString *)dateString;

/*
 * 获取周几 
 *  [1 - Sunday]
 *  [2 - Monday]
 *  [3 - Tuerday]
 *  [4 - Wednesday]
 *  [5 - Thursday]
 *  [6 - Friday]
 *  [7 - Saturday]
 */
+ (NSString *)weekday:(NSDate *)date;
/** 日 */
+ (NSString *)getDay;
/** 月 */
+ (NSString *)getMonth;
/** 日 */
+ (NSString *)getYear;

//+ (NSString *)GetTimeStamp;
@end

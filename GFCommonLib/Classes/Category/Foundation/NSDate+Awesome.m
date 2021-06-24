//
//  NSDate+Awesome.m
//  HaiHe
//
//  Created by Davis on 17/3/24.
//  Copyright © 2017年 Davis. All rights reserved.
//

#import "NSDate+Awesome.h"
#import <objc/runtime.h>

@implementation NSDate (Awesome)
+ (NSDate *)dateWithString:(NSString *)dateString {
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    formatter.locale = [[NSLocale alloc] initWithLocaleIdentifier:@"en"];
    formatter.dateFormat = @"yyyy-MM-dd HH:mm:ss";
    NSDate *date = [formatter dateFromString:dateString];
    return date;
}

+ (NSDate *)getDateWithString:(NSString *)dateString {
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    formatter.locale = [[NSLocale alloc] initWithLocaleIdentifier:@"en"];
    formatter.dateFormat = @"yyyy-MM-dd";
    NSDate *date = [formatter dateFromString:dateString];
    return date;
}

- (NSString *)dateString {
    NSCalendar *calendar = [NSCalendar currentCalendar];
    
    if ([calendar isDateInToday:self]) {
        NSDate *date = [NSDate date];
        double interval = [date timeIntervalSinceDate:self];
        if (interval < 60) {
            return @"刚刚";
        }
        if (interval < 60 * 60) {
            int i = (int)(interval / 60);
            NSString *str = [NSString stringWithFormat:@"%d分钟前", i];
            return str;
        }
        int hour = (int)(interval/(60 * 60));
        NSString *str = [NSString stringWithFormat:@"%d小时前", hour];
        return str;
    }
    NSMutableString *formatterStr = [NSMutableString stringWithString:@"HH:mm"];
    
    if ([calendar isDateInYesterday:self]) {
        [formatterStr insertString:@"昨天 " atIndex:0];
    } else {
        [formatterStr insertString:@"MM-dd " atIndex:0];
        NSDateComponents *comp = [calendar components:NSCalendarUnitYear fromDate:self toDate:[NSDate date] options:0];
        if (comp.year > 1) {
            [formatterStr insertString:@"yyyy-" atIndex:0];
        }
    }
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    formatter.dateFormat = formatterStr;
    formatter.locale = [[NSLocale alloc] initWithLocaleIdentifier:@"en"];
    return [formatter stringFromDate:self];
}

+ (NSString *)weekday:(NSDate *)date {
    NSCalendar *gregorian = [[NSCalendar alloc]
                             initWithCalendarIdentifier:NSCalendarIdentifierGregorian];
    NSDateComponents *comps = [gregorian components:(NSCalendarUnitDay | NSCalendarUnitMonth | NSCalendarUnitYear | NSCalendarUnitWeekday) fromDate:date];
    NSInteger weekday = [comps weekday];
    
    NSString *weekStr;
    switch (weekday) {
        case 1:
            weekStr = @"星期日";
            break;
        case 2:
            weekStr = @"星期一";
            break;
        case 3:
            weekStr = @"星期二";
            break;
        case 4:
            weekStr = @"星期三";
            break;
        case 5:
            weekStr = @"星期四";
            break;
        case 6:
            weekStr = @"星期五";
            break;
        case 7:
            weekStr = @"星期六";
            break;
        default:
            break;
    }
    return weekStr;
}

/** 日 */
+ (NSString *)getDay {
    NSInteger day = [self getYMD:@"dd"];
    return [NSString stringWithFormat:@"%02ld", day];
}
/** 月 */
+ (NSString *)getMonth {
    NSInteger month =  [self getYMD:@"MM"];
    return [NSString stringWithFormat:@"%02ld", month];
}
/** 日 */
+ (NSString *)getYear {
    NSInteger year = [self getYMD:@"yyyy"];
    return [NSString stringWithFormat:@"%ld", year];
}

+ (NSInteger)getYMD:(NSString *)format {
    NSDateFormatter *formatter = [[NSDateFormatter alloc]init];
    [formatter setDateFormat:format];
    NSInteger ymd = [[formatter stringFromDate:[NSDate date]] integerValue];
    return ymd;
}

@end

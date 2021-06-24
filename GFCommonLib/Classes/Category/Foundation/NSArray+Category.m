//
//  NSArray+Category.m
//  NLKJ_App
//
//  Created by 王刚锋 on 2018/7/24.
//  Copyright © 2018年 王刚锋. All rights reserved.
//

#import "NSArray+Category.h"

@implementation NSArray (Category)
+(NSArray *)SortAnArray:(id)parameters{
    //序列化器对数组进行排序的block 返回值为排序后的数组
    NSArray *allArray = [parameters allKeys];
    NSArray *afterSortKeyArray = [allArray sortedArrayUsingComparator:^NSComparisonResult(id  _Nonnull obj1, id _Nonnull obj2) {
        //小写转化
        obj1 = [obj1 lowercaseString];
        obj2 = [obj2 lowercaseString];
        //排序操作
        NSComparisonResult resuest = [obj1 compare:obj2];
        return resuest;
    }];
    //通过排列的key值获取value
    NSMutableArray *valueArray = [NSMutableArray array];
    for (NSString *sortsing in afterSortKeyArray) {
        NSString *valueString = [parameters objectForKey:sortsing];
        [valueArray addObject:valueString];
    }
    NSMutableArray *signArray = [NSMutableArray array];
    for (int i = 0; i < afterSortKeyArray.count; i++) {
        NSString *keyValueStr = [NSString stringWithFormat:@"%@%@",afterSortKeyArray[i],valueArray[i]];
        [signArray addObject:keyValueStr];
    }
    return signArray;
}
@end

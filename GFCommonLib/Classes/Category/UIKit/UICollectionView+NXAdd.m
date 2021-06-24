//
//  UICollectionView+NXAdd.m
//  NCube
//
//  Created by kepuna on 2016/12/21.
//  Copyright © 2016年 junjie.liu. All rights reserved.
//

#import "UICollectionView+NXAdd.h"

@implementation UICollectionView (NXAdd)

+ (instancetype)nc_collectionViewWithCellClass:(Class)cellClass Flowlayout:(UICollectionViewFlowLayout *)flowlayout{
    
    UICollectionView *collectionView = [[UICollectionView alloc]initWithFrame:CGRectZero collectionViewLayout:flowlayout];
    collectionView.showsVerticalScrollIndicator = NO;
    collectionView.showsHorizontalScrollIndicator = NO;
    collectionView.backgroundColor = [UIColor clearColor];
//    collectionView.pagingEnabled = YES;
    collectionView.bounces = NO;
    [collectionView registerClass:cellClass forCellWithReuseIdentifier:NSStringFromClass(cellClass)];
    return collectionView;
}


@end

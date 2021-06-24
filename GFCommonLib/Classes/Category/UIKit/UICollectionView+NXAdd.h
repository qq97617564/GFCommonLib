//
//  UICollectionView+NXAdd.h
//  NCube
//
//  Created by kepuna on 2016/12/21.
//  Copyright © 2016年 junjie.liu. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UICollectionView (NXAdd)

+ (instancetype)nc_collectionViewWithCellClass:(Class)cellClass Flowlayout:(UICollectionViewFlowLayout *)flowlayout;

@end

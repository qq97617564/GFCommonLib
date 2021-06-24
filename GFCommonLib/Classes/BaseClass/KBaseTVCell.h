//
//  KBaseTVCell.h
//  JBJ
//
//  Created by 王刚锋 on 2019/3/26.
//  Copyright © 2019 GF. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface KBaseTVCell : UITableViewCell
//数据模型
@property (nonatomic,strong) NSObject *model;

+ (instancetype)cellWithTableView:(UITableView *)tableView;

//+ (CGFloat)cellHeight;
- (void)setupUI;
- (void)setlayout;
- (void)setDataWithModel:(NSObject *)model;

/** 获取控制器 */
- (UIViewController *)viewController;
//我们最后得到cell的高度的方法
-(CGFloat)rowHeightWithCellModel:(NSObject *)model;
@end

NS_ASSUME_NONNULL_END

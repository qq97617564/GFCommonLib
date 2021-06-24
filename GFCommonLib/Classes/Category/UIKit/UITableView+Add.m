//
//  UITableView+Add.m
//  HHW
//
//  Created by kepuna on 2017/4/1.
//  Copyright © 2017年 Davis. All rights reserved.
//

#import "UITableView+Add.h"

@implementation UITableView (Add)

+ (instancetype)tableViewGroup {
    
    UITableView *tableView = [[UITableView alloc] initWithFrame:CGRectZero style:UITableViewStyleGrouped];
    tableView.estimatedRowHeight = 80;
    tableView.rowHeight = UITableViewAutomaticDimension;
    tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    tableView.backgroundColor = [UIColor groupTableViewBackgroundColor];
//    tableView.delegate = self;
//    tableView.dataSource = self;
    return tableView;
}

+ (instancetype)tableViewDefault {
    UITableView *tableView = [[UITableView alloc] initWithFrame:CGRectZero style:UITableViewStylePlain];
    tableView.estimatedRowHeight = 80;
    tableView.rowHeight = UITableViewAutomaticDimension;
    tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    tableView.backgroundColor = [UIColor groupTableViewBackgroundColor];
//    tableView.delegate = self;
//    tableView.dataSource = self;
    return tableView;
}

@end

//
//  KBaseTVCell.m
//  JBJ
//
//  Created by 王刚锋 on 2019/3/26.
//  Copyright © 2019 GF. All rights reserved.
//

#import "KBaseTVCell.h"
@interface KBaseTVCell()

@property (nonatomic,weak) UILabel *content; //显示文本的label
//定义一个contentLabel文本高度的属性
@property (nonatomic,assign) CGFloat contentLabelH;

@end

@implementation KBaseTVCell

-(void)awakeFromNib{
    [super awakeFromNib];
    [self setupUI];
}
+ (instancetype)cellWithTableView:(UITableView *)tableView{
    
    KBaseTVCell *cell = [tableView dequeueReusableCellWithIdentifier:[[self class] description]];
    if (cell == nil) {
        cell = [[self alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:[[self class] description]];
    }
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    return cell;
}

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        [self setupUI];
        self.selectionStyle = UITableViewCellSelectionStyleNone;
    }
    return self;
}

- (void)setupUI{
    
    
};
- (void)setlayout {
    
    
};
- (void)setDataWithModel:(NSObject *)model {
    
    
};

#pragma mark - 寻找响应链上的controller 用来模态到新的界面
- (UIViewController *)viewController {
    for (UIView* next = [self superview]; next; next = next.superview) {
        UIResponder *nextResponder = [next nextResponder];
        if ([nextResponder isKindOfClass:[UIViewController class]]) {
            return (UIViewController *)nextResponder;
        }
    }
    return nil;
}
-(CGFloat)rowHeightWithCellModel:(NSObject *)model
{
    return 10.0f;
}

-(CGFloat)contentLabelH
{
    if(!_contentLabelH){
        CGFloat h=[self.content.text boundingRectWithSize:CGSizeMake(([UIScreen mainScreen].bounds.size.width)-2*10, MAXFLOAT) options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName:[UIFont systemFontOfSize:16]} context:nil].size.height;
        
        
        _contentLabelH=h+10;  //内容距离底部下划线10的距离
    }
    return _contentLabelH;
}
-(void)layoutSubviews{
    
    
}
@end

//
//  GFPageViewController.m
//  NLKJ_App
//
//  Created by 王刚锋 on 2018/8/6.
//  Copyright © 2018年 王刚锋. All rights reserved.
//

#import "GFPageViewController.h"
#import "GFPageContentView.h"
#import "GFPageMainCell.h"
//#import "OrderListTVC.h"

@interface GFPageViewController ()<UICollectionViewDataSource,UICollectionViewDelegate,GFPageContentViewDelegate>
@property (nonatomic, assign) CGFloat pageBarHeight;
@property (nonatomic, weak) GFPageContentView *contentViews;
@property (nonatomic, weak) UICollectionView *collectionMain;
@property (nonatomic, weak) UIView *line;
@property (nonatomic, assign) CGFloat lineWidth;
@property (nonatomic,assign) int lastPositionX;
@property (nonatomic,assign) BOOL scrollToRight;

@property (nonatomic ,strong) NSArray *itemsArray;
@property (nonatomic, strong) NSArray *controllersClass;
@property (nonatomic, strong) NSMutableArray *controllers;
@end

#define CollectionWidth (SCREEN_Width - 120)
#define SCREEN_Width ([[UIScreen mainScreen] bounds].size.width)
#define SCREEN_Height ([[UIScreen mainScreen] bounds].size.height)

static NSString *mainCell = @"mainCellmainCell";

@implementation GFPageViewController

- (NSMutableArray *)controllers{
    if (!_controllers) {
        NSMutableArray *controllers = [NSMutableArray array];
        for (int i = 0; i < _controllersClass.count; i ++) {
//            OrderListTVC *vc =(OrderListTVC *)_controllersClass[i];
////            UIViewController *vc = [[className alloc] init];
////            vc.title = _itemsArray[i];
//            [self addChildViewController:vc];
//            [controllers addObject:vc];
        }
        _controllers = controllers;
    }
    return _controllers;
}

- (instancetype)initWithTitles:(NSArray *)titlesArray controllersClass:(NSArray *)controllersClass
{
    if (self = [super init]) {
        
        self.itemsArray = titlesArray;
        self.controllersClass = controllersClass;
        self.pageBarHeight = 40;
        [self addCollectionPage];
        [self addCollectionMain];
    }
    return self;
}

-(void)setPageBarHeight:(CGFloat)pageBarHeight{
    _pageBarHeight = pageBarHeight;
}

-(void)viewDidLoad{
    [super viewDidLoad];
    
    self.title = @"订单";
    self.automaticallyAdjustsScrollViewInsets = NO;
    self.edgesForExtendedLayout = UIRectEdgeNone;
    
    _scrollToRight = YES;
    _lastPositionX = 0;
}

- (void)addCollectionPage{
    
    GFPageContentView *contentViews = [[GFPageContentView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.pageBarHeight) itemsArray:self.itemsArray];
    contentViews.delegate = self;
    [self.view addSubview:contentViews];
    self.contentViews = contentViews;
    
    UIView *line = [[UIView alloc] init];
    line.backgroundColor = kBGColor;
    self.lineWidth = self.view.frame.size.width / self.itemsArray.count;
    line.frame = CGRectMake(0, self.pageBarHeight - 3, self.lineWidth, 3);
    [self.contentViews addSubview:line];
    [self.contentViews bringSubviewToFront:line];
    self.line = line;
}

- (void)addCollectionMain{
    UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc] init];
    layout.minimumLineSpacing = 0;
    layout.scrollDirection = UICollectionViewScrollDirectionHorizontal;
    CGRect frame = CGRectMake(0, CGRectGetMaxY(self.contentViews.frame), self.view.frame.size.width, self.view.frame.size.height - self.pageBarHeight - 64);
    
    UICollectionView *collectionMain = [[UICollectionView alloc] initWithFrame:frame collectionViewLayout:layout];
    collectionMain.dataSource = self;
    collectionMain.delegate = self;
    collectionMain.pagingEnabled = YES;
    collectionMain.scrollEnabled = YES;
    collectionMain.bounces = NO;
    collectionMain.showsHorizontalScrollIndicator = NO;
    [collectionMain registerClass:[GFPageMainCell class] forCellWithReuseIdentifier:mainCell];
    [self.view addSubview:collectionMain];
    [self.view bringSubviewToFront:collectionMain];
    self.collectionMain = collectionMain;
}

#pragma mark - UICollectionViewDelegateFlowLayout
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath{
    return collectionView.frame.size;
}

- (UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout insetForSectionAtIndex:(NSInteger)section{
    return UIEdgeInsetsMake(0, 0, 0, 0);
}

#pragma mark - UICollectionViewDataSource && UICollectionViewDelegate
- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView{
    return 1;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return self.itemsArray.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    GFPageMainCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:mainCell forIndexPath:indexPath];
    [cell setIndexController:self.controllers[indexPath.row]];
    return cell;
}

-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    [self.collectionMain scrollToItemAtIndexPath:[NSIndexPath indexPathForRow:indexPath.row inSection:0] atScrollPosition:UICollectionViewScrollPositionLeft animated:YES];
    
    [UIView animateWithDuration:0.25 animations:^{
        self.line.frame = CGRectMake((0 + indexPath.row) * self.lineWidth, self.pageBarHeight - 3, self.lineWidth, 3);
    }];
}

- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView {
    CGFloat x = scrollView.contentOffset.x ;
    int index = (x + SCREEN_Width * 0.5) / SCREEN_Width;
    [UIView animateWithDuration:0.25 animations:^{
        self.line.frame = CGRectMake(index *self.lineWidth, self.pageBarHeight - 3, self.lineWidth, 3);
    }];
    self.contentViews.index = index;
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView{
    int currentPostion = scrollView.contentOffset.x;
    if (currentPostion - _lastPositionX > 5) {
        _scrollToRight = YES;
    }else if(currentPostion - _lastPositionX < -5){
        _scrollToRight = NO;
    }
    _lastPositionX = currentPostion;
}

#pragma mark - GFPageContentViewDelegate
- (void)pageContentView:(GFPageContentView *)pageContentView didClickBtnIndex:(NSInteger)index
{
    [self.collectionMain scrollToItemAtIndexPath:[NSIndexPath indexPathForRow:index inSection:0] atScrollPosition:UICollectionViewScrollPositionLeft animated:YES];
    
    [UIView animateWithDuration:0.25 animations:^{
        self.line.frame = CGRectMake((0 + index) *self.lineWidth, self.pageBarHeight - 3, self.lineWidth, 3);
    }];
}
@end

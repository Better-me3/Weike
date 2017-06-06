//
//  WKHomeWeikeController.m
//  Weike
//
//  Created by zhang on 17/5/24.
//  Copyright © 2017年 zhang. All rights reserved.
//

#import "WKHomeWeikeController.h"
#import "WKMyWeikeCollecCell.h"
#import "WKMyPublishCollecCell.h"
//#import "WKBaseCollectionCellView.h"

#define kWidth self.view.bounds.size.width
#define kHeight self.view.bounds.size.height
#define kMargin 10
#define kMyWeikeIdentifier   @"myWeike"
#define kMyPublishIdentifier @"myPublish"

@interface WKHomeWeikeController ()<UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout>
@property (nonatomic, weak) UIButton *btnMyWeike;
@property (nonatomic, weak) UIButton *btnMyPublish;
@property (nonatomic, strong) UICollectionView *collectionView;
@property (nonatomic, assign) BOOL isClickWeike;
@end

@implementation WKHomeWeikeController

- (UICollectionView *)collectionView
{
    if (!_collectionView) {
        UICollectionViewFlowLayout *flowLayout = [[UICollectionViewFlowLayout alloc] init];
        flowLayout.itemSize = CGSizeMake(kWidth * 0.45, 150);
        flowLayout.minimumLineSpacing = 20;
        self.collectionView = [[UICollectionView alloc] initWithFrame:CGRectMake(kMargin, 0, kWidth - 2 * kMargin, kHeight) collectionViewLayout:flowLayout];
        _collectionView.backgroundColor = [UIColor clearColor];

        _collectionView.delegate = self;
        _collectionView.dataSource = self;
    }
    return _collectionView;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self setupTopButtons];
    self.btnMyWeike.selected = YES;
    self.isClickWeike = YES;
    
    [self.view addSubview:self.collectionView];
    
    
    [_collectionView registerClass:[WKMyWeikeCollecCell class] forCellWithReuseIdentifier:kMyWeikeIdentifier];
    
    [_collectionView registerClass:[WKMyPublishCollecCell class] forCellWithReuseIdentifier:kMyPublishIdentifier];
    
    
}

- (void)setupTopButtons
{
    UIButton *btnWeike = [self buttonWithTitle:@"我的微课" andAction:@"weikeClick:"];
    btnWeike.frame = CGRectMake(kWidth * 0.2 , 0, kWidth * 0.25, 35);
    
    UIButton *btnPublish = [self buttonWithTitle:@"我的发布" andAction:@"publishClick:"];
    btnPublish.frame = CGRectMake(kWidth * 0.55 , 0, kWidth * 0.25, 35);
    
    [self.navigationController.navigationBar addSubview:btnWeike];
    [self.navigationController.navigationBar addSubview:btnPublish];
    self.btnMyWeike = btnWeike;
    self.btnMyPublish = btnPublish;
}

- (UIButton *)buttonWithTitle:(NSString *)title andAction:(NSString *)action
{
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    button.frame = CGRectMake(kWidth * 0.2 , 0, kWidth * 0.25, 35);
    [button setTitle:title forState:UIControlStateNormal];
    [button setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [button setTitleColor:[UIColor blueColor] forState:UIControlStateSelected];
    [button addTarget:self action:NSSelectorFromString(action) forControlEvents:UIControlEventTouchUpInside];
    return button;
}

- (void)weikeClick:(UIButton *)sender
{
    self.isClickWeike = YES;
    self.btnMyPublish.selected = NO;
    sender.selected = YES;
    [self.collectionView reloadData];
}

- (void)publishClick:(UIButton *)sender
{
    self.isClickWeike = NO;
    self.btnMyWeike.selected = NO;
    sender.selected = YES;
    [self.collectionView reloadData];
}


#pragma mark -- UICollectionViewDataSource

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
#warning test
    return 20;
}

// The cell that is returned must be retrieved from a call to -dequeueReusableCellWithReuseIdentifier:forIndexPath:
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    if (self.isClickWeike)
    {
        WKMyWeikeCollecCell *weikeCell = [_collectionView dequeueReusableCellWithReuseIdentifier:kMyWeikeIdentifier forIndexPath:indexPath];
        return weikeCell;
    } else
    {
        WKMyPublishCollecCell *publishCell = [_collectionView dequeueReusableCellWithReuseIdentifier:kMyPublishIdentifier forIndexPath:indexPath];
        publishCell.baseView.videoNameL.text =[NSString stringWithFormat:@"IndexPath %ld", indexPath.row];
//        NSLog(@"cellForItemAtIndexPath ----- %ld", indexPath.row);
        return publishCell;
    }
    
}

#pragma mark -- UICollectionViewDelegate
- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    NSLog(@"%s", __func__);
}

#pragma mark -- UICollectionViewDelegateFlowLayout

@end

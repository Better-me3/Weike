//
//  WKTeacherCourseController.m
//  Weike
//
//  Created by zhang on 17/6/6.
//  Copyright © 2017年 zhang. All rights reserved.
//

#import "WKTeacherCourseController.h"
#import "WKTeacherIntroView.h"
#import "WKTeacherCourseCell.h"
#import "WKBaseCollectionCell.h"

#define kMargin 5
#define kIdentifier @"TeacherVideo"

@interface WKTeacherCourseController ()<UICollectionViewDelegate, UICollectionViewDataSource>
#warning provisional临时的
@property (nonatomic, weak) UIView *videoView;
@property (nonatomic, weak) UIButton *introBtn;
@property (nonatomic, weak) UIButton *videoBtn;
@property (nonatomic, strong) WKTeacherIntroView *infoView;
@property (nonatomic, strong) UICollectionView *collectionView;
@end

@implementation WKTeacherCourseController

- (WKTeacherIntroView *)infoView
{
    if (!_infoView) {
        self.infoView = [WKTeacherIntroView viewFromXib];
        self.infoView.backgroundColor = [UIColor clearColor];
    }
    return _infoView;
}

- (UICollectionView *)collectionView
{
    if (!_collectionView) {
        UICollectionViewFlowLayout *flowLayout = [[UICollectionViewFlowLayout alloc] init];
        flowLayout.itemSize = CGSizeMake(kScreenWidth * 0.45, 150);
        flowLayout.minimumLineSpacing = 20;
        self.collectionView = [[UICollectionView alloc] initWithFrame:CGRectMake(kMargin, 0, kScreenWidth - 2 * kMargin, kScreenHeight - CGRectGetMaxY(self.videoBtn.frame)) collectionViewLayout:flowLayout];
        _collectionView.backgroundColor = [UIColor clearColor];
        
        _collectionView.delegate = self;
        _collectionView.dataSource = self;
    }
    return _collectionView;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.view.backgroundColor = [UIColor colorWithRed:228/255.0 green:228/255.0 blue:228/255.0 alpha:1.0];
    
    [self setupSubviews];
    [self.collectionView registerClass:([WKBaseCollectionCell class])forCellWithReuseIdentifier:kIdentifier];
}

- (void)setupSubviews
{
    
    UIView *videoView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, kScreenWidth, kScreenHeight * 0.3)];
    videoView.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:videoView];
    self.videoView = videoView;
    
    UIButton *backButton = [UIButton buttonWithType:UIButtonTypeCustom];
    UIImage *image = [UIImage imageNamed:@"u2842"];
    [backButton setImage:image forState:UIControlStateNormal];
    backButton.frame = CGRectMake(10, 25, image.size.width, image.size.height);
    [self.view addSubview:backButton];
    [backButton addTarget:self action:@selector(backToPreviousPage) forControlEvents:UIControlEventTouchUpInside];
    
//    UIView *toolBar = [[UIView alloc] initWithFrame:CGRectMake(0, CGRectGetMaxY(self.videoView.frame) + 3, kScreenWidth, 35)];
//    toolBar.backgroundColor = [UIColor whiteColor];
//    [self.view addSubview:toolBar];
    
    UIButton *introBtn = [self butttonWithTitle:@"简介"];
    introBtn.frame = CGRectMake(0, CGRectGetMaxY(self.videoView.frame) + 3, kScreenWidth/2 - 0.5, 35);
    [self.view addSubview:introBtn];
    self.introBtn = introBtn;
    self.introBtn.tag = 101;
    
    UIImageView *spaceV = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"u2080"]];
    spaceV.frame = CGRectMake(CGRectGetMaxX(introBtn.frame), CGRectGetMinY(introBtn.frame), 1, 35);
    [self.view addSubview:spaceV];
    
    UIButton *videoBtn = [self butttonWithTitle:@"视频"];
    videoBtn.frame = CGRectMake(CGRectGetMaxX(spaceV.frame), CGRectGetMinY(self.introBtn.frame), kScreenWidth/2 - 0.5, 35);
    [self.view addSubview:videoBtn];
    self.videoBtn = videoBtn;
    self.videoBtn.tag = 102;
    
    //默认显示简介页面
    self.infoView.frame = CGRectMake(0, CGRectGetMaxY(self.videoBtn.frame), kScreenWidth, kScreenHeight - self.videoBtn.y);
    [self.view addSubview:self.infoView];
}

- (UIButton *)butttonWithTitle:(NSString *)title
{
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    button.backgroundColor = [UIColor whiteColor];
    [button setTitle:title forState:UIControlStateNormal];
    [button setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [button setTitleColor:[UIColor blueColor] forState:UIControlStateSelected];
    [button addTarget:self action:@selector(buttonClick:) forControlEvents:UIControlEventTouchUpInside];
    return button;
}

- (void)backToPreviousPage
{
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (void)buttonClick:(UIButton *)sender
{
    CGRect frame = CGRectMake(kMargin, CGRectGetMaxY(sender.frame), kScreenWidth - 2 * kMargin, kScreenHeight - CGRectGetMaxY(sender.frame));
    if (sender.tag == 101)
    {//click 简介
        [self.collectionView removeFromSuperview];
        self.infoView.frame = frame;
        [self.view addSubview:self.infoView];
        
    } else
    {//click 视频
        [self.infoView removeFromSuperview];
        self.collectionView.frame = frame;
        [self.view addSubview:self.collectionView];
    }
    
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
    WKBaseCollectionCell *weikeCell = [_collectionView dequeueReusableCellWithReuseIdentifier:kIdentifier forIndexPath:indexPath];
    return weikeCell;
    
}

#pragma mark -- UICollectionViewDelegate
- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    //播放视频
    
}

#pragma mark -- UICollectionViewDelegateFlowLayout
@end

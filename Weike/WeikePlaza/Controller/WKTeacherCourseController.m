//
//  WKTeacherCourseController.m
//  Weike
//
//  Created by zhang on 17/6/6.
//  Copyright © 2017年 zhang. All rights reserved.
//

#import "WKTeacherCourseController.h"
#import "WKTeacherIntro.h"
#import "WKTeacherCourseCell.h"


#define kScreenWidth  [UIScreen mainScreen].bounds.size.width
#define kScreenHeight [UIScreen mainScreen].bounds.size.height

@interface WKTeacherCourseController ()
#warning provisional临时的
@property (nonatomic, weak) UIView *videoView;
@property (nonatomic, weak) UIButton *introBtn;
@property (nonatomic, weak) UIButton *videoBtn;
@property (nonatomic, weak) WKTeacherIntro *infoView;
@property (nonatomic, weak) UICollectionView *collectionView;
@end

@implementation WKTeacherCourseController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.view.backgroundColor = [UIColor colorWithRed:228/255.0 green:228/255.0 blue:228/255.0 alpha:1.0];
    
    [self setupSubviews];
    
}

- (void)setupSubviews
{
    UIView *videoView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, kScreenWidth, kScreenHeight * 0.3)];
    videoView.backgroundColor = [UIColor grayColor];
    [self.view addSubview:videoView];
    self.videoView = videoView;
    
//    UIView *toolBar = [[UIView alloc] initWithFrame:CGRectMake(0, CGRectGetMaxY(self.videoView.frame) + 3, kScreenWidth, 35)];
//    toolBar.backgroundColor = [UIColor whiteColor];
//    [self.view addSubview:toolBar];
    
    UIButton *introBtn = [self butttonWithTitle:@"简介"];
    introBtn.frame = CGRectMake(0, CGRectGetMaxY(self.videoView.frame) + 3, kScreenWidth/2, 35);
    [self.view addSubview:introBtn];
    self.introBtn = introBtn;
    UIButton *videoBtn = [self butttonWithTitle:@"视频"];
    videoBtn.frame = CGRectMake(CGRectGetMaxX(self.introBtn.frame), CGRectGetMinY(self.introBtn.frame), kScreenWidth/2, 35);
    [self.view addSubview:videoBtn];
    self.videoBtn = videoBtn;
    
    
}

- (UIButton *)butttonWithTitle:(NSString *)title
{
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    button.backgroundColor = [UIColor whiteColor];
    [button setBackgroundImage:[UIImage imageNamed:@"u3054"] forState:UIControlStateNormal];
    [button setTitle:title forState:UIControlStateNormal];
    [button setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [button setTitleColor:[UIColor blueColor] forState:UIControlStateSelected];
    [button addTarget:self action:@selector(buttonClick:) forControlEvents:UIControlEventTouchUpInside];
    return button;
}

- (void)buttonClick:(UIButton *)sender
{

}
@end

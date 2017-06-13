//
//  WKSearchController.m
//  Weike
//
//  Created by zhang on 17/6/12.
//  Copyright © 2017年 zhang. All rights reserved.
//

#import "WKSearchController.h"
#import "WKSearchBar.h"

#define kMargin 15

@interface WKSearchController ()
@property (nonatomic, weak) WKSearchBar *searchBar;
@property (nonatomic, weak) UIButton *cancelBtn;
@property (nonatomic, weak) UILabel *recentSearchL;

@property (nonatomic, weak) UILabel *topSearchL;

@end

@implementation WKSearchController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    [self setupSubviews];
}

- (void)setupSubviews
{
    WKSearchBar *searchBar = [WKSearchBar searchBarWithPlaceholder:@"搜索微课"];
    searchBar.frame = CGRectMake(kMargin, 30, kScreenWidth * 0.8, 30);
    [self.view addSubview:searchBar];
    self.searchBar = searchBar;
    
    UIButton *cancelBtn = [UIButton buttonWithType:UIButtonTypeCustom];
//    cancelBtn.backgroundColor = [UIColor greenColor];
    [cancelBtn setTitle:@"取消" forState:UIControlStateNormal];
    cancelBtn.titleLabel.font = [UIFont systemFontOfSize:15];
    [cancelBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    cancelBtn.frame = CGRectMake(CGRectGetMaxX(_searchBar.frame) + 5, CGRectGetMinY(_searchBar.frame), kScreenWidth - CGRectGetMaxX(_searchBar.frame) -  kMargin, 30);
    [cancelBtn addTarget:self action:@selector(cancelSearch:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:cancelBtn];
    self.cancelBtn = cancelBtn;

}

#pragma mark -- Action
- (void)cancelSearch:(UIButton *)sender
{//取消 -- 进入在线资源界面
    

}

@end

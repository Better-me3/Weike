//
//  WKSearchController.m
//  Weike
//
//  Created by zhang on 17/6/12.
//  Copyright © 2017年 zhang. All rights reserved.
//

#import "WKSearchController.h"
#import "WKSearchBar.h"
#import "WKSearchRecordView.h"
#import "WKSearchResultController.h"

#define kMargin 15
#define kSearchRecordMargin 20

@interface WKSearchController ()<UITextFieldDelegate>
@property (nonatomic, weak) WKSearchBar *searchBar;
@property (nonatomic, weak) UIButton *cancelBtn;
@property (nonatomic, weak) UILabel *recentSearchL;
@property (nonatomic, weak) UIView *recentSearchView;
@property (nonatomic, weak) UILabel *noSearchL;
@property (nonatomic, weak) UILabel *topSearchL;
@property (nonatomic, weak) UIView *topSearchView;

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
    searchBar.frame = CGRectMake(kMargin, 25, kScreenWidth * 0.8, 30);
    [self.view addSubview:searchBar];
    self.searchBar = searchBar;
    _searchBar.delegate = self;
    
    UIButton *cancelBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [cancelBtn setTitle:@"取消" forState:UIControlStateNormal];
    cancelBtn.titleLabel.font = WKSystemFontSize(15);
    [cancelBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    cancelBtn.frame = CGRectMake(CGRectGetMaxX(_searchBar.frame) + 5, CGRectGetMinY(_searchBar.frame), kScreenWidth - CGRectGetMaxX(_searchBar.frame) -  kMargin, 30);
    [cancelBtn addTarget:self action:@selector(cancelSearch:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:cancelBtn];
    self.cancelBtn = cancelBtn;

    //最近搜索
    UILabel *recentSearchL = [[UILabel alloc] initWithFrame:CGRectMake(kMargin, CGRectGetMaxY(_searchBar.frame) + 12, 100, 15)];
    recentSearchL.font = WKSystemFontSize(14);
    recentSearchL.text = @"最近搜索";
    [self.view addSubview:recentSearchL];
    
    NSArray *recentArray = nil;
//    recentArray = @[@"可调节电脑支架", @"折叠式电脑支架", @"白色露肩T恤", @"铝合金电脑支架", @"金赏猫罐头", @"主子的小鱼干", @"加湿器"];
    if (recentArray.count) {
        WKSearchRecordView *recentSearchView = [[WKSearchRecordView alloc] initWithFrame:CGRectMake(kSearchRecordMargin, CGRectGetMaxY(recentSearchL.frame) + 10, kScreenWidth - kSearchRecordMargin * 2, 100) dataArray:recentArray];
        [self.view addSubview:recentSearchView];
        self.recentSearchView = recentSearchView;
    }
    else
    {
        UILabel *noSearchL = [[UILabel alloc] initWithFrame:CGRectMake(kMargin + 5, CGRectGetMaxY(recentSearchL.frame) + 10, 100, 15)];
        noSearchL.font = WKSystemFontSize(14);
        noSearchL.text = @"暂无历史搜索";
        [self.view addSubview:noSearchL];
        self.noSearchL = noSearchL;
    }
    
    
#warning 还有横线
    //热门搜索
    CGFloat hotSearchY = recentArray.count ? CGRectGetMaxY(_recentSearchView.frame) : CGRectGetMaxY(_noSearchL.frame) + 20;
    UILabel *hotSearchL = [[UILabel alloc] initWithFrame:CGRectMake(kMargin, hotSearchY + 12, 100, 15)];
    hotSearchL.font = WKSystemFontSize(14);
    hotSearchL.text = @"热门搜索";
    [self.view addSubview:hotSearchL];
    
    NSArray *hotArray = @[@"数学", @"英语作文", @"语文阅读理解", @"曾经沧海难为水, 除却巫山不是云", @"物理实验"];
    WKSearchRecordView *topSearchView = [[WKSearchRecordView alloc] initWithFrame:CGRectMake(kSearchRecordMargin, CGRectGetMaxY(hotSearchL.frame) + 10, kScreenWidth - kSearchRecordMargin * 2, 100) dataArray:hotArray];
    [self.view addSubview:topSearchView];
    self.topSearchView = topSearchView;

}

#pragma mark -- Action
- (void)cancelSearch:(UIButton *)sender
{//取消 -- 进入在线资源界面
    

}

- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    WKSearchResultController *resultVC = [[WKSearchResultController alloc] init];
    resultVC.searchWord = textField.text;
    [self presentViewController:resultVC animated:YES completion:nil];
    return YES;
}
@end

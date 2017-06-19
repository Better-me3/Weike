//
//  WKSearchResultController.m
//  Weike
//
//  Created by zhang on 17/6/18.
//  Copyright © 2017年 zhang. All rights reserved.
//

#import "WKSearchResultController.h"
#import "WKResourceCell.h"
#import "WKSearchBar.h"


#define kMargin 15
#define kIdentifier @"source"

@interface WKSearchResultController ()<UITextFieldDelegate, UITableViewDelegate, UITableViewDataSource>
@property (nonatomic, weak) WKSearchBar *searchBar;
@property (nonatomic, weak) UIButton *cancelBtn;
@property (nonatomic, weak) UITableView *tableView;

@end

@implementation WKSearchResultController


- (UITableView *)tableView
{
    if (!_tableView) {
        UITableView *tableView = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStylePlain];
        tableView.delegate = self;
        tableView.dataSource = self;
        [self.view addSubview:tableView];
        self.tableView = tableView;
    }
    return _tableView;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self setupSubviews];
}

- (void)setupSubviews
{
    self.view.backgroundColor = [UIColor whiteColor];
    
    UIView *naviBackgroundV = [[UIView alloc] initWithFrame:CGRectMake(0, 0, kScreenWidth, 64)];
    naviBackgroundV.backgroundColor = WKGrayColor(242, 210);
    [self.view addSubview:naviBackgroundV];
    
    WKSearchBar *searchBar = [WKSearchBar searchBarWithPlaceholder:@""];
    searchBar.text = self.searchWord;
    searchBar.frame = CGRectMake(kMargin, 25, kScreenWidth * 0.8, 30);
    [naviBackgroundV addSubview:searchBar];
    self.searchBar = searchBar;
    _searchBar.delegate = self;
    
    UIButton *cancelBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [cancelBtn setTitle:@"取消" forState:UIControlStateNormal];
    cancelBtn.titleLabel.font = WKSystemFontSize(15);
    [cancelBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    cancelBtn.frame = CGRectMake(CGRectGetMaxX(_searchBar.frame) + 5, CGRectGetMinY(_searchBar.frame), kScreenWidth - CGRectGetMaxX(_searchBar.frame) -  kMargin, 30);
    [cancelBtn addTarget:self action:@selector(cancelSearch:) forControlEvents:UIControlEventTouchUpInside];
    [naviBackgroundV addSubview:cancelBtn];
    self.cancelBtn = cancelBtn;
    
    self.tableView.frame = CGRectMake(0, CGRectGetMaxY(naviBackgroundV.frame), kScreenWidth, kScreenHeight - CGRectGetHeight(naviBackgroundV.frame));
    [self.tableView registerNib:[UINib nibWithNibName:@"WKResourceCell" bundle:nil] forCellReuseIdentifier:kIdentifier];
}

- (void)cancelSearch:(UIButton *)sender
{
    [self dismissViewControllerAnimated:YES completion:nil];
}


#pragma mark -- UITableViewDataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 20;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    WKResourceCell *cell = [tableView dequeueReusableCellWithIdentifier:kIdentifier];
    
    return cell;
}

#pragma mark -- UITableViewDelegate
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 80;
}

#pragma mark -- UITextFieldDelegate
- (void)textFieldDidEndEditing:(UITextField *)textField
{
#warning TODO
    [self.tableView reloadData];
}
@end

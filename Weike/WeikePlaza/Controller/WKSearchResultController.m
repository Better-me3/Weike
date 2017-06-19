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
#import "WKSearchBarAndCancelBtn.h"

#define kMargin 15
#define kIdentifier @"source"

@interface WKSearchResultController ()<UITextFieldDelegate, UITableViewDelegate, UITableViewDataSource>
@property (nonatomic, weak) WKSearchBarAndCancelBtn *searchWrapper;
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
    
    UIView *naviBackgroundV = [[UIView alloc] initWithFrame:CGRectMake(0, 0, kScreenWidth, 70)];
    naviBackgroundV.backgroundColor = WKGrayColor(242, 210);
    [self.view addSubview:naviBackgroundV];
    
    WKSearchBarAndCancelBtn *searchWrapper = [[WKSearchBarAndCancelBtn alloc] initWithFrame:CGRectMake(kMargin, 25, kScreenWidth - 2* kMargin, 30)];
    searchWrapper.searchText = self.searchWord;
    searchWrapper.fieldColor = [UIColor whiteColor];
    searchWrapper.searchBar.delegate = self;
    searchWrapper.cancelClick = ^{
        //取消 -- 进入在线资源界面, TODO
        [self dismissViewControllerAnimated:YES completion:nil];

    };
    [naviBackgroundV addSubview:searchWrapper];
    self.searchWrapper = searchWrapper;

    
    self.tableView.frame = CGRectMake(0, CGRectGetMaxY(naviBackgroundV.frame), kScreenWidth, kScreenHeight - CGRectGetHeight(naviBackgroundV.frame));
    [self.tableView registerNib:[UINib nibWithNibName:@"WKResourceCell" bundle:nil] forCellReuseIdentifier:kIdentifier];
}



#pragma mark -- UITableViewDataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 20;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    WKResourceCell *cell = [tableView dequeueReusableCellWithIdentifier:kIdentifier];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    cell.hideSize = YES;
    return cell;
}

#pragma mark -- UITableViewDelegate
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 80;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    
}

#pragma mark -- UITextFieldDelegate
- (void)textFieldDidEndEditing:(UITextField *)textField
{
#warning TODO
    [self.tableView reloadData];
}

@end

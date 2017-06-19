//
//  WKOnlineResourceViewController.m
//  Weike
//
//  Created by zhang on 17/6/18.
//  Copyright © 2017年 zhang. All rights reserved.
//

#import "WKOnlineResourceViewController.h"
#import "WKSearchBar.h"
#import "WKResourceCell.h"
#import "WKResourceFileController.h"

#define kMargin 15
#define kIdentifier @"source"

@interface WKOnlineResourceViewController ()<UITextFieldDelegate, UITableViewDelegate, UITableViewDataSource>
@property (nonatomic, weak) WKSearchBar *searchBar;
@property (nonatomic, weak) UITableView *tableView;

@end

@implementation WKOnlineResourceViewController

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
    self.title = @"在线资源";
    
    WKSearchBar *searchBar = [WKSearchBar searchBarWithPlaceholder:@""];
    searchBar.frame = CGRectMake(kScreenWidth * 0.05, 70, kScreenWidth * 0.9, 30);
    searchBar.fieldColor = [UIColor whiteColor];
    [self.view addSubview:searchBar];
    self.searchBar = searchBar;
    _searchBar.delegate = self;
    
    self.tableView.frame = CGRectMake(0, CGRectGetMaxY(_searchBar.frame) + 5, kScreenWidth, kScreenHeight - CGRectGetHeight(_searchBar.frame));
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
    cell.hideSize = YES;
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    return cell;
}

#pragma mark -- UITableViewDelegate
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 80;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    WKResourceFileController *fileVC = [[WKResourceFileController alloc] init];
    [self.navigationController pushViewController:fileVC animated:YES];
}

#pragma mark -- UITextFieldDelegate
- (void)textFieldDidEndEditing:(UITextField *)textField
{
#warning TODO
    [self.tableView reloadData];
}

@end
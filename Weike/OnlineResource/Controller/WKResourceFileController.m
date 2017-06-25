//
//  WKResourceFileController.m
//  Weike
//
//  Created by zhang on 17/6/19.
//  Copyright © 2017年 zhang. All rights reserved.
//

#import "WKResourceFileController.h"
#import "WKSearchBar.h"
#import "WKResourceCell.h"

#define kMargin 15
#define kIdentifier @"source"

@interface WKResourceFileController ()<UITextFieldDelegate, UITableViewDelegate, UITableViewDataSource>
@property (nonatomic, weak) WKSearchBar *searchBar;
@property (nonatomic, weak) UITableView *tableView;

@end

@implementation WKResourceFileController

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
    self.view.backgroundColor = [UIColor whiteColor];
    //change left item
    UIBarButtonItem *backItem = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"u2842"] style:UIBarButtonItemStylePlain target:self action:@selector(back:)];
    backItem.tintColor = [UIColor darkGrayColor];
    self.navigationItem.leftBarButtonItem = backItem;

    WKSearchBar *searchBar = [WKSearchBar searchBarWithPlaceholder:@"搜索"];
    searchBar.frame = CGRectMake(kScreenWidth * 0.05, 70, kScreenWidth * 0.9, 30);
    searchBar.fieldColor = [UIColor whiteColor];
    [self.view addSubview:searchBar];
    self.searchBar = searchBar;
    _searchBar.delegate = self;
    
    UIImageView *line = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"u2144"]];
    line.frame = CGRectMake(0, CGRectGetMaxY(_searchBar.frame) + 10, kScreenWidth, 1.5);
    [self.view addSubview:line];
    
    self.tableView.frame = CGRectMake(0, CGRectGetMaxY(line.frame) + 5, kScreenWidth, kScreenHeight - CGRectGetHeight(line.frame));
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
//    cell.hideSize = YES;
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
//after resign first responder, hide keyboard
//- (void)textFieldDidEndEditing:(UITextField *)textField
//{
//#warning TODO
//    [self.tableView reloadData];
//}

- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [textField resignFirstResponder];
#warning TODO
//    [self.tableView reloadData];
    
    return YES;
}

- (void)back:(UIBarButtonItem *)item
{
    [self.navigationController popViewControllerAnimated:YES];
}


@end

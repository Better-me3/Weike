//
//  WKMineViewController.m
//  Weike
//
//  Created by zhang on 17/6/27.
//  Copyright © 2017年 zhang. All rights reserved.
//

#import "WKMineViewController.h"

#define kIdentifier @"mine"

@interface WKMineViewController ()<UITableViewDelegate, UITableViewDataSource>
@property (nonatomic, strong) UIImageView *avatar;
@property (nonatomic, strong) UIButton *loginButton;
@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, strong) NSArray *cellTitles;

@end

@implementation WKMineViewController

#pragma mark -- lazy loading
- (UIImageView *)avatar
{
    if (!_avatar) {
        UIImage * image = [UIImage imageNamed:@"u4337"];
        self.avatar = [[UIImageView alloc] initWithImage:image];
        _avatar.frame = CGRectMake((kScreenWidth - image.size.width) * 0.5, 90, image.size.width, image.size.height);
    }
    return _avatar;
}

- (UIButton *)loginButton
{
    if (!_loginButton) {
        self.loginButton = [UIButton buttonWithType:UIButtonTypeCustom];
        [_loginButton setTitle:@"登录" forState:UIControlStateNormal];
        [_loginButton setTitleColor:[UIColor darkGrayColor] forState:UIControlStateNormal];
        _loginButton.frame = CGRectMake(kScreenWidth * 0.5 - 25, CGRectGetMaxY(self.avatar.frame) + 10, 50, 30);
    }
    return _loginButton;
}

- (UITableView *)tableView
{
    if (!_tableView) {
        CGFloat tbvY = CGRectGetMaxY(self.loginButton.frame) + 30;
        CGRect rect = CGRectMake(0, tbvY, kScreenWidth, kScreenHeight - tbvY);
        self.tableView = [[UITableView alloc] initWithFrame:rect style:UITableViewStylePlain];
        self.tableView.dataSource = self;
        self.tableView.delegate = self;
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
    self.title = @"我的";
    self.view.backgroundColor = WKGrayColor(221, 255);
    self.cellTitles = @[@"个人资料", @"我的收藏", @"设置"];
    
    [self.view addSubview:self.avatar];
    [self.view addSubview:self.loginButton];
    [self.view addSubview:self.tableView];
    
}

#pragma mark -- UITableViewDataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 3;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:kIdentifier];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:kIdentifier];
        cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    }
    cell.textLabel.text = self.cellTitles[indexPath.row];
    cell.imageView.image = [UIImage imageNamed:@"u4484"];
    
    return cell;
}

#pragma mark -- UITableViewDelegate
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 60;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{

}

@end

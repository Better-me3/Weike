//
//  WKWeikePlazaController.m
//  Weike
//
//  Created by zhang on 17/6/3.
//  Copyright © 2017年 zhang. All rights reserved.
//

#import "WKWeikePlazaController.h"
#import "WKPlazaCell.h"
#import "WKTeacherCourseController.h"

#define kIdentifier @"plaza"

@interface WKWeikePlazaController ()<UITableViewDelegate, UITableViewDataSource>
@property (strong, nonatomic) UITableView *tableView;

@end

@implementation WKWeikePlazaController

- (UITableView *)tableView
{
    if (!_tableView) {
        self.tableView = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStylePlain];
        self.tableView.delegate = self;
        self.tableView.dataSource = self;
    }
    return _tableView;
}


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    [self setupNavigationBar];
    
    [self.view addSubview:self.tableView];
    [_tableView registerNib:[UINib nibWithNibName:@"WKPlazaCell" bundle:nil] forCellReuseIdentifier:kIdentifier];
}

- (void)setupNavigationBar
{
    self.navigationItem.title = @"微课广场";
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemSearch target:self action:@selector(selectWeike:)];
    [self.navigationController.navigationBar setTintColor:[UIColor lightGrayColor]];
}

- (void)selectWeike:(UIButton *)sender
{


}

#pragma mark -- UITableViewDataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 20;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    WKPlazaCell *cell = [tableView dequeueReusableCellWithIdentifier:kIdentifier];
    
    return cell;
}


#pragma mark -- UITableViewDelegate
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 170;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    WKTeacherCourseController *courseController = [[WKTeacherCourseController alloc] init];
    [self presentViewController:courseController animated:YES completion:nil];
}
@end

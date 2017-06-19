//
//  WKOnlineResourceViewController.m
//  Weike
//
//  Created by zhang on 17/6/18.
//  Copyright © 2017年 zhang. All rights reserved.
//

#import "WKOnlineResourceViewController.h"
#import "WKSearchBar.h"

#define kMargin 15

@interface WKOnlineResourceViewController ()<UITextFieldDelegate>
@property (nonatomic, weak) WKSearchBar *searchBar;

@end

@implementation WKOnlineResourceViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)setupSubviews
{
    self.title = @"在线资源";
    
    WKSearchBar *searchBar = [WKSearchBar searchBarWithPlaceholder:@"搜索微课"];
    searchBar.frame = CGRectMake(kMargin, 25, kScreenWidth * 0.8, 30);
    [self.view addSubview:searchBar];
    self.searchBar = searchBar;
    _searchBar.delegate = self;
    
}



@end

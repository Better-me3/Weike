//
//  WKBaseViewController.m
//  Weike
//
//  Created by zhang on 17/5/18.
//  Copyright © 2017年 zhang. All rights reserved.
//

#import "WKBaseViewController.h"
#import "WKLoginController.h"

@interface WKBaseViewController ()

@end

@implementation WKBaseViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    WKLoginController *loginVc = [[WKLoginController alloc] init];
    [self presentViewController:loginVc animated:NO completion:nil];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}




@end

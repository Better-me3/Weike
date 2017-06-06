//
//  LoginController.m
//  Weike
//
//  Created by zhang on 17/5/18.
//  Copyright © 2017年 zhang. All rights reserved.
//

#import "WKLoginController.h"
#import "WKButtonTextField.h"
#import "WKOptimizeInfoController.h"
#import "WKHomeWeikeController.h"

@interface WKLoginController ()
@property (weak, nonatomic) IBOutlet UIImageView *appIcon;
@property (weak, nonatomic) IBOutlet WKButtonTextField *phoneNoField;
@property (weak, nonatomic) IBOutlet WKButtonTextField *authCodeField;
@property (weak, nonatomic) IBOutlet UIButton *LoginBtn;
@property (weak, nonatomic) IBOutlet UIButton *registerBtn;

@end

@implementation WKLoginController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Do any additional setup after loading the view from its nib.
    
    [self setupControls];
    
}

- (void)setupControls
{
    self.phoneNoField.isOnlyTextField = YES;
//    UITextField *phoneField = [[UITextField alloc] init];
    self.phoneNoField.placeholder = @"请输入手机号";
//    self.phoneNoField.textField = phoneField;
    
//    UITextField *codeField = [[UITextField alloc] init];
    self.authCodeField.placeholder = @"请输入验证码";
//    self.authCodeField.textField = codeField;
    
    [self.LoginBtn setTitle:@"登录" forState:UIControlStateNormal];
    [self.LoginBtn setTitle:@"注册" forState:UIControlStateSelected];
    self.LoginBtn.tintColor = [UIColor clearColor];
    
    [self.registerBtn setTitle:@"新用户注册" forState:UIControlStateNormal];
    [self.registerBtn setTitle:@"已有账号登录" forState:UIControlStateSelected];
    [self.registerBtn setTitleColor:[UIColor blackColor] forState:UIControlStateSelected];
    self.registerBtn.tintColor = [UIColor clearColor];

    self.authCodeField.buttonAction = ^{
        //发送验证码
        
    };
}

- (IBAction)loginBtnClick:(UIButton *)sender
{
    if (sender.selected)
    {//注册,完善信息
        WKOptimizeInfoController *infoVC = [[WKOptimizeInfoController alloc] init];
        [self presentViewController:infoVC animated:YES completion:nil];
        
    } else
    {//登录,进入首页
        WKHomeWeikeController *homeVC = [[WKHomeWeikeController alloc] init];
        
        
    }
    
}

- (IBAction)registerBtnClick:(UIButton *)sender
{
    sender.selected = !sender.selected;
    self.LoginBtn.selected = !self.LoginBtn.selected;
    if (sender.selected)
        self.phoneNoField.placeholder = @"请输入注册手机号";
     else
        self.phoneNoField.placeholder = @"请输入手机号";

    
}



/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end

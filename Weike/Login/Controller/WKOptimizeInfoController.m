//
//  WKOptimizeInfoController.m
//  Weike
//
//  Created by zhang on 17/5/23.
//  Copyright © 2017年 zhang. All rights reserved.
//

#import "WKOptimizeInfoController.h"
#import "WKSelectTextField.h"
#import "WKHomeWeikeController.h"

@interface WKOptimizeInfoController ()
@property (weak, nonatomic) IBOutlet UIImageView *imageView;
@property (weak, nonatomic) IBOutlet UITextField *nicknameField;
@property (weak, nonatomic) IBOutlet WKSelectTextField *gradeField;
@property (weak, nonatomic) IBOutlet WKSelectTextField *subjectField;

@end

@implementation WKOptimizeInfoController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    [self optimizeCountrols];
}

- (void)optimizeCountrols
{
    //imageView
    self.imageView.layer.cornerRadius = self.imageView.frame.size.width * 0.5;
    
    //nicknameField
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(10, 0, 40, 35)];
    label.text = @"昵称";
    label.font = [UIFont systemFontOfSize:14];
    UIView *view = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 45, 35)];
    [view addSubview:label];
    self.nicknameField.leftView = view;
    self.nicknameField.leftViewMode = UITextFieldViewModeAlways;
    
    //gradeField
    UILabel *gradeLabel = [[UILabel alloc] initWithFrame:CGRectMake(10, 0, 40, 35)];
    gradeLabel.text = @"年级";
    gradeLabel.font = [UIFont systemFontOfSize:14];
    self.gradeField.leftV = gradeLabel;
    
    self.gradeField.fieldClicked = ^{
        //select from list whose data from request
    
    };

    //subjectField
    UILabel *subjectLabel = [[UILabel alloc] initWithFrame:CGRectMake(10, 0, 40, 35)];
    subjectLabel.text = @"学科";
    subjectLabel.font = [UIFont systemFontOfSize:14];
    self.subjectField.leftV = subjectLabel;

    self.subjectField.fieldClicked = ^{
        //select from list whose data from request
        
    };
}



@end

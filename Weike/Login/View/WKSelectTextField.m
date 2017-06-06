//
//  WKSelectTextField.m
//  Weike
//
//  Created by zhang on 17/5/23.
//  Copyright © 2017年 zhang. All rights reserved.
//

#import "WKSelectTextField.h"

@implementation WKSelectTextField

- (void)awakeFromNib
{
    [super awakeFromNib];
    
    [self initComponent];
}

- (instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        
        [self initComponent];
        
    }
    return self;
}

- (void)setLeftV:(UIView *)leftV
{
    _leftV = leftV;
    CGFloat height = self.frame.size.height;
    
    UIView *leftView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 45, height)];
    [leftView addSubview:self.leftV];
    self.leftView = leftView;
}

- (void)initComponent
{
    self.enabled = NO;

    //leftView
    UILabel *Label = [[UILabel alloc] initWithFrame:CGRectMake(10, 0, 40, 35)];
    Label.font = [UIFont systemFontOfSize:14];
    UIView *leftView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 45, self.frame.size.height)];
    [leftView addSubview:Label];
    self.leftView = leftView;
    self.leftViewMode = UITextFieldViewModeAlways;

    //rightView
    UIImage *image = [UIImage imageNamed:@"u233"];
    UIImageView *arrow = [[UIImageView alloc] initWithImage:image];
    arrow.frame = CGRectMake(20, 5, image.size.width, image.size.height);
    UIView *rightView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 45, self.frame.size.height)];
    [rightView addSubview:arrow];
    self.rightView = rightView;
    self.rightViewMode = UITextFieldViewModeAlways;
    
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] init];
    [tap addTarget:self action:@selector(tapGestureAction:)];
    [self addGestureRecognizer:tap];
}

- (void)tapGestureAction:(UITapGestureRecognizer *)gesture
{
    self.fieldClicked ? self.fieldClicked() : nil;
}

@end

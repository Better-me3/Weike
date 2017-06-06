//
//  WKButtonTextField.m
//  Weike
//
//  Created by zhang on 17/5/21.
//  Copyright © 2017年 zhang. All rights reserved.
//

#import "WKButtonTextField.h"

@interface WKButtonTextField ()
@property (nonatomic, strong) UITextField *textField;
@property (nonatomic, weak) UIImageView *verticalLine;
@property (nonatomic, weak) UIImageView *horizontalLine;
@property (nonatomic, weak) UIButton *sendButton;
@end

@implementation WKButtonTextField

- (void)awakeFromNib
{
    [super awakeFromNib];
    
    [self initComponent];
    self.isOnlyTextField = NO;
}

- (instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        
        [self initComponent];
        self.isOnlyTextField = NO;
        
    }
    return self;
}

- (void)initComponent
{
    //left textfield
    UITextField *textField = [[UITextField alloc] init];
    [self addSubview:textField];
    self.textField = textField;
    
    //horizontal line
    UIImageView *imageH = [[UIImageView alloc] init];
    imageH.image = [UIImage imageNamed:@"u178"];
    [self addSubview:imageH];
    self.horizontalLine = imageH;
    
    if (_isOnlyTextField)   return;
    
    //vertical line
    UIImageView *imageV = [[UIImageView alloc] init];
    imageV.image = [UIImage imageNamed:@"u191"];
    [self addSubview:imageV];
    self.verticalLine = imageV;
    
    //button
    UIButton *button = [[UIButton alloc] init];
    [button setTitle:@"发送验证码" forState:UIControlStateNormal];
    [button setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
    button.font = [UIFont systemFontOfSize:15];
    [button addTarget:self action:@selector(buttonClick:) forControlEvents:UIControlEventTouchUpInside];
    [self addSubview:button];
    self.sendButton = button;
}

- (void)layoutSubviews
{
    [super layoutSubviews];
    
    CGFloat totalWidth = self.frame.size.width;
    CGFloat totalHeight = self.frame.size.height;
    if (_isOnlyTextField) {
         self.textField.frame = CGRectMake(0, 0, totalWidth, totalHeight - 3);
    } else
    {
        self.textField.frame = CGRectMake(0, 0, totalWidth * 0.65, totalHeight - 3);
        self.verticalLine.frame = CGRectMake(CGRectGetMaxX(self.textField.frame) + 3, 8, 1, self.verticalLine.image.size.height);
        self.sendButton.frame = CGRectMake(CGRectGetMaxX(self.verticalLine.frame) + 3, 0, totalWidth * 0.34, totalHeight - 3);
    }
    
    self.horizontalLine.frame = CGRectMake(0, totalHeight - 2, totalWidth, 1);
    
    for (UIView *view in self.subviews) {
        NSLog(@"subview --%@", view);
    }
}

- (void)buttonClick:(UIButton *)sender
{
    self.buttonAction ? self.buttonAction() : nil;
}

- (void)setPlaceholder:(NSString *)placeHolder
{
    self.textField.placeholder = placeHolder;

}
@end

//
//  WKMyPublishCollecCell.m
//  Weike
//
//  Created by zhang on 17/5/30.
//  Copyright © 2017年 zhang. All rights reserved.
//

#import "WKMyPublishCollecCell.h"

@interface WKMyPublishCollecCell ()
@property (nonatomic, weak) UIButton *editButton;
@end

@implementation WKMyPublishCollecCell
- (instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        [self setupSubviews];
    }
    return self;
}

- (void)setupSubviews
{
    WKBaseCollectionCellView *baseView = [WKBaseCollectionCellView baseCollectionCellView];
    [self addSubview:baseView];
    self.baseView = baseView;
    
    UIButton *editButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [editButton setImage:[UIImage imageNamed:@"u476"] forState:UIControlStateNormal];
    [editButton addTarget:self action:@selector(editButtonClick:) forControlEvents:UIControlEventTouchUpInside];
    [self addSubview:editButton];
    self.editButton = editButton;
    
}

- (void)layoutSubviews
{
    [super layoutSubviews];
    
    _baseView.frame = self.bounds;
    CGSize size = self.frame.size;
    _editButton.frame = CGRectMake(size.width * 0.8, size.height * 0.8, size.width * 0.2, size.height * 0.2);
}

- (void)editButtonClick:(UIButton *)sender
{

}
@end

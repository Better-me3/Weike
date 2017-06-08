//
//  WKMyWeikeCollecCell.m
//  Weike
//
//  Created by zhang on 17/5/30.
//  Copyright © 2017年 zhang. All rights reserved.
//

#import "WKMyWeikeCollecCell.h"

@interface WKMyWeikeCollecCell ()
@property (nonatomic, weak) WKBaseCollectionCellView *baseView;
@property (nonatomic, weak) UIView *publishIndicator;
@end

@implementation WKMyWeikeCollecCell

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
    baseView.videoIndicater.hidden = YES;
    [self addSubview:baseView];
    self.baseView = baseView;
    
    //add publish indicator
    UIButton *publishIndicator = [UIButton buttonWithType:UIButtonTypeCustom];
    [publishIndicator setBackgroundImage:[UIImage imageNamed:@"u401"] forState:UIControlStateNormal];
    [publishIndicator setTitle:@"已\n发\n布" forState:UIControlStateNormal];
    [publishIndicator setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    publishIndicator.font = [UIFont systemFontOfSize:12];
    publishIndicator.titleLabel.numberOfLines = 0;
    //    publishIndicator.titleEdgeInsets = UIEdgeInsetsMake(0, -15, 0, 0);
    [self addSubview:publishIndicator];
    self.publishIndicator = publishIndicator;
    
    //    UIImage *image = [UIImage imageNamed:@"u401"];
    //    CGRect rect = CGRectMake(0, 0, image.size.width, image.size.height);
    //    UIImageView *publishImage = [[UIImageView alloc] initWithImage:image];
    //    publishImage.frame = rect;
    //    UILabel *label = [[UILabel alloc] initWithFrame:rect];
    //    label.font = [UIFont systemFontOfSize:12];
    //    label.numberOfLines = 0;
    //    label.textAlignment = NSTextAlignmentCenter;
    //    label.text = @"已\n发\n布";
    //    label.textColor = [UIColor whiteColor];
    //    [publishImage addSubview:label];
    //    UIView *view = [[UIView alloc] initWithFrame:rect];
    //    [view addSubview:publishImage];
    //    [baseView addSubview:view];
    //    self.publishIndicator = view;
    //
    
    
}

- (void)layoutSubviews
{
    [super layoutSubviews];
    _baseView.frame = self.bounds;
    _publishIndicator.frame = CGRectMake(0, 0, CGRectGetWidth(_baseView.frame) * 0.11, CGRectGetHeight(_baseView.frame) * 0.3);
}

@end

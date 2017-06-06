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
    
    //add publish indicator
    UIImage *image = [UIImage imageNamed:@"u401"];
    CGRect rect = CGRectMake(0, 0, image.size.width, image.size.height);
    UIImageView *publishImage = [[UIImageView alloc] initWithImage:image];
    publishImage.frame = rect;
    UILabel *label = [[UILabel alloc] initWithFrame:rect];
    label.backgroundColor = [UIColor clearColor];
    label.text = @"已发布";
    label.textColor = [UIColor whiteColor];
    [publishImage addSubview:label];
    UIView *view = [[UIView alloc] initWithFrame:rect];
    [view addSubview:publishImage];
    [baseView addSubview:view];
    self.publishIndicator = view;
    
    [self addSubview:baseView];
    self.baseView = baseView;
    
}

- (void)layoutSubviews
{
    _baseView.frame = self.bounds;
    _publishIndicator.frame = CGRectMake(CGRectGetMaxX(_baseView.videoNameL.frame) + 5, 0, CGRectGetWidth(_baseView.frame) * 0.25, CGRectGetHeight(_baseView.videoNameL.frame));
}

@end

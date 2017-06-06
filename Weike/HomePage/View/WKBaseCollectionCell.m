//
//  WKBaseCollectionCell.m
//  Weike
//
//  Created by zhang on 17/5/30.
//  Copyright © 2017年 zhang. All rights reserved.
//

#import "WKBaseCollectionCell.h"

@implementation WKBaseCollectionCell
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
    
    baseView.frame = self.bounds;
    
    [self addSubview:baseView];
    self.baseView = baseView;
}


@end

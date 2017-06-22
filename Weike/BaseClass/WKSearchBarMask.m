//
//  WKSearchBarMask.m
//  Weike
//
//  Created by zhang on 17/6/22.
//  Copyright © 2017年 zhang. All rights reserved.
//

#import "WKSearchBarMask.h"

#define kMargin 15

@implementation WKSearchBarMask

- (instancetype)initWithFrame:(CGRect)frame
{
    if (self == [super initWithFrame:frame]) {
        self.backgroundColor = WKGrayColor(60, 220);
        [self addTarget:self action:@selector(CloseAnimation) forControlEvents:UIControlEventTouchUpInside];
        
        UIView *naviBackgroundV = [[UIView alloc] initWithFrame:CGRectMake(0, 0, kScreenWidth, 70)];
        naviBackgroundV.backgroundColor = WKGrayColor(242, 255);
        [self addSubview:naviBackgroundV];

        WKSearchBarAndCancelBtn *searchWrapper = [[WKSearchBarAndCancelBtn alloc] initWithFrame:CGRectMake(kMargin, 25, kScreenWidth - 2* kMargin, 30)];
        searchWrapper.cancelClick = ^{
            [self CloseAnimation];
            
        };
        [naviBackgroundV addSubview:searchWrapper];
        self.searchWrapper = searchWrapper;
        
    }
    return self;
}

- (void)setDelegate:(id<UITextFieldDelegate>)delegate
{
    _searchWrapper.searchBar.delegate = delegate;
}

- (void)CloseAnimation
{
    [UIView animateWithDuration:0.1 animations:^{
        [self removeFromSuperview];
        
    }];
}

@end

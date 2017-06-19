//
//  WKSearchBarAndCancelBtn.m
//  Weike
//
//  Created by zhang on 17/6/19.
//  Copyright © 2017年 zhang. All rights reserved.
//

#import "WKSearchBarAndCancelBtn.h"

@interface WKSearchBarAndCancelBtn ()
@property (nonatomic, weak) UIButton *cancelBtn;
@end

@implementation WKSearchBarAndCancelBtn

- (instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        WKSearchBar *searchBar = [WKSearchBar searchBarWithPlaceholder:@"搜索微课"];
        searchBar.frame = CGRectMake(0, 0, frame.size.width * 0.87, frame.size.height);
        [self addSubview:searchBar];
        self.searchBar = searchBar;
        
        UIButton *cancelBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        [cancelBtn setTitle:@"取消" forState:UIControlStateNormal];
        cancelBtn.titleLabel.font = WKSystemFontSize(15);
        [cancelBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        cancelBtn.frame = CGRectMake(CGRectGetMaxX(_searchBar.frame) + 5, CGRectGetMinY(_searchBar.frame), frame.size.width - CGRectGetMaxX(_searchBar.frame), frame.size.height);
        [cancelBtn addTarget:self action:@selector(cancelSearch:) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:cancelBtn];
        self.cancelBtn = cancelBtn;

    }
    return self;
}

- (void)setSearchText:(NSString *)searchText
{
    self.searchBar.text = searchText;
}

- (void)setFieldColor:(UIColor *)fieldColor
{
    _searchBar.backgroundColor = fieldColor;

}

- (void)cancelSearch:(UIButton *)sender
{
    !self.cancelClick ? : self.cancelClick();
}

@end

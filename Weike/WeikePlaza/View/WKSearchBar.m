//
//  WKSearchBar.m
//  Weike
//
//  Created by zhang on 17/6/13.
//  Copyright © 2017年 zhang. All rights reserved.
//

#import "WKSearchBar.h"

@implementation WKSearchBar

- (instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        
        [self initSettings];
    }
    return self;
}

- (void)awakeFromNib
{
    [self initSettings];
}

- (void)initSettings
{
    UIImage *image = [UIImage imageNamed:@"u3101"];
    UIImageView *imageV = [[UIImageView alloc] initWithImage:image];
    imageV.size = CGSizeMake(25, 25);
    imageV.contentMode = UIViewContentModeCenter;
    self.leftView = imageV;
    self.leftViewMode = UITextFieldViewModeAlways;
    
    self.font = WKSystemFontSize(15);
    self.layer.cornerRadius = 15;
    self.backgroundColor = WKGrayColor(230, 255);
}

+ (instancetype)searchBarWithPlaceholder:(NSString *)placeholder
{
    WKSearchBar *searchBar = [[self alloc] init];
    searchBar.placeholder = placeholder;
    return searchBar;
}
@end

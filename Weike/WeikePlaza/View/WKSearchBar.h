//
//  WKSearchBar.h
//  Weike
//
//  Created by zhang on 17/6/13.
//  Copyright © 2017年 zhang. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface WKSearchBar : UITextField
@property (nonatomic, strong) UIColor *fieldColor;

+ (instancetype)searchBarWithPlaceholder:(NSString *)placeholder;

@end

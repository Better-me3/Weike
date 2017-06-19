//
//  WKSearchBarAndCancelBtn.h
//  Weike
//
//  Created by zhang on 17/6/19.
//  Copyright © 2017年 zhang. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "WKSearchBar.h"

typedef void(^CancelBtnClick)();

@interface WKSearchBarAndCancelBtn : UIView
@property (nonatomic, weak) WKSearchBar *searchBar;
@property (nonatomic, copy) NSString *searchText;
@property (nonatomic, strong) UIColor *fieldColor;
@property (nonatomic, copy) CancelBtnClick cancelClick;

@end

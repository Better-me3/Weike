//
//  WKSearchBarMask.h
//  Weike
//
//  Created by zhang on 17/6/22.
//  Copyright © 2017年 zhang. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "WKSearchBarAndCancelBtn.h"

@interface WKSearchBarMask : UIControl
@property (nonatomic, weak) WKSearchBarAndCancelBtn *searchWrapper;
@property(nullable, nonatomic,weak) id<UITextFieldDelegate> delegate;

- (instancetype)initWithFrame:(CGRect)frame;

@end

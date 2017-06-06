//
//  WKButtonTextField.h
//  Weike
//
//  Created by zhang on 17/5/21.
//  Copyright © 2017年 zhang. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void(^ButtonAction)();

@interface WKButtonTextField : UIView

@property (nonatomic, assign) BOOL isOnlyTextField; //default is YES
@property (nonatomic, copy) NSString *placeholder; //placeHolder of textField

@property (nonatomic, copy) ButtonAction buttonAction;

@end

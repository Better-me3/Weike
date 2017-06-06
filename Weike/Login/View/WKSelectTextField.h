//
//  WKSelectTextField.h
//  Weike
//
//  Created by zhang on 17/5/23.
//  Copyright © 2017年 zhang. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void(^FieldClicked)();

@interface WKSelectTextField : UITextField
@property (nonatomic, copy) NSString *leftViewText;
@property (nonatomic, strong) UIView *leftV;
@property (nonatomic, copy) FieldClicked fieldClicked;
@end

//
//  WKSearchRecordView.h
//  Weike
//
//  Created by zhang on 17/6/15.
//  Copyright © 2017年 zhang. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void(^ButtonClickBlock)(NSInteger index);

@interface WKSearchRecordView : UIView
@property (nonatomic, copy) ButtonClickBlock btnClickBlock;

-(instancetype) initWithFrame:(CGRect)frame dataArray:(NSArray *)array;

@end

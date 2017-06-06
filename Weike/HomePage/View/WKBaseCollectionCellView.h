//
//  WKBaseCollectionCellView.h
//  Weike
//
//  Created by zhang on 17/5/30.
//  Copyright © 2017年 zhang. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface WKBaseCollectionCellView : UIView
@property (weak, nonatomic) IBOutlet UILabel *videoNameL;
@property (weak, nonatomic) IBOutlet UIView *belowContainerV;
@property (weak, nonatomic) IBOutlet UIImageView *videoPicture;
@property (weak, nonatomic) IBOutlet UIImageView *videoIndicater;

+ (instancetype)baseCollectionCellView;

@end

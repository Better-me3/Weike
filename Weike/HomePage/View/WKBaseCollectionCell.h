//
//  WKBaseCollectionCell.h
//  Weike
//
//  Created by zhang on 17/5/30.
//  Copyright © 2017年 zhang. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "WKBaseCollectionCellView.h"

@interface WKBaseCollectionCell : UICollectionViewCell
//@property (weak, nonatomic) IBOutlet WKBaseCollectionCellView *baseView;
@property (nonatomic, weak) WKBaseCollectionCellView *baseView;

@end

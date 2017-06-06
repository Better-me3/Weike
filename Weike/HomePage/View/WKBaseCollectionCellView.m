//
//  WKBaseCollectionCellView.m
//  Weike
//
//  Created by zhang on 17/5/30.
//  Copyright © 2017年 zhang. All rights reserved.
//

#import "WKBaseCollectionCellView.h"

@interface WKBaseCollectionCellView ()


@property (weak, nonatomic) IBOutlet UILabel *videoDateL;
@property (weak, nonatomic) IBOutlet UILabel *videoDurationL;



@end

@implementation WKBaseCollectionCellView

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/


+ (instancetype)baseCollectionCellView
{
    
    return [[[NSBundle mainBundle] loadNibNamed:NSStringFromClass([self class]) owner:self options:nil] lastObject];
}

- (instancetype)initWithCoder:(NSCoder *)aDecoder
{
    if (self = [super initWithCoder:aDecoder])
    {
        self.videoPicture.layer.masksToBounds = YES;
    }
    return self;
}
@end

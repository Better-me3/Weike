//
//  WKTeacherCourseCell.m
//  Weike
//
//  Created by zhang on 17/6/5.
//  Copyright © 2017年 zhang. All rights reserved.
//

#import "WKTeacherCourseCell.h"
#import "WKBaseCollectionCellView.h"

@interface WKTeacherCourseCell ()
@property (nonatomic, weak) UIImageView *videoImage;
@end

@implementation WKTeacherCourseCell
- (instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        [self setupSubviews];
    }
    return self;
}

- (void)setupSubviews
{
    WKBaseCollectionCellView *baseView = [WKBaseCollectionCellView baseCollectionCellView];
    [self addSubview:baseView];
    self.baseView = baseView;
    
    UIImage *image = [UIImage imageNamed:@"u2133"];
    UIImageView *videoImage = [[UIImageView alloc] initWithImage:image];
    videoImage.backgroundColor = [UIColor cyanColor];
    [self addSubview:videoImage];
    CGRect frame = videoImage.frame;
    frame.size = image.size;
    frame.origin = CGPointMake(0, 0);
    videoImage.frame = frame;
    self.videoImage = videoImage;
}

- (void)layoutSubviews
{
    [super layoutSubviews];
    
    _baseView.frame = self.bounds;
    self.videoImage.center = _baseView.center;
}

@end

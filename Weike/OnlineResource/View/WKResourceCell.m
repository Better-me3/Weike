//
//  WKResourceCell.m
//  Weike
//
//  Created by zhang on 17/6/18.
//  Copyright © 2017年 zhang. All rights reserved.
//

#import "WKResourceCell.h"

@interface WKResourceCell ()
@property (weak, nonatomic) IBOutlet UIImageView *picture;
@property (weak, nonatomic) IBOutlet UILabel *courseName;
@property (weak, nonatomic) IBOutlet UILabel *dateTime;

@end

@implementation WKResourceCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end

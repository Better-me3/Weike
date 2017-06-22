//
//  WKSearchRecordView.m
//  Weike
//
//  Created by zhang on 17/6/15.
//  Copyright © 2017年 zhang. All rights reserved.
//

#import "WKSearchRecordView.h"

//#define kMargin 20
#define kSpace 10

@implementation WKSearchRecordView

-(instancetype) initWithFrame:(CGRect)frame dataArray:(NSArray *)array;
{
    if (self = [super initWithFrame:frame]) {
        for (int i = 0; i < array.count; i++)
        {//思路: 依次放置每一个词, 首先算当前屏幕宽度是否够放,不够的话放下一行
            static UIButton *lastButton = nil;
            NSString *content = array[i];
            UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
            button.backgroundColor = WKGrayColor(230, 200);
            [button setTitle:content forState:UIControlStateNormal];
            [button setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
            button.titleLabel.font = WKSystemFontSize(14);
            [button addTarget:self action:@selector(buttonClicked:) forControlEvents:UIControlEventTouchUpInside];
            button.tag = kSearchButtonInitialTag + i;
            
            CGSize btnSize = [content boundingRectWithSize:CGSizeMake(frame.size.width, MAXFLOAT) options:NSStringDrawingUsesLineFragmentOrigin | NSStringDrawingUsesFontLeading attributes:@{NSFontAttributeName:WKSystemFontSize(14)} context:nil].size;
            CGFloat btnW = btnSize.width + 20;
            CGFloat btnH = btnSize.height + 10;
            button.layer.cornerRadius = btnH / 2;
            button.layer.masksToBounds = YES;
            
            if (i == 0)
            {
                button.frame = CGRectMake(0, 0, btnW, btnH);
            }
            else
            {
                CGFloat leftWidth = self.width - CGRectGetMaxX(lastButton.frame) - kSpace ;
                if (leftWidth >= btnW) {
                    button.frame = CGRectMake(CGRectGetMaxX(lastButton.frame) + kSpace, CGRectGetMinY(lastButton.frame), btnW, btnH);
                }
                else
                   button.frame = CGRectMake(0, CGRectGetMaxY(lastButton.frame) + kSpace, btnW, btnH);
            }
            [self addSubview:button];
            lastButton = button;
            self.frame = CGRectMake(frame.origin.x, frame.origin.y, frame.size.width, CGRectGetMaxY(lastButton.frame) + kSpace);
        }
        
    }
    return self;
}

- (void)buttonClicked:(UIButton *)sender
{
    __weak typeof(self) weakSelf = self;
    weakSelf.btnClickBlock ? weakSelf.btnClickBlock(sender.tag) : nil;
}

@end

//
//  LTStatusTagView.m
//  LTDynamicCellDemo
//
//  Created by Lintao.Yu on 15/12/11.
//  Copyright © 2015年 Lintao Yu. All rights reserved.
//

#import "LTStatusTagView.h"
#import "YYKit.h"
#import "WBStatusLayout.h"
#import "LTStatusCell.h"

@implementation LTStatusTagView
- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    @weakify(self);
    _button = [UIButton buttonWithType:UIButtonTypeCustom];
    [_button setBackgroundImage:[UIImage imageWithColor:kWBCellBackgroundColor] forState:UIControlStateNormal];
    [_button setBackgroundImage:[UIImage imageWithColor:[UIColor colorWithWhite:0.000 alpha:0.200]] forState:UIControlStateHighlighted];
    [_button addBlockForControlEvents:UIControlEventTouchUpInside block:^(id sender) {
        if ([weak_self.cell.delegate respondsToSelector:@selector(cellDidClickTag:)]) {
            [weak_self.cell.delegate cellDidClickTag:weak_self.cell];
        }
    }];
    _button.hidden = YES;
    [self addSubview:_button];
    
    _label = [YYLabel new];
    _label.textVerticalAlignment = YYTextVerticalAlignmentCenter;
    _label.displaysAsynchronously = YES;
    _label.ignoreCommonProperties = YES;
    _label.fadeOnHighlight = NO;
    _label.fadeOnAsynchronouslyDisplay = NO;
    _label.highlightTapAction = ^(UIView *containerView, NSAttributedString *text, NSRange range, CGRect rect) {
        if ([weak_self.cell.delegate respondsToSelector:@selector(cell:didClickInLabel:textRange:)]) {
            [weak_self.cell.delegate cell:weak_self.cell didClickInLabel:(YYLabel *)containerView textRange:range];
        }
    };
    [self addSubview:_label];
    
    _imageView = [UIImageView new];
    _imageView.size = CGSizeMake(kWBCellTagPlaceHeight, kWBCellTagPlaceHeight);
    _imageView.image = [WBStatusHelper imageNamed:@"timeline_icon_locate"];
    _imageView.hidden = YES;
    [self addSubview:_imageView];
    
    _label.height = kWBCellTagPlaceHeight;
    _button.height = kWBCellTagPlaceHeight;
    self.height = kWBCellTagPlaceHeight;
    return self;
}

- (void)setWithLayout:(WBStatusLayout *)layout {
    if (layout.tagType == WBStatusTagTypePlace) {
        _label.height = kWBCellTagPlaceHeight;
        _imageView.hidden = NO;
        _button.hidden = NO;
        
        _label.left = _imageView.right + 6;
        _label.width = layout.tagTextLayout.textBoundingRect.size.width + 6;
        _label.textLayout = layout.tagTextLayout;
        _label.userInteractionEnabled = NO;
        
        self.width = _label.right;
        _label.width = self.width;
        _button.width = self.width;
    } else if (layout.tagType == WBStatusTagTypeNormal) {
        _imageView.hidden = YES;
        _button.hidden = YES;
        
        _label.left = 0;
        _label.width = layout.tagTextLayout.textBoundingRect.size.width + 1;
        _label.userInteractionEnabled = YES;
        _label.textLayout = layout.tagTextLayout;
    }
}


@end

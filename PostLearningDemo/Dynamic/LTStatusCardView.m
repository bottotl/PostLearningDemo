//
//  LTStatusCardView.m
//  LTDynamicCellDemo
//
//  Created by Lintao.Yu on 15/12/11.
//  Copyright © 2015年 Lintao Yu. All rights reserved.
//

#import "LTStatusCardView.h"
#import "LTStatusCell.h"

@implementation LTStatusCardView{
    BOOL _isRetweet;
}

- (instancetype)initWithFrame:(CGRect)frame {
    if (frame.size.width == 0 && frame.size.height == 0){
        frame.size.width = kScreenWidth;
        frame.origin.x = kWBCellPadding;
    }
    self = [super initWithFrame:frame];
    self.exclusiveTouch = YES;
    
    _imageView = [UIImageView new];
    _imageView.clipsToBounds = YES;
    _imageView.contentMode = UIViewContentModeScaleAspectFill;
    _badgeImageView = [UIImageView new];
    _badgeImageView.clipsToBounds = YES;
    _badgeImageView.contentMode = UIViewContentModeScaleAspectFit;
    _label = [YYLabel new];
    _label.textVerticalAlignment = YYTextVerticalAlignmentCenter;
    _label.numberOfLines = 3;
    _label.ignoreCommonProperties = YES;
    _label.displaysAsynchronously = YES;
    _label.fadeOnAsynchronouslyDisplay = NO;
    _label.fadeOnHighlight = NO;
    _button = [UIButton buttonWithType:UIButtonTypeCustom];
    [self addSubview:_imageView];
    [self addSubview:_badgeImageView];
    [self addSubview:_label];
    [self addSubview:_button];
    self.backgroundColor = kWBCellInnerViewColor;
    self.layer.borderWidth = CGFloatFromPixel(1);
    self.layer.borderColor = [UIColor colorWithWhite:0.000 alpha:0.070].CGColor;
    return self;
}

- (void)setWithLayout:(WBStatusLayout *)layout isRetweet:(BOOL)isRetweet {
    WBPageInfo *pageInfo = isRetweet ? layout.status.retweetedStatus.pageInfo : layout.status.pageInfo;
    if (!pageInfo) return;
    self.height = isRetweet ? layout.retweetCardHeight : layout.cardHeight;
    
    /*
     badge: 25,25 左上角 (42)
     image: 70,70 方形
     100, 70 矩形
     btn:  60,70
     
     lineheight 20
     padding 10
     */
    
    _isRetweet = isRetweet;
    switch (isRetweet ? layout.retweetCardType : layout.cardType) {
        case WBStatusCardTypeNone: {
            
        } break;
        case WBStatusCardTypeNormal: {
            self.width = kWBCellContentWidth;
            if (pageInfo.typeIcon) {
                _badgeImageView.hidden = NO;
                _badgeImageView.frame = CGRectMake(0, 0, 25, 25);
                [_badgeImageView setImageWithURL:pageInfo.typeIcon placeholder:nil];
            } else {
                _badgeImageView.hidden = YES;
            }
            if (pageInfo.pagePic) {
                _imageView.hidden = NO;
                if (pageInfo.typeIcon) {
                    _imageView.frame = CGRectMake(0, 0, 100, 70);
                } else {
                    _imageView.frame = CGRectMake(0, 0, 70, 70);
                }
                [_imageView setImageWithURL:pageInfo.pagePic placeholder:nil];
            } else {
                _imageView.hidden = YES;
            }
            _label.hidden = NO;
            _label.frame = isRetweet ? layout.retweetCardTextRect : layout.cardTextRect;
            _label.textLayout = isRetweet ? layout.retweetCardTextLayout : layout.cardTextLayout;
            WBButtonLink *button = pageInfo.buttons.firstObject;
            if (button.pic && button.name) {
                _button.hidden = NO;
                _button.size = CGSizeMake(60, 70);
                _button.top = 0;
                _button.right = self.width;
                [_button setTitle:button.name forState:UIControlStateNormal];
                [_button setImageWithURL:button.pic forState:UIControlStateNormal placeholder:nil];
            } else {
                _button.hidden = YES;
            }
        }break;
        case WBStatusCardTypeVideo: {
            self.width = self.height;
            _badgeImageView.hidden = YES;
            _label.hidden = YES;
            _imageView.frame = self.bounds;
            [_imageView setImageWithURL:pageInfo.pagePic options:kNilOptions];
            _button.hidden = NO;
            _button.frame = self.bounds;
            [_button setTitle:nil forState:UIControlStateNormal];
            [_button cancelImageRequestForState:UIControlStateNormal];
            [_button setImage:[WBStatusHelper imageNamed:@"multimedia_videocard_play"] forState:UIControlStateNormal];
            
        } break;
        default: {
            
        } break;
    }
    
    self.backgroundColor = isRetweet ? [UIColor whiteColor] : kWBCellInnerViewColor;
}

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
    self.backgroundColor = kWBCellInnerViewHighlightColor;
}

- (void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event {
    self.backgroundColor = _isRetweet ? [UIColor whiteColor] : kWBCellInnerViewColor;
    if ([_cell.delegate respondsToSelector:@selector(cellDidClickCard:)]) {
        [_cell.delegate cellDidClickCard:_cell];
    }
}

- (void)touchesCancelled:(NSSet *)touches withEvent:(UIEvent *)event {
    self.backgroundColor = _isRetweet ? [UIColor whiteColor] : kWBCellInnerViewColor;
}

@end

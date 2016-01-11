//
//  LTPostCommentCell.m
//  OhShock
//
//  Created by Lintao.Yu on 1/10/16.
//  Copyright © 2016 Lintao Yu. All rights reserved.
//

#import "LTPostCommentCell.h"
#import "YYKit.h"
#import "UIView+Layout.h"

@interface LTPostCommentCell ()

@property (nonatomic, strong) YYLabel *commentLabel;

@end

@implementation LTPostCommentCell

#pragma mark - Cell 配置
-(void)setSelected:(BOOL)selected animated:(BOOL)animated{
    [super setSelected:NO animated:animated];
}

-(void)configCellWithAttributedString:(NSAttributedString *)string{
    self.commentLabel.attributedText = string;
    [self setNeedsLayout];
    [self layoutIfNeeded];
}

#pragma mark - layout
-(void)layoutSubviews{
    [super layoutSubviews];
    self.commentLabel.frame = self.contentView.bounds;
    
}

#pragma mark - property
-(YYLabel *)commentLabel{
    if (!_commentLabel) {
        _commentLabel = [YYLabel new];
        _commentLabel.numberOfLines = 0;
        _commentLabel.textAlignment = NSTextAlignmentCenter;
        [self.contentView addSubview:_commentLabel];
    }
    return _commentLabel;
}


#pragma mark - 计算高度
+ (CGFloat)heightWithAttributedString:(NSAttributedString *)string andWidth:(CGFloat)width{
    CGSize size = CGSizeMake(width, CGFLOAT_MAX);
    YYTextLayout *layout = [YYTextLayout layoutWithContainerSize:size text:string];
    return layout.textBoundingSize.height + 7;
}

@end

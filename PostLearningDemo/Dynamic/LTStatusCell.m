//
//  LTStatusCell.m
//  LTDynamicCellDemo
//
//  Created by Lintao.Yu on 15/12/11.
//  Copyright © 2015年 Lintao Yu. All rights reserved.
//

#import "LTStatusCell.h"



@implementation LTStatusCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    _statusView = [LTStatusView new];
    _statusView.cell = self;
    _statusView.profileView.cell = self;
    //_statusView.cardView.cell = self;
    _statusView.toolbarView.cell = self;
    _statusView.tagView.cell = self;
    [self.contentView addSubview:_statusView];
    return self;
}

- (void)prepareForReuse {
    // ignore
}

- (void)setLayout:(WBStatusLayout *)layout {
    self.height = layout.height;
    self.contentView.height = layout.height;
    _statusView.layout = layout;
}


@end

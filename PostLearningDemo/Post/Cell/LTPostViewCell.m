//
//  LTPostCell.m
//  OhShock
//
//  Created by Lintao.Yu on 16/1/3.
//  Copyright © 2016年 Lintao Yu. All rights reserved.
//

#import "LTPostViewCell.h"

@implementation LTPostViewCell

#pragma mark - Init
-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    self.postView.frame = self.contentView.bounds;
    return self;
}
#pragma mark - Cell 配置
- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:NO animated:animated];
}

-(void)configCellWithData:(LTPostModel *)data{
    self.postView.data = data;
}

#pragma mark - layout
-(void)layoutSubviews{
    [super layoutSubviews];
    
    self.postView.frame = self.contentView.bounds;
}


#pragma mark - property
-(LTPostView *)postView{
    if (!_postView) {
        _postView = [LTPostView new];
        [self.contentView addSubview:_postView];
    }
    return _postView;
}




@end

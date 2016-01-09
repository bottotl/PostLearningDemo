//
//  LTPostProfileView.m
//  OhShock
//
//  Created by Lintao.Yu on 16/1/5.
//  Copyright © 2016年 Lintao Yu. All rights reserved.
//

#import "LTPostProfileView.h"
#import "UIImageView+WebCache.h"
#import "YYKit.h"
#import "UIView+Layout.h"

static CGFloat const LTPostProfileViewHeight = 60.0;

@interface LTPostProfileView()
@property (nonatomic, strong) UIImageView  *avatarView;///< 头像
@property (nonatomic, strong) YYLabel      *nameLabel;///< 用户名
@end

@implementation LTPostProfileView{
    BOOL _trackingTouch;
}
-(instancetype)init{
    self = [self initWithFrame:CGRectZero];
    return self;
}
-(instancetype)initWithFrame:(CGRect)frame{
    CGRect rect= CGRectMake(frame.origin.x, frame.origin.y, frame.size.width, LTPostProfileViewHeight);
    self = [super initWithFrame:rect];
    return self;
}


-(void)layoutSubviews{
    
    self.avatarView.size = CGSizeMake(45, 45);
    self.avatarView.layer.cornerRadius = self.avatarView.height/2;
    self.avatarView.backgroundColor = [UIColor redColor];
    self.avatarView.left = 10;
    self.avatarView.centerY = self.height/2;

    self.nameLabel.left = self.avatarView.right + 5;
    self.nameLabel.centerY = self.avatarView.centerY;
    [super layoutSubviews];
}

#pragma mark - property
#pragma mark - View property

-(YYLabel *)nameLabel{
    if(!_nameLabel){
        _nameLabel = [YYLabel new];
        //        _nameLabel.displaysAsynchronously = YES;
        //        _nameLabel.ignoreCommonProperties = YES;
        //        _nameLabel.fadeOnAsynchronouslyDisplay = NO;
        //        _nameLabel.fadeOnHighlight = NO;
        //        _nameLabel.lineBreakMode = NSLineBreakByClipping;
        //        _nameLabel.textVerticalAlignment = YYTextVerticalAlignmentCenter;
        [self addSubview:_nameLabel];
    }
    return _nameLabel;
}

-(UIImageView *)avatarView{
    if (!_avatarView) {
        _avatarView = [UIImageView new];
        _avatarView.clipsToBounds = YES;
        [self addSubview:_avatarView];
    }
    return _avatarView;
}

#pragma mark - Data property
-(void)setData:(LTPostProfileModel *)data{
    _data = data;
    [self setAvatatUrlString:data.avatarUrl];
    [self setName:data.name];
}

-(void)setAvatatUrlString:(NSString *)avatatUrlString{
    _avatatUrlString = avatatUrlString;
    [self.avatarView sd_setImageWithURL:[NSURL URLWithString:avatatUrlString]];
}

-(void)setName:(NSString *)name{
    _name = name;
    CGSize size = CGSizeMake(kScreenWidth - 110, 24);
    YYTextLayout *layout = [YYTextLayout layoutWithContainerSize:size text:[[NSAttributedString alloc]initWithString:name]];
    self.nameLabel.size = layout.textBoundingSize;
    self.nameLabel.textLayout = layout;
}

#pragma mark -
+(CGFloat)viewHeight{
    return LTPostProfileViewHeight;
}
@end

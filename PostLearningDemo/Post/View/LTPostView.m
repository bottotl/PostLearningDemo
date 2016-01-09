//
//  LTPostView.m
//  OhShock
//
//  Created by Lintao.Yu on 1/8/16.
//  Copyright © 2016 Lintao Yu. All rights reserved.
//

#import "LTPostView.h"
#import "LTPostProfileView.h"
#import "LTPostContentView.h"
#import "LTPostImagesView.h"
#import "UIView+Layout.h"

static CGFloat const LTPostContentLeftPadding = 5;
static CGFloat const LTPostContentRightPadding = 3;

@interface LTPostView ()

@property (nonatomic, strong) LTPostProfileView *profileView;

@property (nonatomic, strong) LTPostContentView *contentView;

@property (nonatomic, strong) LTPostImagesView *imagesView;

@end

@implementation LTPostView

-(void)layoutSubviews{
    [super layoutSubviews];
    self.profileView.width = self.width;
    self.profileView.top = 0;
    self.profileView.left = 0;
    
    self.contentView.width = self.width - LTPostContentLeftPadding - LTPostContentRightPadding;
    [self.contentView sizeToFit];
    self.contentView.top= self.profileView.bottom;
    self.contentView.left = LTPostContentLeftPadding;
    
    self.imagesView.width = self.width;
    [self.imagesView sizeToFit];
    self.imagesView.top = self.contentView.bottom;
    self.imagesView.left = 0;
    
}


#pragma mark - property

#pragma mark Data
-(void)setData:(LTPostModel *)data{
    //_data = data;
    
    self.profileView.data = data.profileData;
    self.contentView.data = data.contentData;
    
    self.imagesView.data = data.pic;
    self.imagesView.limit = 9;
    self.imagesView.hidden = NO;
    self.imagesView.itemSpace = 6;
    self.imagesView.needBig = YES;
}

#pragma mark View
-(LTPostImagesView *)imagesView{
    if (!_imagesView) {
        _imagesView = [LTPostImagesView new];
        [self addSubview:_imagesView];
    }
    return _imagesView;
}

-(LTPostContentView *)contentView{
    if (!_contentView) {
        _contentView = [LTPostContentView new];
        [self addSubview:_contentView];
    }
    return _contentView;
}

-(LTPostProfileView *)profileView{
    if (!_profileView) {
        _profileView = [LTPostProfileView new];
        [self addSubview:_profileView];
    }
    return _profileView;
}

#pragma mark - 高度计算

+(CGFloat)viewHeightWithData:(LTPostModel *)data{
    CGFloat height = 0;
    height += [LTPostProfileView viewHeight];
    height += [LTPostContentView viewHeightWithContent:data.contentData.content andPerferedWidth:[UIScreen mainScreen].bounds.size.width];
    height += [LTPostImagesView heightWithSuggestThreePicWidth:(([UIScreen mainScreen].bounds.size.width) - LTPostContentLeftPadding - LTPostContentRightPadding )
                                                   andPicCount:data.pic.count
                                                     andBigPic:YES
                                                  andItemSpace:6
                                                     withLimit:9];
    
    return height;
}

@end

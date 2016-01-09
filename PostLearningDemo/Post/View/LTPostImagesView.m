//
//  LTPostImagesView.m
//  OhShock
//
//  Created by Lintao.Yu on 1/6/16.
//  Copyright © 2016 Lintao Yu. All rights reserved.
//

#import "LTPostImagesView.h"
#import "LTPostImageCollectionViewCell.h"
#import "UIView+Layout.h"
#import "LTPostImageModel.h"

@interface LTPostImagesView ()<UICollectionViewDelegate, UICollectionViewDataSource>

@property (nonatomic, strong) UICollectionView           *collectionView;
@property (nonatomic, strong) UICollectionViewFlowLayout *layout;

@end

@implementation LTPostImagesView
#pragma mark - init

- (instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        self.backgroundColor = [UIColor clearColor];
        [self p_initial];
        [self reset];
    }
    return self;
}
- (void)p_initial{
    _layout = [UICollectionViewFlowLayout new];
    _collectionView  = [[UICollectionView alloc] initWithFrame:CGRectZero collectionViewLayout:_layout];
    _collectionView.delegate = self;
    _collectionView.dataSource = self;
    _collectionView.backgroundColor = [UIColor clearColor];
    _collectionView.scrollEnabled = NO;
    [_collectionView registerClass:[LTPostImageCollectionViewCell class] forCellWithReuseIdentifier:LTPostImageCollectionCellIdentifier];
    [self addSubview:_collectionView];
    
}
- (void)layoutSubviews{
    [super layoutSubviews];
    NSInteger count = MIN(self.data.count, self.limit);
    CGFloat picWidth = ( self.width - 2 * self.itemSpace ) / 3;
    if ((self.needBig && count == 1) || count == 4 || count == 2) {
        picWidth = (self.width - self.itemSpace ) / 2;
    } else if (count == 1 && !self.needBig){
        picWidth = self.width;
    }
    if (self.data.count == 1 && self.needBig) {
        self.layout.itemSize = CGSizeMake(self.height, self.height);
    } else {
        self.layout.itemSize = CGSizeMake(picWidth, picWidth);
    }
    self.collectionView.frame = self.bounds;
    
}

- (CGSize)sizeThatFits:(CGSize)size{
    if (size.width == 0) return size;
    NSInteger count = MIN(self.data.count, self.limit);
    CGFloat picWidth = ( self.width - 2 * self.itemSpace ) / 3;
    if (( self.needBig && count == 1 ) || count == 4) {
        size.width = self.itemSpace + 2 * picWidth;
        size.height = size.width;
    } else if (count < 3) {
        size.height = picWidth;
        size.width = count * (picWidth + self.itemSpace) - self.itemSpace;
    } else {
        size.height = [[self class] heightWithSuggestThreePicWidth:size.width andPicCount:self.data.count andBigPic:self.needBig andItemSpace:6 withLimit:self.limit];
    }
    return size;
}

- (void)reset{
    
    self.needBig = YES;
    self.data = nil;
}

#pragma mark - collectionView  delegate

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return self.data.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    LTPostImageCollectionViewCell *cell = (LTPostImageCollectionViewCell  *)[collectionView dequeueReusableCellWithReuseIdentifier:LTPostImageCollectionCellIdentifier forIndexPath:indexPath];
    LTPostImageModel *pic = self.data[indexPath.row];
    [cell configCellWithImageUrl:pic.smallUrlString];
    if (self.limit < self.data.count && indexPath.row == self.limit - 1) {
        cell.numberLabel.hidden = NO;
        cell.numberLabel.text = [@(self.data.count) stringValue];
    }
    return cell;
}



#pragma mark - property
- (void)setData:(NSArray *)data{
    _data = data;
    [self.collectionView reloadData];
}

- (void)setItemSpace:(CGFloat)itemSpace{
    _itemSpace = itemSpace;
    self.layout.minimumLineSpacing = itemSpace;
    self.layout.minimumInteritemSpacing = itemSpace;
}

#pragma mark - 计算总高度
+ (CGFloat)heightWithSuggestThreePicWidth:(CGFloat)width andPicCount:(NSInteger)count andBigPic:(BOOL)bigpic andItemSpace:(CGFloat)space withLimit:(NSInteger)limit{
    count = MIN(limit, count);
    CGFloat picWidth = ( width - 2 * space ) / 3;
    if (!count || picWidth < 0) {
        return 0;
    } else if (count == 4 || (count == 1 && bigpic)) {
        return 2 * picWidth + space;
    } else {
        return ( picWidth + space ) * (( count + 2 ) / 3) - space;
    }
}

@end

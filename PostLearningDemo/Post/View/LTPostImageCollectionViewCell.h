//
//  LTPostImageCollectionViewCell.h
//  OhShock
//
//  Created by Lintao.Yu on 1/8/16.
//  Copyright © 2016 Lintao Yu. All rights reserved.
//

#import <UIKit/UIKit.h>

static NSString *const LTPostImageCollectionCellIdentifier = @"LTPostImageCollectionViewCell";
/**
 *  包含了一个 ImageView 的 UICollectionViewCell ，用于多图展示控件 < LTPostImagesView > 
    表示了一张图片
 */
@interface LTPostImageCollectionViewCell : UICollectionViewCell


/**
 *  为图片设置 Url
 *
 *  @param url 图片的 Url
 */
-(void)configCellWithImageUrl:(NSString *)url;

@end

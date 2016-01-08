//
//  LTPostImageCollectionViewCell.h
//  OhShock
//
//  Created by Lintao.Yu on 1/8/16.
//  Copyright © 2016 Lintao Yu. All rights reserved.
//

#import <UIKit/UIKit.h>

static NSString *const LTPostImageCollectionCellIdentifier = @"LTPostImageCollectionViewCell";

@interface LTPostImageCollectionViewCell : UICollectionViewCell

@property(nonatomic, strong)  UIImageView *imageView;
@property(nonatomic, strong)  UILabel     *numberLabel;
@property(nonatomic, strong)  UIView      *numberView;

-(void)configCellWithImageUrl:(NSString *)url;

@end

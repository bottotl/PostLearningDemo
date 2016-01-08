//
//  LTPostImageCollectionViewCell.m
//  OhShock
//
//  Created by Lintao.Yu on 1/8/16.
//  Copyright © 2016 Lintao Yu. All rights reserved.
//

#import "LTPostImageCollectionViewCell.h"
#import "UIImageView+WebCache.h"
#import "UIView+Layout.h"

@implementation LTPostImageCollectionViewCell

-(instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        [self initialize];
        self.imageView.contentMode = UIViewContentModeScaleAspectFill;
    }
    return self;
}


-(void)prepareForReuse{
    [super prepareForReuse];
    [self.imageView sd_setImageWithURL:nil];
    self.numberLabel.hidden = YES;
    self.numberView.hidden = YES;
}

-(void)initialize{
    _imageView = [UIImageView new];
    _imageView.clipsToBounds = YES;
    [self.contentView addSubview:_imageView];
    
    _numberView = [UIView new];
    _numberView.backgroundColor = [UIColor blackColor];
    _numberView.clipsToBounds = YES;
    _numberView.alpha = 0.5;
    [self.contentView addSubview:_numberView];
    _numberView.hidden = YES;
    
    _numberLabel = [UILabel new];
    _numberLabel.font = [UIFont boldSystemFontOfSize:12];
    _numberLabel.textColor = [UIColor whiteColor];
    [self.contentView addSubview:_numberLabel];
    _numberLabel.hidden = YES;
}

-(void)layoutSubviews{
    [super layoutSubviews];
    self.imageView.frame = self.bounds;
    
    if (!self.numberLabel.hidden) {
        self.numberView.hidden = NO;
        self.numberView.size = CGSizeMake(25, 18);
        self.numberView.layer.cornerRadius = 9;
        self.numberView.bottom = self.height - 5;
        self.numberView.right = self.width - 5;
        
        [self.numberLabel sizeToFit];
        self.numberLabel.center = self.numberView.center;
    }
}

-(void)configCellWithImageUrl:(NSString *)url{
    [self.imageView sd_setImageWithURL:[NSURL URLWithString:url]];
}


@end

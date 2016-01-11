//
//  LTPostView.h
//  OhShock
//
//  Created by Lintao.Yu on 1/8/16.
//  Copyright © 2016 Lintao Yu. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "LTPostModel.h"

/**
 *  动态 View 页面
    主要负责把零碎的其他小页面、按钮组合在一起
 */
@interface LTPostView : UIView

@property (nonatomic, strong) LTPostModel *data;

+(CGFloat) viewHeightWithData:(LTPostModel *)data;

@end

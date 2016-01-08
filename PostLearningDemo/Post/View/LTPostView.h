//
//  LTPostView.h
//  OhShock
//
//  Created by Lintao.Yu on 1/8/16.
//  Copyright © 2016 Lintao Yu. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "LTPostModel.h"

//@class LTPostLayout;
@interface LTPostView : UIView

@property (nonatomic, strong) LTPostModel *data;

+(CGFloat) viewHeightWithData:(LTPostModel *)data;
//@property (nonatomic, weak) LTPostLayout *layout;
@end

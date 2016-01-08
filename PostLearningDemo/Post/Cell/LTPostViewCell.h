//
//  LTPostCell.h
//  OhShock
//
//  Created by Lintao.Yu on 16/1/3.
//  Copyright © 2016年 Lintao Yu. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "LTPostView.h"
#import "LTPostModel.h"

static NSString *const LTPostViewCellIdentifier = @"LTPostViewCell";
@interface LTPostViewCell : UITableViewCell

@property (nonatomic, strong) LTPostView *postView;

-(void)configCellWithData:(LTPostModel *)data;

@end

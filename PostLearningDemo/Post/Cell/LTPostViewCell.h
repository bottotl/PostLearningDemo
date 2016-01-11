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

/**
 *  一条 Post 对应的 Cell，作为一个容器存在，显示逻辑写在 LTPostView 中
 */
@interface LTPostViewCell : UITableViewCell

/**
 *  真实的 Post 视图
 */
@property (nonatomic, strong) LTPostView *postView;

/**
 *  配置 Cell 数据
 *
 *  @param data post 原始数据
 */
-(void)configCellWithData:(LTPostModel *)data;

@end

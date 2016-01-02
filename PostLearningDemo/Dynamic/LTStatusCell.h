//
//  LTStatusCell.h
//  LTDynamicCellDemo
//
//  Created by Lintao.Yu on 15/12/11.
//  Copyright © 2015年 Lintao Yu. All rights reserved.
//

#import "YYTableViewCell.h"
#import "WBStatusLayout.h"
#import "LTStatusView.h"

#import "LTStatusProfileView.h"
#import "LTStatusCardView.h"
#import "LTStatusToolbarView.h"
#import "LTStatusTagView.h"

@class YYLabel;
@class WBStatusLayout;

@protocol LTStatusCellDelegate;
/**
 *
 *  这只是一个用来包含 LTStatusView 的一个容器，以便展示
 */
@interface LTStatusCell : YYTableViewCell
@property (nonatomic, weak) id<LTStatusCellDelegate> delegate;
/**
 *  真实展示的 View
 */
@property (nonatomic, strong) LTStatusView *statusView;
/**
 *  设置这个属性将同时设定各个 View 的 Frame
 */
- (void)setLayout:(WBStatusLayout *)layout;
@end

@protocol LTStatusCellDelegate <NSObject>
@optional
/// 点击了 Cell
- (void)cellDidClick:(LTStatusCell *)cell;
/// 点击了 Card
- (void)cellDidClickCard:(LTStatusCell *)cell;
/// 点击了转发内容
- (void)cellDidClickRetweet:(LTStatusCell *)cell;
/// 点击了Cell菜单
- (void)cellDidClickMenu:(LTStatusCell *)cell;
/// 点击了关注
- (void)cellDidClickFollow:(LTStatusCell *)cell;
/// 点击了转发
- (void)cellDidClickRepost:(LTStatusCell *)cell;
/// 点击了下方 Tag
- (void)cellDidClickTag:(LTStatusCell *)cell;
/// 点击了评论
- (void)cellDidClickComment:(LTStatusCell *)cell;
/// 点击了赞
- (void)cellDidClickLike:(LTStatusCell *)cell;
/// 点击了用户
- (void)cell:(LTStatusCell *)cell didClickUser:(WBUser *)user;
/// 点击了图片
- (void)cell:(LTStatusCell *)cell didClickImageAtIndex:(NSUInteger)index;
/// 点击了 Label 的链接
- (void)cell:(LTStatusCell *)cell didClickInLabel:(YYLabel *)label textRange:(NSRange)textRange;
@end

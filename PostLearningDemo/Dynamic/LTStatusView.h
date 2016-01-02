//
//  LTStatusView.h
//  LTDynamicCellDemo
//
//  Created by Lintao.Yu on 15/12/11.
//  Copyright © 2015年 Lintao Yu. All rights reserved.
//

#import <UIKit/UIKit.h>
@class YYLabel;
@class LTStatusTagView;
@class LTStatusTitleView;
@class LTStatusProfileView;
@class LTStatusCardView;
@class LTStatusToolbarView;
@class WBStatusLayout;
@class LTStatusCell;


/**
 *  包含了所有动态需要展示的内容
 */
@interface LTStatusView : UIView

@property (nonatomic, strong) UIView *contentView;///< 容器

@property (nonatomic, strong) LTStatusProfileView *profileView;///< 用户资料

@property (nonatomic, strong) YYLabel *textLabel;///< 内容文本

@property (nonatomic, strong) NSArray *picViews;///< 图片 Array<UIImageView>

@property (nonatomic, strong) UIView *retweetBackgroundView;///< 转发容器

@property (nonatomic, strong) YYLabel *retweetTextLabel;///< 转发文本

@property (nonatomic, strong) LTStatusCardView *cardView;///< 卡片

@property (nonatomic, strong) LTStatusTagView *tagView;///< 下方 Tag

@property (nonatomic, strong) LTStatusToolbarView *toolbarView;///< 工具栏

@property (nonatomic, strong) UIImageView *vipBackgroundView;///< VIP 自定义背景

@property (nonatomic, strong) UIButton *menuButton;///< 菜单按钮

@property (nonatomic, strong) UIButton *followButton;///< 关注按钮

@property (nonatomic, strong) WBStatusLayout *layout;
@property (nonatomic, weak) LTStatusCell *cell;
@end

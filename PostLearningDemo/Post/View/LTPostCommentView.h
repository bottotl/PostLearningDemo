//
//  LTPostCommentView.h
//  OhShock
//
//  Created by Lintao.Yu on 1/10/16.
//  Copyright © 2016 Lintao Yu. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "LTModels.h"
#import "LTPostCommentModel.h"

@interface LTPostCommentView : UIView

/**
 *  评论内容 @[<LTModelPostComment *>]
 */
@property (nonatomic, strong) NSArray  *comments;

/**
 *  最多显示多少条评论
 */
@property (nonatomic, assign) NSInteger limit;

/**
 *  是否需要折叠评论（还没做）
 */
@property (nonatomic, assign) BOOL      fold;

/**
 *  通过调用这个方法去刷新评论内容
    设置完 comments 之后都需要调用一次
 */
- (void)resetTabelView;

/**
 *  计算高度
 *
 *  @param comments LTModelPostComment *
 *  @param limit    最多评论数
 *  @param fold     是否需要折叠
 *  @param width    宽度
 *
 *  @return 高度
 */
+ (CGFloat)suggestHeightWithComments:(NSArray *)comments andLimit:(NSInteger)limit andFold:(BOOL)fold withWidth:(CGFloat)width;

@end

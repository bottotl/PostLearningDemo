//
//  LTPostCommentCell.h
//  OhShock
//
//  Created by Lintao.Yu on 1/10/16.
//  Copyright © 2016 Lintao Yu. All rights reserved.
//

#import <UIKit/UIKit.h>

static NSString *const LTPostCommentCellIdentifier = @"LTPostCommentCell";
/**
 *  出现在 LTPostCommentView 中，一个 Cell 代表了一条评论
 */
@interface LTPostCommentCell : UITableViewCell

/**
 *  给 Cell 填充内容的接口
 *
 *  @param string 评论内容的富文本 eg: "用户 A 回复 用户 B：我爱你。"
 */
-(void)configCellWithAttributedString:(NSAttributedString *)string;

/**
 *  计算单个评论 Cell 的高度
 *
 *  @param string 评论内容的富文本 eg: "用户 A 回复 用户 B：我爱你。"
 *  @param width  期望宽度
 *
 *  @return 高度
 */
+(CGFloat)heightWithAttributedString:(NSAttributedString *)string andWidth:(CGFloat)width;

@end

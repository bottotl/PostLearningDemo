//
//  LTPostCommentModel.h
//  OhShock
//
//  Created by Lintao.Yu on 1/10/16.
//  Copyright © 2016 Lintao Yu. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "LTModels.h"


/**
 *  提供给 LTPostCommentView 用的 评论数据模型
    和 LTModelPostComment 容易搞混
    设计 LTModelPostComment 和 LTPostCommentModel 是为了解耦合
    LTPostCommentModel 是为了方便给 View 填充数据而存在
    LTModelPostComment 存储了从服务器中读取的原始数据
 */
@interface LTPostCommentModel : NSObject

@property (nonatomic, strong) NSAttributedString  *text;///< 展示的评论文本
@property (nonatomic, assign) NSRange              fromUserRange;
@property (nonatomic, assign) NSRange              toUserRange;
@property (nonatomic, strong) LTModelPostComment  *comment;

/**
 *  把 LTModelPostComment 转化为 LTPostCommentModel
 *
 *  @param comment 评论的原始数据
 *
 *  @return 评论的展示数据
 */
- (instancetype)initWithComment:(LTModelPostComment *)comment;

@end

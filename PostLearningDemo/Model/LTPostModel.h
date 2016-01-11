//
//  LTPostModel.h
//  OhShock
//
//  Created by Lintao.Yu on 16/1/3.
//  Copyright © 2016年 Lintao Yu. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "LTPostProfileModel.h"
#import "LTPostContentModel.h"
#import "LTPostImageModel.h"
#import "LTPostLikedModel.h"
#import "LTPostCommentModel.h"

/**
 *  Post 的数据模型
    负责给 LTPostView 填充数据
 */
@interface LTPostModel : NSObject

/** 个人资料 */
@property (nonatomic, strong) LTPostProfileModel *profileData;

/** 内容 */
@property (nonatomic, strong) LTPostContentModel *contentData;

/** 图片的 Url @[<LTPostImageModel *>] */
@property (nonatomic, strong) NSArray *pic;

/** 点赞列表数据模型 */
@property (nonatomic, strong) LTPostLikedModel *likedData;

/** 评论@[<LTModelPostComment *>] */
@property (nonatomic, strong) NSArray *comments;

@end

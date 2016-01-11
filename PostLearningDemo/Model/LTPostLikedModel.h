//
//  LTPostLikedModel.h
//  OhShock
//
//  Created by Lintao.Yu on 1/9/16.
//  Copyright © 2016 Lintao Yu. All rights reserved.
//

#import <Foundation/Foundation.h>
/**
 *  点赞用户数据模型
    必须先设置 users 再读取 usersNameAttributedString
 */
@interface LTPostLikedModel : NSObject

@property (nonatomic, strong) NSArray *users;
@property (nonatomic, readonly) NSAttributedString *usersNameAttributedString;

@end

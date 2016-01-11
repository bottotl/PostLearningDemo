//
//  LTModels.h
//  OhShock
//
//  Created by Lintao.Yu on 1/10/16.
//  Copyright © 2016 Lintao Yu. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "LTUser.h"

@interface LTModels : NSObject

@end


/**
 *  一条评论
 */
@interface LTModelPostComment : NSObject

/** 回应内容 */
@property (nonatomic, copy) NSString * content;
/** 被回应的用户 */
@property (nonatomic, strong) LTUser * toUser;
/** 发表回应用户 */
@property (nonatomic, strong) LTUser * fromUser;

@end


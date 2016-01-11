//
//  LTUser.h
//  OhShock
//
//  Created by Lintao.Yu on 1/10/16.
//  Copyright © 2016 Lintao Yu. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface LTUser :NSObject

/** 用户id */
@property (nonatomic, assign) NSInteger userId;
/** 用户头像 */
@property (nonatomic, copy) NSString * avatar;
/** 用户名称 */
@property (nonatomic, copy) NSString * userName;

@end

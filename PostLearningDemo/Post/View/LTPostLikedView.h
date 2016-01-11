//
//  LTPostLikedView.h
//  OhShock
//
//  Created by Lintao.Yu on 1/9/16.
//  Copyright © 2016 Lintao Yu. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "LTPostLikedModel.h"

/**
 *  显示谁点了赞
 */
@interface LTPostLikedView : UIView

/**
 *  给 View 填充数据用的数据模型
 */
@property (nonatomic, strong) LTPostLikedModel *data;

/**
 *  计算高度
 *
 *  @param usersName 包含所有用户名的富文本 eg:（💗A , B ,C …… ）
 *  @param width     期望的宽度
 *
 *  @return 高度
 */
+(CGFloat)heightWithUsersName:(NSAttributedString *)usersName andWith:(CGFloat)width;

@end

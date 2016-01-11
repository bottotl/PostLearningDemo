//
//  LTPostProfileView.h
//  OhShock
//
//  Created by Lintao.Yu on 16/1/5.
//  Copyright © 2016年 Lintao Yu. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "LTPostProfileModel.h"
typedef void (^LTAvatarTapBlock)(id sender);

/**
 *  显示个人信息
 */
@interface LTPostProfileView : UIView

/**
 *  数据
 */
@property (nonatomic, strong) LTPostProfileModel *data;

/**
 *  用户头像 Url
 */
@property (nonatomic, copy) NSString *avatatUrlString;

/**
 *  用户名
 */
@property (nonatomic, copy) NSString *name;

/**
 *  头像点击事件对应 Block;
 */
@property (nonatomic, strong) LTAvatarTapBlock avatarTapBlock;

/** 获取总高度*/
+(CGFloat)viewHeight;

@end

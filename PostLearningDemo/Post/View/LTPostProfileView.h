//
//  LTPostProfileView.h
//  OhShock
//
//  Created by Lintao.Yu on 16/1/5.
//  Copyright © 2016年 Lintao Yu. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "LTPostProfileModel.h"

@interface LTPostProfileView : UIView

@property (nonatomic, strong) LTPostProfileModel *data;

@property (nonatomic, copy) NSString *avatatUrlString;

@property (nonatomic, copy) NSString *name;


/** 获取总高度*/
+(CGFloat)viewHeight;

@end

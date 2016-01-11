//
//  LTPostContentModel.h
//  OhShock
//
//  Created by Lintao.Yu on 1/8/16.
//  Copyright © 2016 Lintao Yu. All rights reserved.
//

#import <Foundation/Foundation.h>
/**
 *  给 LTPostContentViwe 填充数据用的数据模型
 */
@interface LTPostContentModel : NSObject

/**
 *  内容富文本
 */
@property (nonatomic, copy) NSAttributedString *content;

@end

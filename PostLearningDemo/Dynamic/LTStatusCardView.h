//
//  LTStatusCardView.h
//  LTDynamicCellDemo
//
//  Created by Lintao.Yu on 15/12/11.
//  Copyright © 2015年 Lintao Yu. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "YYKit.h"
#import "WBStatusLayout.h"

@class LTStatusCell;
/**
 *  卡片 (样式有多种，最常见的是下方这样)
    -----------------------------
            title
    pic     title        button
            tips
    -----------------------------
*/

@interface LTStatusCardView : UIView
/**
 *  最左边的 pic
 */
@property (nonatomic, strong) UIImageView *imageView;
/**
 *  Badge 徽章通常放在最左上角角落里 （应该没用到）
 */
@property (nonatomic, strong) UIImageView *badgeImageView;
/**
 *  显示内容如下：
 *   -----------
        title
        title
        tips
     -----------
 */
@property (nonatomic, strong) YYLabel *label;
@property (nonatomic, strong) UIButton *button;
@property (nonatomic, weak) LTStatusCell *cell;


- (void)setWithLayout:(WBStatusLayout *)layout isRetweet:(BOOL)isRetweet;
@end

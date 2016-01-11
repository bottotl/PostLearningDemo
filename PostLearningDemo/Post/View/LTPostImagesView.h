//
//  LTPostImagesView.h
//  OhShock
//
//  Created by Lintao.Yu on 1/6/16.
//  Copyright © 2016 Lintao Yu. All rights reserved.
//

#import <UIKit/UIKit.h>
/**
 *  多图显示控件
 */
@interface LTPostImagesView : UIView

@property (nonatomic, strong) NSArray   *data;///< 图片数据 @[<LTPostImageModel *>]

@property (nonatomic, assign) CGFloat   itemSpace;///< 图片间距

@property (nonatomic, assign) BOOL      needBig;///< 是否需要显示大图

@property (nonatomic, assign) NSUInteger limit;///< 图片最多数量

/**
 *  计算图片显示控件的高度
 *
 *  @param width  整个控件的预计宽度
 *  @param count  图片的数量
 *  @param bigpic 是否需要放大
 *  @param space  图片间距
 *  @param limit  最多显示多少张图片
 *
 *  @return 高度
 */
+ (CGFloat)heightWithSuggestThreePicWidth:(CGFloat)width andPicCount:(NSInteger)count andBigPic:(BOOL)bigpic andItemSpace:(CGFloat)space withLimit:(NSInteger)limit;

- (void)reset;

@end


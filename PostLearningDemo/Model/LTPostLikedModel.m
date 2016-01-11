//
//  LTPostLikedModel.m
//  OhShock
//
//  Created by Lintao.Yu on 1/9/16.
//  Copyright © 2016 Lintao Yu. All rights reserved.
//

#import "LTPostLikedModel.h"
#import <UIKit/UIKit.h>
#import "YYKit.h"

@implementation LTPostLikedModel


-(NSAttributedString *)usersNameAttributedString{
    // 点赞列
    NSMutableAttributedString *likeUsers = [NSMutableAttributedString new];
    UIFont *font = [UIFont systemFontOfSize:15];
    
    // 嵌入点赞图
    NSMutableAttributedString *attachment = nil;
    UIImage *image = [UIImage imageNamed:@"post_like_normal_btn"];
    attachment = [NSMutableAttributedString attachmentStringWithContent:image contentMode:UIViewContentModeCenter attachmentSize:CGSizeMake(20, 20) alignToFont:font alignment:YYTextVerticalAlignmentCenter];
    [likeUsers appendAttributedString: attachment];
    
    // 嵌入点赞用户名
    NSMutableAttributedString *names = [NSMutableAttributedString new];

    for (int i = 0; i < self.users.count; i++) {
        NSMutableAttributedString *name = [[NSMutableAttributedString alloc]initWithString:[NSString stringWithFormat:@"%@",self.users[i]]];
        name.font = [UIFont systemFontOfSize:15];
        name.color = [UIColor colorWithHexString:@"0x2bd192"];
        
        YYTextBorder *border = [YYTextBorder new];
        //border.cornerRadius = 3;
        //border.insets = UIEdgeInsetsMake(0, 0, 0, 0);
        border.fillColor = [UIColor colorWithWhite:0.000 alpha:0.220];
        
        YYTextHighlight *highlight = [YYTextHighlight new];
        [highlight setBorder:border];
        highlight.tapAction = ^(UIView *containerView, NSAttributedString *text, NSRange range, CGRect rect) {
            NSLog(@"name tapAction");
        };
        [name setTextHighlight:highlight range:name.rangeOfAll];
        
        [names appendAttributedString:name];
        
        if (i != self.users.count -1) {
            [names appendAttributedString:[[NSAttributedString alloc]initWithString:@"  ,   "]];
        }
    }
    [likeUsers appendAttributedString:names];
    
    return likeUsers.copy;
}

@end

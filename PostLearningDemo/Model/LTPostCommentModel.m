//
//  LTPostCommentModel.m
//  OhShock
//
//  Created by Lintao.Yu on 1/10/16.
//  Copyright © 2016 Lintao Yu. All rights reserved.
//

#import "LTPostCommentModel.h"
#import "UIColor+expanded.h"

@implementation LTPostCommentModel

- (instancetype)initWithComment:(LTModelPostComment *)comment{
    if (self = [super init]) {
        _comment = comment;
        NSMutableParagraphStyle *style = [NSMutableParagraphStyle new];
        NSMutableAttributedString *text = [NSMutableAttributedString new];
        if (comment.fromUser.userName.length) {
            NSAttributedString *fromUser = [[NSAttributedString alloc] initWithString:comment.fromUser.userName attributes:@{NSFontAttributeName : [UIFont systemFontOfSize:13], NSForegroundColorAttributeName : [UIColor colorWithHexString:@"446889"], NSParagraphStyleAttributeName : style}];
            _fromUserRange = NSMakeRange(0, comment.fromUser.userName.length);
            [text appendAttributedString:fromUser];
        }
        if (self.comment.toUser.userName.length) {
            NSAttributedString *returnKey = [[NSAttributedString alloc] initWithString:@"回复" attributes:@{NSFontAttributeName : [UIFont systemFontOfSize:13], NSForegroundColorAttributeName : [UIColor colorWithHexString:@"333333"], NSParagraphStyleAttributeName : style}];
            [text appendAttributedString:returnKey];
            
            NSAttributedString *toUser = [[NSAttributedString alloc] initWithString:comment.toUser.userName attributes:@{NSFontAttributeName : [UIFont systemFontOfSize:13], NSForegroundColorAttributeName : [UIColor colorWithHexString:@"446889"], NSParagraphStyleAttributeName : style}];
            _toUserRange = NSMakeRange(self.fromUserRange.length + 2, comment.toUser.userName.length);
            [text appendAttributedString:toUser];
        }
        if (comment.content.length) {
            [text appendAttributedString:[[NSAttributedString alloc] initWithString:[NSString stringWithFormat:@":%@",comment.content] attributes:@{NSFontAttributeName : [UIFont systemFontOfSize:13], NSForegroundColorAttributeName : [UIColor colorWithHexString:@"333333"], NSParagraphStyleAttributeName : style}]];
        }
        _text = text;
    }
    return self;
}
@end

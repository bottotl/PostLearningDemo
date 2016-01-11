//
//  LTPostCommentView.m
//  OhShock
//
//  Created by Lintao.Yu on 1/10/16.
//  Copyright © 2016 Lintao Yu. All rights reserved.
//

#import "LTPostCommentView.h"
#import "LTPostCommentCell.h"

@interface LTPostCommentView ()<UITableViewDataSource, UITableViewDelegate>

@property (nonatomic, strong) UITableView *tableView;

@end

@implementation LTPostCommentView
#pragma mark - Init
- (instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        _tableView = [[UITableView alloc] initWithFrame:CGRectZero style:UITableViewStylePlain];
        _tableView.backgroundColor = [UIColor clearColor];
        _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
        _tableView.scrollEnabled = NO;
        _tableView.delegate = self;
        _tableView.dataSource = self;
        [self addSubview:_tableView];
        
        [_tableView registerClass:[LTPostCommentCell class] forCellReuseIdentifier:LTPostCommentCellIdentifier];
    }
    return self;
}

#pragma mark - property
-(void)setComments:(NSArray *)comments{
    _comments = comments;
    [self resetTabelView];
}

#pragma mark - reset table view 
- (void)resetTabelView{
    [self.tableView reloadData];
}

#pragma mark - Layout
- (void)layoutSubviews{
    [super layoutSubviews];
    
    CGRect targetRect = self.bounds;
    targetRect.origin.y = [[self class] topSpace];
    self.tableView.frame = targetRect;
}


- (CGSize)sizeThatFits:(CGSize)size{
    size.height = [[self class]suggestHeightWithComments:self.comments andLimit:self.limit andFold:self.fold withWidth:size.width];
    return size;
}

#pragma mark - TableViewDataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    NSInteger count =  self.fold?MIN(self.comments.count, self.limit):self.comments.count;
    //if (self.limit < self.comments.count) count++;
    return count;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    LTPostCommentCell *cell = [tableView dequeueReusableCellWithIdentifier:LTPostCommentCellIdentifier forIndexPath:indexPath];
    
    LTModelPostComment *model = self.comments[indexPath.row];
    LTPostCommentModel *comment = [[LTPostCommentModel alloc]initWithComment:model];
    
    [cell configCellWithAttributedString:comment.text];
    return cell;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    /**
     *  每次读取的数据和需要填充给 Cell 的数据不一样，所以要做一个转换
     */
    LTModelPostComment *model = self.comments[indexPath.row];
    LTPostCommentModel *comment = [[LTPostCommentModel alloc]initWithComment:model];
    return [LTPostCommentCell heightWithAttributedString:comment.text andWidth:[UIScreen mainScreen].bounds.size.width];
}
#pragma mark - 计算高度
+ (CGFloat)suggestHeightWithComments:(NSArray *)comments andLimit:(NSInteger)limit andFold:(BOOL)fold withWidth:(CGFloat)width{
    CGFloat height = 0;
    if (fold) {
        for (NSInteger index = 0; index != MIN(limit, comments.count); index++) {
            LTModelPostComment *comment = comments[index];
            LTPostCommentModel *model = [[LTPostCommentModel alloc] initWithComment:comment];
            height += [LTPostCommentCell heightWithAttributedString:model.text andWidth:width];
        }
    } else {
        for (NSInteger index = 0; index != comments.count; index++) {
            LTModelPostComment *comment = comments[index];
            LTPostCommentModel *model = [[LTPostCommentModel alloc] initWithComment:comment];
            height += [LTPostCommentCell heightWithAttributedString:model.text andWidth:width];
        }
    }
//    if (limit < comments.count) {
//        height += 30;
//    }
    return height + [self topSpace];
}
/// 距离评论栏的间隙
+ (CGFloat)topSpace{
    return 0;
}

@end

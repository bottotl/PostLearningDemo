//
//  LTPostListViewController.m
//  OhShock
//
//  Created by Lintao.Yu on 15/12/30.
//  Copyright © 2015年 Lintao Yu. All rights reserved.
//

#import "LTPostListViewController.h"
#import "LTPostViewCell.h"
#import "LTPostModel.h"
#import "YYKit.h"


@interface LTPostListViewController ()<UITableViewDelegate, UITableViewDataSource>

@property (nonatomic, strong) UITableView *tableView;

/// @[<LTPostModel *>]
@property (nonatomic, strong) NSArray *posts;

/// @[< NSNumber *>]
@property (nonatomic, strong) NSArray *heights;

@end

@implementation LTPostListViewController

#pragma mark - View Life Cycle
- (void)viewDidLoad {
    [super viewDidLoad];

    self.posts = [NSArray new];
    self.heights = [NSArray new];
    
    [self makeArray];
    
    
    _tableView = [UITableView new];
    _tableView.delegate = self;
    _tableView.dataSource = self;
    [self.view addSubview:_tableView];
    
    _tableView.frame = self.view.bounds;
    [_tableView registerClass:[LTPostViewCell class] forCellReuseIdentifier:LTPostViewCellIdentifier];
    
}
#pragma mark - 数据
/// 更新数据
- (void)makeArray{
    /**
     *  暂时用的都是自己模拟的假数据，这里最好创建一个异步线程负责去读取网络数据
     */
    LTPostModel *mode = [LTPostModel new];
    
    LTPostProfileModel *profileData = [LTPostProfileModel new];
    LTPostContentModel *contentData = [LTPostContentModel new];
    
    profileData.avatarUrl = @"http://ww4.sinaimg.cn/mw690/6b5f103fjw8em2xe1lm4wj20qm0qnadp.jpg";
    profileData.name = @"jft0m";
    NSMutableAttributedString *content = [[NSMutableAttributedString alloc]initWithString:@"追求别人，我不知道最好的办法，但我知道哪些办法是与幸福生活背道而驰的。时间宝贵，不要浪费，所谓浪费时间，不是你追了但是没有追到，在追求的过程中发现自己的弱点，控制他或者接受他，都是自己的一种成长，不是浪费。所谓浪费，是你在错误的追求方法上反复用力，还期待得到一个圆满的结果，在得不到没有接受的坦荡，反而充满了被亏钱的郁闷和怨恨。"];
    content.font = [UIFont systemFontOfSize:15];
    contentData.content = content.copy;
    
    LTPostImageModel *postImageData = [LTPostImageModel new];
    postImageData.smallUrlString = @"http://ww3.sinaimg.cn/mw690/6b5f103fjw8ezoov1yvggj20p00p0q59.jpg";
    postImageData.bigUrlString = @"http://ww4.sinaimg.cn/mw690/6b5f103fjw8em2xe1lm4wj20qm0qnadp.jpg";
    NSMutableArray *tempPostImagesData = @[].mutableCopy;
    for (int i = 0; i < 9; i++) {
        [tempPostImagesData addObject:postImageData];
    }
    NSArray *postImagesData = tempPostImagesData.copy;
    
    
    LTPostLikedModel *likedMode = [LTPostLikedModel new];
    NSMutableArray *tempUsersName = @[].mutableCopy;
    for (int i = 0; i< 60 ; i++) {
        [tempUsersName addObject:[NSString stringWithFormat:@"用户%d",i]];
    }
    likedMode.users = tempUsersName.copy;
    
    
    NSMutableArray *comments = [NSMutableArray new];
    for (int i = 0 ; i < 10; i++) {
        LTModelPostComment *model =[LTModelPostComment new];
        model.content = @"追求别人，我不知道最好的办法，但我知道哪些办法是与幸福生活背道而驰的。";
        model.fromUser = [LTUser new];
        //model.fromUser.userId = 1;
        model.fromUser.userName = @"Bottotl";
        model.toUser = [LTUser new];
        model.toUser.userName = @"jft0m";
        //model.toUser
        [comments addObject:model];
    }
    
    mode.likedData = likedMode;
    mode.profileData = profileData;
    mode.contentData = contentData;
    mode.pic = postImagesData.copy;
    mode.comments = comments.copy;
    
    
    NSMutableArray *tempDataSource = @[].mutableCopy;
    for (int i = 0; i < 60; i++) {
        [tempDataSource addObject:mode];
    }
    
    
    NSMutableArray *heights = @[].mutableCopy;
    for (LTPostModel *model in tempDataSource) {
        [heights addObject:@([LTPostView viewHeightWithData:model])];
    }
    
    self.posts = tempDataSource.copy;
    self.heights = heights.copy;
    
}

#pragma mark - table view data source

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.posts.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    LTPostViewCell *cell = [tableView dequeueReusableCellWithIdentifier:LTPostViewCellIdentifier forIndexPath:indexPath];
    [cell configCellWithData:self.posts[indexPath.row]];
    [cell setNeedsLayout];
    [cell layoutIfNeeded];
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return ((NSNumber *)_heights[indexPath.row]).floatValue;
}

- (BOOL)tableView:(UITableView *)tableView shouldHighlightRowAtIndexPath:(NSIndexPath *)indexPath {
    return NO;
}


@end

//
//  GPCommunityDetailContentTableController.m
//  公平矿业
//
//  Created by apple on 16/6/11.
//  Copyright © 2016年 xiaoAn. All rights reserved.
//

#import "GPCommunityDetailContentTableController.h"

#import "UIBarButtonItem+Item.h"

#import "GPPublishTopicController.h"

#import "GPReolayController.h"
@interface GPCommunityDetailContentTableController ()

@property (nonatomic,strong)UIView * headerView;

@end

@implementation GPCommunityDetailContentTableController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.navigationItem.title = _titleName;
//    self.navigationItem.rightBarButtonItem = [UIBarButtonItem barButtonItemWithTitle:@"发布话题" target:self action:@selector(publishTopic) forControlEvents:UIControlEventTouchUpInside];
    
    [self addHeaderView];
}

-(void)publishTopic{
    GPPublishTopicController * vc = [[GPPublishTopicController alloc]init];
    [self.navigationController pushViewController:vc animated:YES];
}

#pragma mark 添加头部视图
-(void)addHeaderView{
    _headerView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_W, 120)];
    UIImageView * imageView = [[UIImageView alloc]initWithFrame:CGRectMake(20, 20, 80, 80)];
    imageView.image = [UIImage imageNamed:@"login_head.png"];
    
    UILabel * label = [[UILabel alloc]initWithFrame:CGRectMake(120, 20, SCREEN_W - 120, 20)];
    label.text = _titleName;
    
    UILabel * labelRe = [[UILabel alloc]initWithFrame:CGRectMake(120, 70, 60, 20)];
    labelRe.text = @"dds";
    
    UILabel * labelTopic = [[UILabel alloc]initWithFrame:CGRectMake(190, 70, 60, 20)];
    labelTopic.text = @"dds";
    
    UILabel * labelNum = [[UILabel alloc]initWithFrame:CGRectMake(260, 70, SCREEN_W - 260, 20)];
    labelNum.text = @"dds";
    
    UIButton * btn = [[UIButton alloc]initWithFrame:CGRectMake(SCREEN_W-60, 20, 40, 30)];
    [btn setTitle:@"回复" forState:UIControlStateNormal];
    [btn addTarget:self action:@selector(replay) forControlEvents:UIControlEventTouchUpInside];
    [_headerView addSubview:btn];
    btn.backgroundColor = [UIColor orangeColor];
    
    
    
    self.tableView.tableHeaderView = _headerView;
    [_headerView addSubview:imageView];
    [_headerView addSubview:label];
    [_headerView addSubview:labelRe];
    [_headerView addSubview:labelTopic];
    [_headerView addSubview:labelNum];
}

-(void)replay{
    GPReolayController * vc = [[GPReolayController alloc]init];
    [self.navigationController pushViewController:vc animated:YES];
}
#pragma mark - Table view data source


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    return 10;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString * id = @"cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:id ];
    if (cell == nil) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:id];
        
    }
    cell.textLabel.text = @"帖子";
    return cell;
}



@end

//
//  GPCaptainContentDeleteController.m
//  公平矿业
//
//  Created by apple on 16/6/17.
//  Copyright © 2016年 xiaoAn. All rights reserved.
//

#import "GPCaptainContentDeleteController.h"
#import "GPInvientNumberTableViewCell.h"
@interface GPCaptainContentDeleteController ()
@property (nonatomic,strong)UIView * headerView;

@end

@implementation GPCaptainContentDeleteController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
   
    [self initDate];
    [self addHeaderView];
    
    // 添加下拉刷新控件
    //    [self.tableView addHeaderWithTarget:self action:@selector(loadNewStatus)];
    //
    //    // 自动下拉刷新
    //    [self.tableView headerBeginRefreshing];
    //
    //    // 添加上拉刷新控件
    //    [self.tableView addFooterWithTarget:self action:@selector(loadMoreStatus)];
    
}


-(void)initDate{
    
    
    
}

#pragma mark 添加头部视图
-(void)addHeaderView{
    _headerView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_W, 120)];
    UIImageView * imageView = [[UIImageView alloc]initWithFrame:CGRectMake(20, 20, 80, 80)];
    imageView.image = [UIImage imageNamed:@"login_head.png"];
    
    UILabel * label = [[UILabel alloc]initWithFrame:CGRectMake(120, 20, SCREEN_W - 120, 20)];
    
    
    UILabel * labelRe = [[UILabel alloc]initWithFrame:CGRectMake(120, 70, 60, 20)];
    labelRe.text = @"dds";
    
    UILabel * labelTopic = [[UILabel alloc]initWithFrame:CGRectMake(190, 70, 60, 20)];
    labelTopic.text = @"dds";
    
    UILabel * labelNum = [[UILabel alloc]initWithFrame:CGRectMake(260, 70, SCREEN_W - 260, 20)];
    labelNum.text = @"dds";
    
    self.tableView.tableHeaderView = _headerView;
    [_headerView addSubview:imageView];
    [_headerView addSubview:label];
    [_headerView addSubview:labelRe];
    [_headerView addSubview:labelTopic];
    [_headerView addSubview:labelNum];
}

#pragma mark - Table view data source


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    //return _communityFrames.count;
    return 10;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    static NSString * id = @"cell";
    GPInvientNumberTableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:id];
    cell = [[GPInvientNumberTableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:id];
    cell.addressLabel.text = @"李四";
    [cell.addressLabel sizeToFit];
    return cell;
}

// 返回cell的高度
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    // 获取community模型
    //    GPCommunitViewFrame *commF = self.communityFrames[indexPath.row];
    //    return commF.cellHeight;
    return 40;
}

-(void)tableView:(UITableView *)tableView didDeselectRowAtIndexPath:(NSIndexPath *)indexPath{
//    GPLog(@"---");
//    GPCommunityDetailContentTableController * vc = [[GPCommunityDetailContentTableController alloc]init];
//    [self.navigationController pushViewController:vc animated:YES];
}

@end

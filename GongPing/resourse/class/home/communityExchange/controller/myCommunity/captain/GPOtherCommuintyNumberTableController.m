//
//  GPOtherCommuintyNumberTableController.m
//  公平矿业
//
//  Created by apple on 16/6/15.
//  Copyright © 2016年 xiaoAn. All rights reserved.
//

#import "GPOtherCommuintyNumberTableController.h"
#import "UIBarButtonItem+Item.h"
#import "GPInvientNumberTableViewCell.h"
@interface GPOtherCommuintyNumberTableController ()

@property (nonatomic,strong)UIView * headerView;
@property (nonatomic, strong) NSArray *communityFrames;

@end

@implementation GPOtherCommuintyNumberTableController

- (NSArray *)communityFrames
{
    if (_communityFrames == nil) {
        _communityFrames = [NSArray array];
    }
    return _communityFrames;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.navigationItem.title = @"其他社区成员";

    [self initDate];
    [self addHeaderView];
    
}

-(void)publishTopic{
    

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
    UIButton * btn = [[UIButton alloc]initWithFrame:CGRectMake(SCREEN_W-100, 20, 80, 30)];
    [btn setTitle:@"发送邀请" forState:UIControlStateNormal];
    [btn addTarget:self action:@selector(invite) forControlEvents:UIControlEventTouchUpInside];
    [_headerView addSubview:btn];
    btn.backgroundColor = [UIColor orangeColor];
    self.tableView.tableHeaderView = _headerView;
    [_headerView addSubview:imageView];
    [_headerView addSubview:label];
    [_headerView addSubview:labelRe];
    [_headerView addSubview:labelTopic];
    [_headerView addSubview:labelNum];
}

-(void)invite{
    GPLog(@"111");
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

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    GPInvientNumberTableViewCell * cell = (GPInvientNumberTableViewCell*)[tableView cellForRowAtIndexPath:indexPath];
    cell.imgView.image = [UIImage imageNamed:@"xuanzhong.png"];
}




// 返回cell的高度
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 40;
}



@end

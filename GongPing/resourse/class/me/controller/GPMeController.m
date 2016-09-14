//
//  GPMeController.m
//  公平矿业
//
//  Created by apple on 16/6/1.
//  Copyright © 2016年 xiaoAn. All rights reserved.
//

#import "GPMeController.h"



#define CellFooterheight 70
#define HeadrCardColor [UIColor colorWithRed:0 green:0 blue:0 alpha:0.2]
#define JDColor(r,g,b) [UIColor colorWithRed:(r)/255.0 green:(g)/255.0 blue:(b)/255.0 alpha:1.0]
#define SCREEN_WIDTH self.view.bounds.size.width
#define SCREEN_HEIGHT self.view.bounds.size.height
@interface GPMeController ()<UITableViewDataSource,UITableViewDelegate>{
    UIScrollView * _scrollView;
    NSMutableArray *_myArray;//模型
    
}


@end

@implementation GPMeController

-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    //判断是否登录
    if ([TMStatusUtility isUserLogin]) {
        
        Member *memberInfo = [[Member allObjects] objectAtIndex:0];
        
        NSLog(@"您已经登录了%@",memberInfo.userId);
        NSString *imageStr = [NSString stringWithFormat:@"aaa%@",memberInfo.phoneNumber];
        
        _unLoginBtnBg.imageView.image = [UIImage imageNamed:imageStr];
        
        [_userPhone setTitle:memberInfo.phoneNumber forState:UIControlStateNormal];
        _userPhone.enabled = YES;
    }
    else{
        
        _unLoginBtnBg.imageView.image = [UIImage imageNamed:@"unlogin_head_n"];
        _userPhone.enabled = NO;
}
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor=[UIColor groupTableViewBackgroundColor];
     //创建头部
    self.tableView.tableHeaderView=[self headerView];
 

    
}

#pragma mark 添加头部

//未登录按钮光圈
-(BTRippleButtton *)unLoginBtnBg
{
    if (!_unLoginBtnBg) {
        
        _unLoginBtnBg = [[BTRippleButtton alloc]initWithFrame:CGRectMake( SCREEN_WIDTH/2-90/2, 20, 90, 90) onCompletion:^(BOOL success) {
             [self showLoginView];
        }];
    
        
        [_unLoginBtnBg setRippeEffectEnabled:NO];
    }
    return _unLoginBtnBg;
}
//浪起来
- (JSWave *)headerView{
    
    if (!_headerView) {
        _headerView = [[JSWave alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, 130)];
        _headerView.backgroundColor = XNColor(248, 64, 87, 1);
        [_headerView addSubview:self.unLoginBtnBg];
        
        _userPhone = [UIButton buttonWithType:UIButtonTypeCustom];
        _userPhone.frame = CGRectMake(0, _unLoginBtnBg.frame.origin.y-10, SCREEN_WIDTH, 25);
        _userPhone.titleLabel.textAlignment = NSTextAlignmentCenter;
        [_userPhone setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        [_userPhone addTarget:self action:@selector(phoneNumberClick) forControlEvents:UIControlEventTouchUpInside];
        [_headerView addSubview:_userPhone];
        
        __weak typeof(self)weakSelf = self;
        _headerView.waveBlock = ^(CGFloat currentY){
            CGRect iconFrame = [weakSelf.unLoginBtnBg frame];
            iconFrame.origin.y = CGRectGetHeight(weakSelf.headerView.frame)-CGRectGetHeight(weakSelf.unLoginBtnBg.frame)+currentY-weakSelf.headerView.waveHeight;
            weakSelf.unLoginBtnBg.frame  =iconFrame;
        };
        [_headerView startWaveAnimation];
    }
    return _headerView;
}
-(void)phoneNumberClick
{
    NSLog(@"您点击了电话号码按钮");
    
}

-(void)showLoginView{
    
    LoginViewController *loginVC = [[LoginViewController alloc]init];
    [self.navigationController pushViewController:loginVC animated:YES];
    
}

#pragma mark 设置离头部的距离
- ( CGFloat )tableView:( UITableView *)tableView heightForHeaderInSection:( NSInteger )section
{
    return 25 ;
}

#pragma mark - 数据源方法
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 8;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIndentifier = @"Metableview";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIndentifier];
    cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIndentifier ];
    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    cell.backgroundColor=[UIColor whiteColor];
    
    //创建label和image
    UILabel *celllable=[[UILabel alloc]init];
    UIImageView *cellimg=[[UIImageView alloc]init];
    celllable.frame=CGRectMake(40, 10, 300, 20);
    celllable.font=[UIFont systemFontOfSize:14];
    [cell addSubview:celllable];
    cellimg.frame=CGRectMake(10, 10, 20, 20);
    [cell addSubview:cellimg];
    if(indexPath.row==0){
        cellimg.image = [UIImage imageNamed:@"me_conment"];
        NSString *hycount=@"我的发布";
        celllable.text = hycount;
    }else if (indexPath.row == 1){
        cellimg.image = [UIImage imageNamed:@"me_conment"];
        NSString *hycount=@"我的商城";
        celllable.text = hycount;
    }
    else if (indexPath.row == 2){
        cellimg.image = [UIImage imageNamed:@"me_conment"];
        NSString *hycount=@"我的交流";
        celllable.text = hycount;
    }
    else if (indexPath.row == 3){
        cellimg.image = [UIImage imageNamed:@"me_conment"];
        NSString *hycount=@"个人信息";
        celllable.text = hycount;
    }
    else if (indexPath.row == 4){
        cellimg.image = [UIImage imageNamed:@"me_conment"];
        NSString *hycount=@"我的社区";
        celllable.text = hycount;
    }
    else if (indexPath.row == 5){
        cellimg.image = [UIImage imageNamed:@"me_conment"];
        NSString *hycount=@"我的消息";
        celllable.text = hycount;
    }
    else if (indexPath.row == 6){
        cellimg.image = [UIImage imageNamed:@"me_conment"];
        NSString *hycount=@"我的留言";
        celllable.text = hycount;
    }else if (indexPath.row == 7){
        cellimg.image = [UIImage imageNamed:@"me_conment"];
        NSString *hycount=@"我的产品";
        celllable.text = hycount;
    }
    return cell;
}
#pragma mark - tableView 代理方法
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    if(indexPath.row==0){
    LZPageViewController *pageVc = [[LZPageViewController alloc] initWithTitles:@[@"咨询发布",@"产品发布"] controllersClass:@[[GPMineNewsInfoController class],[GPMinePublishController class],] title:@"我的发布" WithFrame:CGRectMake (0,40,SCREEN_WIDTH,SCREEN_HEIGHT - 104)view:nil];
        [self controllerWithClass:pageVc];
    }else if (indexPath.row == 1){
        
        GPMyMallController * vc = [[GPMyMallController alloc]init];
        [self controllerWithClass:vc];
    }
    else if (indexPath.row == 2){
        LZPageViewController *pageVc = [[LZPageViewController alloc] initWithTitles:@[@"矿长社区",@"矿工社区"] controllersClass:@[[GPMineCommunityLeaderController class],[GPMineCommuintyNumberController class]] title:@"我的交流" WithFrame:CGRectMake (0,40,SCREEN_WIDTH,SCREEN_HEIGHT - 104)view:nil];
        [self.navigationController pushViewController:pageVc animated:YES];
        
    }
    else if (indexPath.row == 3){
        GPPersonalInfoController * vc = [[GPPersonalInfoController alloc]init];
        [self controllerWithClass:vc];
    }
    else if (indexPath.row == 4){
        LZPageViewController *pageVc = [[LZPageViewController alloc] initWithTitles:@[@"矿长社区",@"旷工社区"] controllersClass:@[[GPMyCaptainCommunionController class],[GPMineMemberController class],] title:@"我的社区" WithFrame:CGRectMake (0,40,SCREEN_WIDTH,SCREEN_HEIGHT - 104)view:nil];
        [self controllerWithClass:pageVc];
    }
    else if (indexPath.row == 5){
        GPMyMessageTableController * vc = [[GPMyMessageTableController alloc]init];
        [self controllerWithClass:vc];
    }
    else if (indexPath.row == 6){
        LZPageViewController *pageVc = [[LZPageViewController alloc] initWithTitles:@[@"我发出的留言",@"我收到的留言"] controllersClass:@[[GPMySentTableController class],[ GPMyReceivedTableController class],] title:@"我的留言" WithFrame:CGRectMake (0,40,SCREEN_WIDTH,SCREEN_HEIGHT - 104)view:nil];
        [self controllerWithClass:pageVc];
    }else if (indexPath.row == 7){
        GPproductCategaryController * vc = [[GPproductCategaryController alloc]init];
        [self controllerWithClass:vc];
    }

}

-(void)controllerWithClass:(UIViewController*)vc {
    
    [self.navigationController pushViewController:vc animated:YES];
}

@end

//
//  GPPersonalInfoController.m
//  工平矿业
//
//  Created by apple on 16/6/9.
//  Copyright © 2016年 xiaoAn. All rights reserved.
//

#import "GPPersonalInfoController.h"

#import "GPLabel.h"

#import "UIBarButtonItem+Item.h"

#import "changePasswordVC.h"
@interface GPPersonalInfoController ()

@end

@implementation GPPersonalInfoController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.title = @"我的会员信息";
    self.view.backgroundColor = [UIColor groupTableViewBackgroundColor];
    UIBarButtonItem * right = [UIBarButtonItem barButtonItemWithTitle:@"修改密码" target:self action:@selector(changePsd) forControlEvents:UIControlEventTouchUpInside];
    self.navigationItem.rightBarButtonItem = right;
    
    
    [self buildUI];
}

-(void)buildUI{
    UIImageView * imageView = [[UIImageView alloc]initWithFrame:CGRectMake(0, 64,SCREEN_W , 150)];
    UIButton * btn = [[UIButton alloc]initWithFrame:CGRectMake((SCREEN_W -80)/2, 30, 80, 80)];
    imageView.image = [UIImage imageNamed:@"my_unlogin_bg.png"];
    [imageView addSubview:btn];
    [btn setBackgroundImage:[UIImage imageNamed:@"my_head_default"] forState:UIControlStateNormal];
    [self.view addSubview:imageView];
    
    
    UILabel * accuntLabel = [UILabel labelWithName:@"注册帐号" WithFrame:CGRectMake(10, 224, 80, 20) Font:14];
    
    UILabel * accuntLabelContent = [UILabel labelWithName:@"18668956587897" WithFrame:CGRectMake(100, 224, 200, 20) Font:14];
    
    
    UILabel * nameLabel = [UILabel labelWithName:@"商城名字" WithFrame:CGRectMake(10, 254, 80, 20) Font:14];
    
    UILabel * nameLabelContent = [UILabel labelWithName:@"superAn" WithFrame:CGRectMake(100, 254, 200, 20) Font:14];
    
    UILabel * infoLabel = [UILabel labelWithName:@"商城简介" WithFrame:CGRectMake(10, 280,SCREEN_W - 20 , 20) Font:14];
    
    UILabel * infoLabelContent = [UILabel labelWithName:@"熙元科技" WithFrame:CGRectMake(10, 314, SCREEN_W - 20, 60) Font:14];
    infoLabelContent.numberOfLines = 0;
    [infoLabelContent sizeToFit];
    
    [self.view addSubview:accuntLabel];
    [self.view addSubview:accuntLabelContent];
    [self.view addSubview:nameLabel];
    [self.view addSubview:nameLabelContent];
    [self.view addSubview:infoLabel];
    [self.view addSubview:infoLabelContent];
    
}


#pragma mark 修改密码
-(void)changePsd{
    changePasswordVC * vc = [[changePasswordVC alloc]init];
    [self.navigationController pushViewController:vc animated:YES];
}

@end

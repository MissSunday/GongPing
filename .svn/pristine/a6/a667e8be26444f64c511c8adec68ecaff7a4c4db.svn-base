//
//  GPMinePublishController.m
//  工平矿业
//
//  Created by apple on 16/6/10.
//  Copyright © 2016年 xiaoAn. All rights reserved.
//

#import "GPMinePublishController.h"

#import "GPMinePublishTableViewCell.h"

#import "GPNewsSendController.h"
@interface GPMinePublishController ()<UITableViewDataSource,UITableViewDelegate>
{
    
    UIButton * _doneBtn;
    UIButton * _statueBtn;
    UIButton * _layerBtn;
    UITableView * _tableView;
}
@end

@implementation GPMinePublishController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor groupTableViewBackgroundColor];
    
    UIButton *infoBtn=[[UIButton alloc]initWithFrame:CGRectMake(0, 0, SCREEN_W/3, 40)];
    [infoBtn setTitle:@"已发布" forState:UIControlStateNormal];
    [infoBtn setBackgroundColor:[UIColor colorWithRed:32 / 255.0 green:34 / 255.0 blue:47/ 255.0 alpha:1]];
    
    [infoBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [infoBtn addTarget:self action:@selector(newInfo) forControlEvents:UIControlEventTouchUpInside];
    _doneBtn=infoBtn;
    [self.view addSubview:_doneBtn];
    
    UIButton *proBtn=[[UIButton alloc]initWithFrame:CGRectMake(SCREEN_W/3, 0, SCREEN_W/3, 40)];
    [proBtn setTitle:@"待审核" forState:UIControlStateNormal];
    [proBtn setBackgroundColor:[UIColor blackColor]];
    [proBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [proBtn addTarget:self action:@selector(productInfo) forControlEvents:UIControlEventTouchUpInside];
    _statueBtn=proBtn;
    [self.view addSubview:_statueBtn];
    
    UIButton *Btn=[[UIButton alloc]initWithFrame:CGRectMake( 2*SCREEN_W/3, 0, SCREEN_W/3, 40)];
    [Btn setTitle:@"违规" forState:UIControlStateNormal];
    [Btn setBackgroundColor:[UIColor blackColor]];
    [Btn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [Btn addTarget:self action:@selector(illegal) forControlEvents:UIControlEventTouchUpInside];
    _layerBtn=Btn;
    [self.view addSubview:_layerBtn];
    
    //创建tableView
    _tableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 40, SCREEN_W, SCREEN_H-40) style:UITableViewStylePlain];
    _tableView.delegate = self;
    _tableView.dataSource = self;
    [self.view addSubview:_tableView];
    
}

#pragma mark 咨询信息
-(void)newInfo{
    
    [_doneBtn setBackgroundColor:[UIColor colorWithRed:32 / 255.0 green:34 / 255.0 blue:47/ 255.0 alpha:1]];
    [_statueBtn setBackgroundColor:[UIColor blackColor]];
    [_layerBtn setBackgroundColor:[UIColor blackColor]];
}

#pragma mark 产品信息
-(void)productInfo{
    
    [_statueBtn setBackgroundColor:[UIColor colorWithRed:32 / 255.0 green:34 / 255.0 blue:47/ 255.0 alpha:1]];
    [_doneBtn setBackgroundColor:[UIColor blackColor]];
    [_layerBtn setBackgroundColor:[UIColor blackColor]];
    
}

#pragma mark 违规
-(void)illegal{
    [_layerBtn setBackgroundColor:[UIColor colorWithRed:32 / 255.0 green:34 / 255.0 blue:47/ 255.0 alpha:1]];
    [_statueBtn setBackgroundColor:[UIColor blackColor]];
    [_doneBtn  setBackgroundColor:[UIColor blackColor]];
}


#pragma mark --- tableView dataSoure/delegate

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 2;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    
    
    GPMinePublishTableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:[GPMinePublishTableViewCell ID]];
    if (cell == nil) {
        cell = [GPMinePublishTableViewCell deatilCell];
    }
    [cell.edit addTarget:self action:@selector(edit) forControlEvents:UIControlEventTouchUpInside];
    [cell.deleteBtn addTarget:self action:@selector(delete) forControlEvents:UIControlEventTouchUpInside];
    return cell;
    
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    return [GPMinePublishTableViewCell cellHeight];;
    
}
//编辑
-(void)edit{
    GPNewsSendController * vc = [[GPNewsSendController alloc]init];
    [self.navigationController pushViewController:vc animated:YES];
}

//删除
-(void)delete{
    GPLog(@"删除");
}

@end

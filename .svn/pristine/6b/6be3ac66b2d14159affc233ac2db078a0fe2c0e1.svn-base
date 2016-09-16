//
//  GPMyMessageTableController.m
//  工平矿业
//
//  Created by apple on 16/6/10.
//  Copyright © 2016年 xiaoAn. All rights reserved.
//

#import "GPMyMessageTableController.h"
#import "GPMyMessageTableCell.h"
@interface GPMyMessageTableController ()

@end

@implementation GPMyMessageTableController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.navigationItem.title = @"我的消息";
}


#pragma mark - Table view data source


#pragma mark --- tableView dataSoure/delegate

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 20;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    
    
    GPMyMessageTableCell * cell = [tableView dequeueReusableCellWithIdentifier:[GPMyMessageTableCell ID]];
    if (cell == nil) {
        cell = [GPMyMessageTableCell deatilCell];
    }
    [cell.agreeBtn addTarget:self action:@selector(agree) forControlEvents:UIControlEventTouchUpInside];
    [cell.refuseBtn addTarget:self action:@selector(refuse) forControlEvents:UIControlEventTouchUpInside];
    return cell;
    
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    return [GPMyMessageTableCell cellHeight];;
    
}
//编辑
-(void)agree{
    GPLog(@"同意");
}

//删除
-(void)refuse{
    GPLog(@"refuse");
}


@end

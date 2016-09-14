//
//  GPMyReceivedTableController.m
//  公平矿业
//
//  Created by apple on 16/6/10.
//  Copyright © 2016年 xiaoAn. All rights reserved.
//

#import "GPMyReceivedTableController.h"
#import "GPReceiveTableCell.h"

#import "GPMyReceiveDetailTableController.h"
@interface GPMyReceivedTableController ()

@end

@implementation GPMyReceivedTableController

- (void)viewDidLoad {
    [super viewDidLoad];
    
}


#pragma mark - Table view data source


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    return 10;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    GPReceiveTableCell *cell = [tableView dequeueReusableCellWithIdentifier:[GPReceiveTableCell ID]];
    if (cell == nil) {
        cell = [GPReceiveTableCell deatilCell];
    }
    [cell.receivedMessageBtn addTarget:self action:@selector(receivedMessage) forControlEvents:UIControlEventTouchUpInside];
    
    return cell;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    return [GPReceiveTableCell cellHeight];;
    
}

-(void)receivedMessage{
    GPMyReceiveDetailTableController * vc = [[GPMyReceiveDetailTableController alloc]init];
    [self.navigationController pushViewController:vc animated:YES];
    
    GPLog(@"接收到信息");
}

@end

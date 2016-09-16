//
//  GPMySentTableController.m
//  工平矿业
//
//  Created by apple on 16/6/10.
//  Copyright © 2016年 xiaoAn. All rights reserved.
//

#import "GPMySentTableController.h"
#import "GPSendMessageTableCell.h"
#import "GPNoteAndReceiveTableController.h"
@interface GPMySentTableController ()

@end

@implementation GPMySentTableController

- (void)viewDidLoad {
    [super viewDidLoad];
   
}


#pragma mark - Table view data source


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    return 10;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    GPSendMessageTableCell *cell = [tableView dequeueReusableCellWithIdentifier:[GPSendMessageTableCell ID]];
    if (cell == nil) {
        cell = [GPSendMessageTableCell deatilCell];
    }
    [cell.sendAndReceiveBtn addTarget:self action:@selector(sendAndReceive) forControlEvents:UIControlEventTouchUpInside];
    
    return cell;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    return [GPSendMessageTableCell cellHeight];;
    
}

-(void)sendAndReceive{
    GPNoteAndReceiveTableController * vc = [[GPNoteAndReceiveTableController alloc]init];
    [self.navigationController pushViewController:vc animated:YES];
    
    GPLog(@"发出的留言及收到的回复");
}

@end

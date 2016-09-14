//
//  GPMyReceiveDetailTableController.m
//  公平矿业
//
//  Created by apple on 16/6/16.
//  Copyright © 2016年 xiaoAn. All rights reserved.
//

#import "GPMyReceiveDetailTableController.h"

@interface GPMyReceiveDetailTableController ()

@end

@implementation GPMyReceiveDetailTableController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.navigationItem.title = @"接收到的效果";
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    //return _dateArr.count;
    return 7;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString * id = @"cell";
    
    UITableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:id];
    if (cell == nil) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:id];
    }
    cell.textLabel.text = @"接收到信息";
    return cell;
}

@end

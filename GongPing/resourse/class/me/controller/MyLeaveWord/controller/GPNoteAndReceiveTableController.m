//
//  GPNoteAndReceiveTableController.m
//  公平矿业
//
//  Created by apple on 16/6/16.
//  Copyright © 2016年 xiaoAn. All rights reserved.
//

#import "GPNoteAndReceiveTableController.h"

@interface GPNoteAndReceiveTableController ()

@end

@implementation GPNoteAndReceiveTableController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.navigationItem.title = @"留言及回复";
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
    cell.textLabel.text = @"发出的留言及收到的回复";
    return cell;
}

@end

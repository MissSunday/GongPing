//
//  GPInviteCommunityController.m
//  工平矿业
//
//  Created by apple on 16/6/15.
//  Copyright © 2016年 xiaoAn. All rights reserved.
//

#import "GPInviteCommunityController.h"
#import "GPOtherCommuintyNumberTableController.h"
@interface GPInviteCommunityController ()

@end

@implementation GPInviteCommunityController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.title = @"其他社区列表";
    
}



- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {

    return 10;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString * id = @"cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:id ];
    
    if (cell == nil) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:id];
    }
    UIImageView * imageViewF = [[UIImageView alloc]initWithFrame:CGRectMake(10, 0, (SCREEN_W - 140)/2, 70)];
    imageViewF.image = [UIImage imageNamed:@"voucherimg"];
    
    [cell addSubview:imageViewF];
    
    UILabel * labelF = [[UILabel alloc]initWithFrame:CGRectMake((SCREEN_W - 40)/2, 20, 170, 100)];
    labelF.text = @"点击进入此社区成员列表";
    
    [cell addSubview:labelF];
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(nonnull NSIndexPath *)indexPath{
    GPOtherCommuintyNumberTableController * vc = [GPOtherCommuintyNumberTableController alloc];
    [self.navigationController pushViewController:vc animated:YES];
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 100;
}


@end

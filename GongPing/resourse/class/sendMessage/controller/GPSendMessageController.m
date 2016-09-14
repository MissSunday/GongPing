//
//  GPSendMessageController.m
//  工平矿业
//
//  Created by apple on 16/6/1.
//  Copyright © 2016年 xiaoAn. All rights reserved.
//

#import "GPSendMessageController.h"
#import "GPNewsSendController.h"
#import "GPSendProductController.h"
@interface GPSendMessageController ()

@end

@implementation GPSendMessageController

#define SCREEN_WIDTH self.view.bounds.size.width
#define SCREEN_HEIGHT self.view.bounds.size.height

- (void)viewDidLoad {
    [super viewDidLoad];
    [self buildUI];
    self.view.backgroundColor = [UIColor groupTableViewBackgroundColor];
}

-(void)buildUI{
    
    NSArray * array = @[@"资讯信息发布",@"产品信息发布"];
    CGFloat margin = 15;
    CGFloat btnW = (SCREEN_WIDTH - 45)/2;
    CGFloat btnY = 80;
    CGFloat marginY = 80;
    for (int i = 0 ; i < 2; i++) {
        UIButton * btn = [[UIButton alloc]init];
        btn.frame = CGRectMake(margin *(i+1)+btnW*i,marginY, btnW, btnY);
        btn.tag = 10000+i;
        btn.backgroundColor = [UIColor yellowColor];
        btn.layer.cornerRadius = 10;
        [btn setTitle:array[i] forState:UIControlStateNormal];
        [btn setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
        [btn addTarget:self action:@selector(jumpToSend:) forControlEvents:UIControlEventTouchUpInside];
        [self.view addSubview:btn];
    }
    
}

-(void)jumpToSend:(UIButton*)sender{
    
    if ([TMStatusUtility isUserLogin]) {
        
        
        if (sender.tag == 10000) {
            GPNewsSendController * vc = [[GPNewsSendController alloc]init];
            [self.navigationController pushViewController:vc animated:YES];
        }else{
            GPSendProductController * vc = [[GPSendProductController alloc]init];
            [self.navigationController pushViewController:vc animated:YES];
        }

        
     
    }
    else{
        
        UIAlertView *alert = [[UIAlertView alloc]initWithTitle:@"您还没有登录" message:@"请登录" delegate:self cancelButtonTitle:@"好的" otherButtonTitles:nil, nil];
        
        [alert show];
        
        
    }

}

@end

//
//  GPtabBarController.m
//  工平矿业
//
//  Created by apple on 16/6/1.
//  Copyright © 2016年 xiaoAn. All rights reserved.
//

#import "GPtabBarController.h"
#import "GPHomeController.h"
#import "GPSendMessageController.h"
#import "GPMeController.h"
#import "GPNaviViewController.h"
#import "ZLCGuidePageView.h"
@interface GPtabBarController ()

@end

@implementation GPtabBarController


- (void)viewDidLoad {
    [super viewDidLoad];
    //[super viewDidLoad];
    if ([self isFirstEnter]) {
        [self goGuide];
    }else{
        [self goMainView];
    }
}
#pragma mark - 是否第一次进入App
-(BOOL)isFirstEnter
{
    NSInteger enterCount = [[NSUserDefaults standardUserDefaults] integerForKey:EnterCount];
    enterCount++;
    [[NSUserDefaults standardUserDefaults]setInteger:enterCount forKey:EnterCount];
    //同步数据,写完这句才能保证数据被保存到本地
    [[NSUserDefaults standardUserDefaults] synchronize];
    if (enterCount == 1) {
        return YES;
    }else{
        return NO;
    }
}
-(void)goGuide
{
    //引导页图片数组
    NSArray *images =  @[[UIImage imageNamed:@"image1.jpg"],[UIImage imageNamed:@"image2.jpg"],[UIImage imageNamed:@"image3.jpg"],[UIImage imageNamed:@"image4.jpg"],[UIImage imageNamed:@"image5.jpg"]];
    //创建引导页视图
    ZLCGuidePageView *pageView = [[ZLCGuidePageView alloc]initWithFrame:self.view.frame WithImages:images];
    [self goMainView];
    [self.view addSubview:pageView];
}
-(void)goMainView
{
    GPHomeController * mainVC = [[GPHomeController alloc]init];
    [self addChildVc:mainVC title:@"首页" image:@"main_gray" selectedImage:@"main_red"];
    
    GPSendMessageController * informationVC = [GPSendMessageController new];
    [self addChildVc:informationVC title:@"发布信息" image:@"public_gray" selectedImage:@"public_red"];
    
    
    GPMeController * meVC = [[GPMeController alloc]init];
    [self addChildVc:meVC title:@"个人中心" image:@"mine_gray" selectedImage:@"mine_red"];
    
    // 2.更换系统自带的tabbar
    [self.navigationController.navigationBar setTitleTextAttributes: @{NSFontAttributeName:[UIFont systemFontOfSize:19], NSForegroundColorAttributeName:[UIColor colorWithRed:0 green:0.7 blue:0.8 alpha:1]}];
}
- (void)addChildVc:(UIViewController *)childVc title:(NSString*)title image:(NSString *)image selectedImage:(NSString *)selectedImage{
    //同时设置tabbar和navigationBar的文字
    childVc.title = title;
    childVc.tabBarItem.image = [UIImage imageNamed:image];
    childVc.tabBarItem.selectedImage = [[UIImage imageNamed:selectedImage]imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    
    
    NSMutableDictionary *textAttrs = [NSMutableDictionary dictionary];
    textAttrs[NSForegroundColorAttributeName] = [UIColor grayColor];
    NSMutableDictionary *selectTextAttrs = [NSMutableDictionary dictionary];
    selectTextAttrs[NSForegroundColorAttributeName] = [UIColor colorWithRed:170 / 255.0 green:92 / 255.0 blue:107/ 255.0 alpha:1];
    [childVc.tabBarItem setTitleTextAttributes:textAttrs forState:UIControlStateNormal];
    [childVc.tabBarItem setTitleTextAttributes:selectTextAttrs forState:UIControlStateSelected];
    GPNaviViewController *navi = [[GPNaviViewController alloc] initWithRootViewController:childVc];
    navi.navigationBar.barTintColor = [UIColor colorWithRed:170 / 255.0 green:92 / 255.0 blue:107/ 255.0 alpha:1];
    [self.navigationController.navigationBar setTitleTextAttributes: @{NSFontAttributeName:[UIFont systemFontOfSize:19], NSForegroundColorAttributeName:[UIColor colorWithRed:0 green:0.7 blue:0.8 alpha:1]}];
    
    [self addChildViewController:navi];
    
}

@end

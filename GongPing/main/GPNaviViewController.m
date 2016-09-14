//
//  GPNaviViewController.m
//  工平矿业
//
//  Created by apple on 16/6/1.
//  Copyright © 2016年 xiaoAn. All rights reserved.
//

#import "GPNaviViewController.h"
#import "UIImage+Extension.h"

//#import "CZTabBar.h"
#import "UIBarButtonItem+Item.h"


@interface GPNaviViewController ()<UINavigationControllerDelegate>
@property (nonatomic, strong) id popDelegate;
@end

@implementation GPNaviViewController
#define iOS7 ([[UIDevice currentDevice].systemVersion doubleValue] >= 7.0)
+ (void)initialize
{
    // 获取当前类下面的UIBarButtonItem
    UIBarButtonItem *item = [UIBarButtonItem appearanceWhenContainedIn:self, nil];
    
    // 设置导航条按钮的文字颜色
    NSMutableDictionary *titleAttr = [NSMutableDictionary dictionary];
    titleAttr[NSForegroundColorAttributeName] = [UIColor whiteColor];
    [item setTitleTextAttributes:titleAttr forState:UIControlStateNormal];
    UINavigationBar *appearance = [UINavigationBar appearance];
//    appearance.backgroundColor = [UIColor colorWithRed:220/255 green:220/255 blue:220/255 alpha:0.5];
    appearance.backgroundColor = [UIColor blackColor];
   
}


- (void)viewDidLoad {
    [super viewDidLoad];
    _popDelegate = self.interactivePopGestureRecognizer.delegate;
    self.delegate = self;
}

- (void)pushViewController:(UIViewController *)viewController animated:(BOOL)animated
{
    if (self.childViewControllers.count) { // 不是根控制器
        
        viewController.hidesBottomBarWhenPushed = YES;
        
        UIBarButtonItem *left = [UIBarButtonItem barButtonItemWithImage:[UIImage imageNamed:@"back_bt_7"] highImage:[UIImage imageNamed:@"back_bt_7"] target:self action:@selector(popToPre) forControlEvents:UIControlEventTouchUpInside];
//        UIBarButtonItem *left = [UIBarButtonItem barButtonItemWithTitle:@"返回" target:self action:@selector(popToPre) forControlEvents:UIControlEventTouchUpInside];
        // 设置导航条的按钮
        viewController.navigationItem.leftBarButtonItem = left;
        
//        UIBarButtonItem *right = [UIBarButtonItem barButtonItemWithImage:[UIImage imageNamed:@"navigationbar_more"] highImage:[UIImage imageNamed:@"navigationbar_more_highlighted"] target:self action:@selector(popToRoot) forControlEvents:UIControlEventTouchUpInside];
//        viewController.navigationItem.rightBarButtonItem = right;
    }
    
    [super pushViewController:viewController animated:animated];
    
}

- (void)popToRoot
{
    [self popToRootViewControllerAnimated:YES];
}
- (void)popToPre
{
    [self popViewControllerAnimated:YES];
}

- (void)navigationController:(UINavigationController *)navigationController didShowViewController:(UIViewController *)viewController animated:(BOOL)animated
{
    if (viewController == self.viewControllers[0]) { // 是根控制器
        
        self.interactivePopGestureRecognizer.delegate = nil;
        
    }else{ // 非根控制器
        self.interactivePopGestureRecognizer.delegate = _popDelegate;
        
    }
}


@end

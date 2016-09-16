//
//  DNCommunityViewController.m
//  工平矿业
//
//  Created by apple on 16/7/15.
//  Copyright © 2016年 xiaoAn. All rights reserved.
//

#import "DNCommunityViewController.h"
#import "YSLContainerViewController.h"
#import "GPCommunityMineViewController.h"
#import "GPCommunityAllViewController.h"
#import "DNCommunityRankController.h"
#import "DNsearchViewController.h"
#define SCREEN_WIDTH  [UIScreen mainScreen].bounds.size.width
#define SCREEN_HEIGHT [UIScreen mainScreen].bounds.size.height
static CGFloat viewOffset = 64;
@interface DNCommunityViewController ()<YSLContainerViewControllerDelegate,UISearchBarDelegate>
@property (nonatomic, strong)UISearchController *seachVC;
@property (nonatomic, strong) UISearchBar *searchBar;
@property (nonatomic, strong) NSMutableArray *titleArray;
@end

@implementation DNCommunityViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
            self.title=@"社区交流";
    [self createUI];
    [self setupSearchBar];
}
-(void)createUI
{
    self.view.backgroundColor=[UIColor whiteColor];
    GPCommunityAllViewController*avc=[GPCommunityAllViewController new];
    avc.title=@"全部社区";
    GPCommunityMineViewController*mc=[GPCommunityMineViewController new];
    mc.title=@"我的社区";
    DNCommunityRankController*rc=[DNCommunityRankController new];
    rc.title=@"社区排行榜";
    // ContainerView
    YSLContainerViewController*containerVC=[[YSLContainerViewController alloc]initWithControllers:@[avc,mc,rc,] topBarHeight:150 parentViewController:self];
    containerVC.menuItemSelectedTitleColor=[UIColor redColor];
    containerVC.delegate=self;
    [self.view addSubview:containerVC.view];
}

#pragma mark -- YSLContainerViewControllerDelegate
- (void)containerViewItemIndex:(NSInteger)index currentController:(UIViewController *)controller
{
    [controller viewWillAppear:YES];
}


- (void)setupSearchBar{
    
    self.searchBar = [[UISearchBar alloc]init];
    
    self.searchBar.frame = CGRectMake(0, viewOffset, SCREEN_WIDTH, viewOffset);
    self.searchBar.delegate = self;
    self.searchBar.placeholder = @"搜索";
    [self.view addSubview:self.searchBar];
    
}

#pragma mark -UISearchBarDelegate
- (void)searchBarTextDidBeginEditing:(UISearchBar *)searchBar{
    [UIView animateWithDuration:0.5 animations:^{
        self.searchBar.showsCancelButton = YES;
        [self setupCancelButton];
    }];
}
- (void)setupCancelButton{
    
    UIButton *cancelButton = [self.searchBar valueForKey:@"_cancelButton"];
    [cancelButton setTitleColor:[UIColor lightGrayColor] forState:UIControlStateNormal];
    [cancelButton addTarget:self action:@selector(cancelButtonClickEvent) forControlEvents:UIControlEventTouchUpInside];
    
}

- (void)cancelButtonClickEvent{
    
    [UIView animateWithDuration:0.5 animations:^{
        [UIView setAnimationCurve:UIViewAnimationCurveEaseIn];
        self.searchBar.showsCancelButton = NO;
        [self.searchBar endEditing:YES];
    }];
    self.searchBar.placeholder = @"请输入社区关键字";
    
}
#pragma mark - 搜索协议的方法
-(void)searchBarSearchButtonClicked:(UISearchBar *)searchBar
{
    DNsearchViewController*vc=[[DNsearchViewController alloc]init];
    vc.keyWords=searchBar.text;
    [self.navigationController pushViewController:vc animated:YES];
}
-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:YES];
    
    
    self.searchBar.text=nil;
    
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end

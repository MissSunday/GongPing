//
//  DNJoinCommunityViewController.m
//  工平矿业
//
//  Created by apple on 16/7/16.
//  Copyright © 2016年 xiaoAn. All rights reserved.
//

#import "DNJoinCommunityViewController.h"
#import "DNJoinCommunityTableViewCell.h"
#import "DNPublished-Approve-ViolationsModel.h"
#import "DNPublished_Approve_ViolationsModel+net.h"

#import "MJRefresh.h"
@interface DNJoinCommunityViewController ()<UITableViewDataSource,UITableViewDelegate>
@property(nonatomic,strong)NSMutableArray*dataArr;
@property(nonatomic,strong)UITableView*tableView;
@property(nonatomic,assign)NSInteger pageIndex;
@end

@implementation DNJoinCommunityViewController

-(NSMutableArray*)dataArr
{
    if (!_dataArr) {
        _dataArr=[[NSMutableArray alloc]init];
    }
    return _dataArr;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.title=@"加入社区";
    [self createUI];
    [self refreshData];
    self.view.backgroundColor=[UIColor orangeColor];
}
-(void)createUI
{
   
    
    _tableView=[[UITableView alloc]initWithFrame:CGRectMake(0, 0, self.view.bounds.size.width, self.view.bounds.size.height) style:UITableViewStyleGrouped];
    _tableView.dataSource=self;
    _tableView.delegate=self;
    _tableView.headerHidden=YES;
    [self.view addSubview:_tableView];
    [_tableView registerNib:[UINib nibWithNibName:@"DNJoinCommunityTableViewCell" bundle:nil] forCellReuseIdentifier:@"iden"];
    __weak DNJoinCommunityViewController *weakSelf = self;
    
    
    
    //    //添加下拉刷新
    [self.tableView addHeaderWithCallback:^{
        [weakSelf refreshData];
    }];
    //    //上啦加载更多
    
    [self.tableView addFooterWithCallback:^{
        [weakSelf moreData];
    }];
}

#pragma mark-tableViewDatasource-Delegate
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return _dataArr.count;
}

-(UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString*iden=@"iden";
    DNJoinCommunityTableViewCell*cell=[tableView dequeueReusableCellWithIdentifier:iden forIndexPath:indexPath];
    cell.model=self.dataArr[indexPath.row];
   
    return cell;
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 120;
}
-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 0.1;
}
#pragma mark-加载数据

-(void)moreData
{
    _pageIndex++;
    [self downloadData];
}

-(void)refreshData
{
    _pageIndex = 1;
    [self downloadData];
}
-(void)downloadData
{
    __weak DNJoinCommunityViewController*weakSelf=self;
    NSString*url=[joinCommunityUrl stringByAppendingString:[NSString  stringWithFormat:@"%@/%ld.json",EnterCount,(long)weakSelf.pageIndex]];
    [DNPublished_Approve_ViolationsModel requestWithURL:url
                                               callBack:^(NSArray *array, NSError *error) {
                                                   if (weakSelf.pageIndex==1) {
                                                       [weakSelf.dataArr removeAllObjects];
                                                       
                                                   }
                                                   weakSelf.dataArr=[DNPublished_Approve_ViolationsModel arrayOfModelsFromDictionaries:array];
                                                   [weakSelf.tableView reloadData];
                                                   [weakSelf.tableView headerEndRefreshing];
                                                   [weakSelf.tableView footerEndRefreshing];
                                                   [weakSelf.tableView reloadData];
                                                   
                                               }];
    
    
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

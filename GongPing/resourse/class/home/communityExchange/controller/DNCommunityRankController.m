//
//  DNCommunityRankController.m
//  公平矿业
//
//  Created by apple on 16/7/14.
//  Copyright © 2016年 xiaoAn. All rights reserved.
//

#import "DNCommunityRankController.h"
#import "DNCommunityListModel.h"
#import "DNCommunityListModel+net.h"
#import "DNCommunityListTableViewCell.h"

#import "MJRefresh.h"
@interface DNCommunityRankController ()<UITableViewDataSource,UITableViewDelegate>
@property(nonatomic,strong)UITableView*tableView;
@property(nonatomic,strong)NSMutableArray*dataArr;
@property(nonatomic,assign)NSInteger pageIndex;
@end

@implementation DNCommunityRankController
-(NSMutableArray*)dataArr
{
    if (!_dataArr) {
        _dataArr=[[NSMutableArray alloc]init];
    }
    return _dataArr;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    [self createUI];
    [self refreshData];
}
-(void)createUI
{
    _tableView=[[UITableView alloc]initWithFrame:CGRectMake(0, 0, self.view.bounds.size.width, self.view.bounds.size.height-214)];
    _tableView.dataSource=self;
    _tableView.delegate=self;
    [self.view addSubview:_tableView];
    [_tableView registerNib:[UINib nibWithNibName:@"DNCommunityListTableViewCell" bundle:nil] forCellReuseIdentifier:@"iden"];
    __weak DNCommunityRankController *weakSelf = self;
    
    
    //    //添加下拉刷新
    [self.tableView addHeaderWithCallback:^{
        [weakSelf refreshData];
    }];
    //    //上啦加载更多
    
    [self.tableView addFooterWithCallback:^{
        [weakSelf moreData];
    }];
}


#pragma mark --- tableView dataSoure/delegate

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return _dataArr.count;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    DNCommunityListTableViewCell*cell=[tableView dequeueReusableCellWithIdentifier:@"iden" forIndexPath:indexPath];
    cell.model=self.dataArr[indexPath.row];
    return cell;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    return 120;
    
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
    __weak DNCommunityRankController*weakSelf=self;
    NSString*url=[communityListlUrl stringByAppendingString:[NSString stringWithFormat:@"%ld.json",(long)weakSelf.pageIndex]];
    [DNCommunityListModel requestWithURL:url callBack:^(NSArray *array, NSError *error) {
        if (weakSelf.pageIndex==1) {
            [weakSelf.dataArr removeAllObjects];
            
        }
        weakSelf.dataArr=[DNCommunityListModel arrayOfModelsFromDictionaries:array];
        [weakSelf.tableView reloadData];
        [weakSelf.tableView headerEndRefreshing];
        [weakSelf.tableView footerEndRefreshing];
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

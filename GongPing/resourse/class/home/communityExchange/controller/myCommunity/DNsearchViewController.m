//
//  DNsearchViewController.m
//  公平矿业
//
//  Created by apple on 16/7/15.
//  Copyright © 2016年 xiaoAn. All rights reserved.
//

#import "DNsearchViewController.h"
#import "DNCommunityListModel.h"
#import "DNCommunityListModel+net.h"
#import "DNSearchTableViewCell.h"

#import "MJRefresh.h"
@interface DNsearchViewController ()<UITableViewDataSource,UITableViewDelegate>
@property(nonatomic,strong)UITableView*tableView;
@property(nonatomic,strong)NSMutableArray*dataArr;
@property(nonatomic,assign)NSInteger pageIndex;

@end

@implementation DNsearchViewController
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
    self.title=@"社区搜索结果";
    [self createUI];
    [self refreshData];
}
-(void)createUI
{
    _tableView=[[UITableView alloc]initWithFrame:CGRectMake(0, 0, self.view.bounds.size.width, self.view.bounds.size.height)];
    _tableView.dataSource=self;
    _tableView.delegate=self;
    [self.view addSubview:_tableView];
    [_tableView registerNib:[UINib nibWithNibName:@"DNSearchTableViewCell" bundle:nil] forCellReuseIdentifier:@"iden"];
    __weak DNsearchViewController *weakSelf = self;
    
    
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
    DNSearchTableViewCell*cell=[tableView dequeueReusableCellWithIdentifier:@"iden" forIndexPath:indexPath];
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
    __weak DNsearchViewController*weakSelf=self;
    NSString*url=[communitySearchlUrl stringByAppendingString:[NSString stringWithFormat:@"%ld/%@.json",(long)weakSelf.pageIndex,_keyWords]];
    NSString *encoded = [url stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
    [DNCommunityListModel requestWithURL:encoded callBack:^(NSArray *array, NSError *error) {
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

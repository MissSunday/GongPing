
//
//  GPVipTableViewController.m
//  公平矿业
//
//  Created by apple on 16/6/7.
//  Copyright © 2016年 xiaoAn. All rights reserved.
//

#import "GPVipTableViewController.h"

#import "MJRefresh.h"
#import "GPHomeInformationModel.h"
#import "GPHomeInformationList.h"

#import "DNAdvisoryDetailViewController.h"


@interface GPVipTableViewController (){
    int page;
}
@property (nonatomic,strong)NSMutableArray * dateArr;
@end

@implementation GPVipTableViewController

-(NSMutableArray*)_dateArr{
    if (_dateArr == nil) {
        _dateArr = [[NSMutableArray alloc]init];
    }
    return _dateArr;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    page = 2;
    self.view.backgroundColor = [UIColor whiteColor];
    // 添加下拉刷新控件
    [self.tableView addHeaderWithTarget:self action:@selector(loadNewStatus)];
    [self loadNewStatus];
    // 自动下拉刷新
    //[self.tableView headerBeginRefreshing];
   
    // 添加上拉刷新控件
    //[self.tableView.tableFooterView addSubview:self];
    [self.tableView addFooterWithTarget:self action:@selector(loadMoreStatus)];
    
}



#pragma mark - 刷新最新的新闻
- (void)refresh{
    
    // 自动下拉刷新
    [self.tableView headerBeginRefreshing];
    
}

#pragma mark - 请求更多旧的新闻
- (void)loadMoreStatus
{
  
    [GPHomeInformationList listToolSuccess:^(NSArray *models) {
        for (GPHomeInformationModel * model  in models) {
            if (models.count) {
                page ++;
                
            }
            
            [_dateArr addObject:model];
        }
        [self.tableView reloadData];
    } failure:^(NSError *error) {
        
    } withTag:2 andPage:page];
    [self.tableView footerEndRefreshing];
}

- (void)loadNewStatus
{

    _dateArr = [[NSMutableArray alloc]init];
    [GPHomeInformationList listToolSuccess:^(NSArray *models) {
        for (GPHomeInformationModel * model  in models) {
            [_dateArr addObject:model];
        }
        [self.tableView reloadData];
    } failure:^(NSError *error) {
        
    } withTag:2 andPage:1];
    [self.tableView headerEndRefreshing];
    
}


-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    return _dateArr.count;
    GPLog(@"%lu",(unsigned long)_dateArr.count);
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString * id = @"cell";
    GPHomeInformationModel * model = [GPHomeInformationModel new];
    UITableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:id];
    if (cell == nil) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:id];
    }
    model = _dateArr[indexPath.row];
    cell.textLabel.text = model.ZX_TITLE;
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    DNAdvisoryDetailViewController*dvc=[[DNAdvisoryDetailViewController alloc]init];
    GPHomeInformationModel*model=_dateArr[indexPath.row];
    dvc.pdoductId=model.ZX_ID;
    [self.navigationController pushViewController:dvc animated:YES];
    
}

@end

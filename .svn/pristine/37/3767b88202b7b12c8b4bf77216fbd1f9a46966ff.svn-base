//
//  KFSearchResultViewController.m
//  SearchHistory
//
//  Created by VS on 16/5/9.
//  Copyright © 2016年 VS. All rights reserved.
//

#import "KFSearchResultViewController.h"

#import "DNProuductSearch.h"
#import "DNProuductSearch+net.h"
#import "DNProDetailControllerViewController.h"

#import "UIImageView+WebCache.h"
#import "UITableView+SDAutoTableViewCellHeight.h"
#import "MJRefresh.h"
@interface KFSearchResultViewController ()<UITableViewDataSource,UITableViewDelegate>
@property (nonatomic ,strong) NSMutableArray * dateArr;
@property (nonatomic ,strong) UITableView * tableView;
@property(nonatomic,strong)UIImage*image;

@property (nonatomic, assign)NSInteger pageIndex;
@end

@implementation KFSearchResultViewController

-(NSMutableArray*)dateArr
{

    if (!_dateArr) {
        _dateArr=[[NSMutableArray alloc]init];
    }
    return _dateArr;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    [self addTableView];
    
}

-(void)addTableView{
    _tableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_W, SCREEN_H)];
    _tableView.delegate = self;
    _tableView.dataSource = self;
    [self.view addSubview:_tableView];
    __weak KFSearchResultViewController *weakSelf = self;
    
    
    //    //添加下拉刷新
    [self.tableView addHeaderWithCallback:^{
        [weakSelf refreshData];
    }];
    //    //上啦加载更多
    
    [self.tableView addFooterWithCallback:^{
        [weakSelf moreData];
    }];
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return _dateArr.count;
   
}


-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
     static NSString*iden=@"iden";
    UITableViewCell*cell=[tableView dequeueReusableCellWithIdentifier:iden];
    if (!cell) {
        cell=[[UITableViewCell alloc]initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:iden];
    }
    DNProuductSearch*model=_dateArr[indexPath.row];
    cell.textLabel.text=model.PRODUCT_NAME;
    NSString*picUrl=[NSString stringWithFormat:@"http://192.168.0.14/XiYuanUpload/%@",model.PRODUCT_PICURL];
   [cell.imageView sd_setImageWithURL:[NSURL URLWithString:[picUrl substringToIndex:picUrl.length-1]] placeholderImage:[UIImage imageNamed:@"jinshu.jpg"]];
    [cell.imageView setContentMode:UIViewContentModeScaleAspectFit];
    _image=cell.imageView.image;
    cell.detailTextLabel.text=model.PRODUCT_JJ;
    cell.detailTextLabel.numberOfLines=0;
    cell.selectionStyle=UITableViewCellSelectionStyleNone;
    
    return cell;
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{

    DNProDetailControllerViewController*cvc=[[DNProDetailControllerViewController alloc]init];
    DNProuductSearch*model=_dateArr[indexPath.row];
    cvc.productId=model.PRODUCT_ID;
    [self.navigationController pushViewController:cvc animated:YES];
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 120;
    
}
#pragma mark - 下载
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
#pragma mark-加载数据
-(void)downloadData
{
    NSString*url=[productSearchUrl stringByAppendingString:[NSString stringWithFormat:@"%ld/%@.json",(long)self.pageIndex,self.keyword]];
    NSString *encoded = [url stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
    __weak  KFSearchResultViewController*rvc=self;
    [DNProuductSearch requestWithURL:encoded PageIndex:self.pageIndex callBack:^(NSArray *array, NSError *error) {
        if (rvc.pageIndex==1) {
            [rvc.dateArr removeAllObjects];
            
        }
        rvc.dateArr=[DNProuductSearch arrayOfModelsFromDictionaries:array];
        [rvc.tableView reloadData];
        [rvc.tableView headerEndRefreshing];
        [rvc.tableView footerEndRefreshing];
    }];
    
}
-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:YES];
    [self refreshData];
}

@end

//
//  DNProductDetailControllerViewController.m
//  公平矿业
//
//  Created by apple on 16/7/8.
//  Copyright © 2016年 xiaoAn. All rights reserved.
//

#import "DNProductSubControllerViewController.h"
#import "UIImageView+WebCache.h"
#import "MJRefresh.h"

#import "DNProductDetail.h"
#import "DNProductDetail+net.h"
#import "DNProDetailControllerViewController.h"
@interface DNProductSubControllerViewController ()<UITableViewDataSource,UITableViewDelegate>
@property (nonatomic ,strong) NSMutableArray * dataArr;
@property (nonatomic, assign)NSInteger pageIndex;
@property(nonatomic,strong)UITableView*tableview;
@property(nonatomic,copy)NSString*productId;
@end

@implementation DNProductSubControllerViewController
-(NSMutableArray *)_dataArr{
    if (_dataArr == nil) {
        _dataArr = [NSMutableArray array];
    }
    return _dataArr;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
     self.navigationItem.title =@"产品列表";
     [self refreshData];
    [self createUI];
}
-(void)createUI
{
    _tableview=[[UITableView alloc]initWithFrame:[[UIScreen mainScreen]bounds] style:UITableViewStylePlain];
    _tableview.dataSource=self;
    _tableview.delegate=self;
    self.automaticallyAdjustsScrollViewInsets = YES;
    [self.view addSubview:_tableview];
    
    
    __weak DNProductSubControllerViewController *weakSelf = self;
    
    
//    //添加下拉刷新
    [self.tableview addHeaderWithCallback:^{
        [weakSelf refreshData];
    }];
//    //上啦加载更多
    
    [self.tableview addFooterWithCallback:^{
        [weakSelf moreData];
    }];

}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return _dataArr.count;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString * id = @"cell";
    UITableViewCell *cell = [tableView cellForRowAtIndexPath:indexPath];
    if (cell == nil) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:id];
    }
    DNProductDetail*model=_dataArr[indexPath.row];
    NSString*picUrl=[NSString stringWithFormat:@"http://192.168.0.14/XiYuanUpload/%@",model.PRODUCT_PICURL];
    UIImageView * imageView = [[UIImageView alloc]initWithFrame:CGRectMake(10, 10, 80, 60)];
    [imageView sd_setImageWithURL:[NSURL URLWithString:[picUrl substringToIndex:picUrl.length-1]]];
    [cell addSubview:imageView];
    UILabel * labelName = [[UILabel alloc]initWithFrame:CGRectMake(100, 10, SCREEN_W - 100, 30)];
    labelName.text=model.PRODUCT_NAME;
    [cell addSubview:labelName];
    UILabel * labelJJ = [[UILabel alloc]initWithFrame:CGRectMake(100, 50, SCREEN_W - 100, 30)];
    labelJJ.text=model.PRODUCT_JJ;
    [cell addSubview:labelJJ];
    return cell;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 120;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    DNProDetailControllerViewController*dcc=[[DNProDetailControllerViewController alloc]init];
    DNProductDetail*model=_dataArr[indexPath.row];
    dcc.productId=model.PRODUCT_ID;
    [self.navigationController pushViewController:dcc animated:YES];
    
}
#pragma mark-加载数据

#pragma mark - 下载
-(void)moreData
{
    _pageIndex++;
    [self download];
}

-(void)refreshData
{
    _pageIndex = 1;
    [self download];
}
-(void)download
{
    
    if (_isSelect) {
        [self allProduct];
    }
    [self loadedByCategory];
 
    
}
-(void)loadedByCategory
{
    __weak DNProductSubControllerViewController*dc=self;
    NSString*url=[productListUrl stringByAppendingString:[NSString stringWithFormat:@"/%ld/%@/%@.json",(long)_pageIndex,self.fId,self.sId]];
    [DNProductDetail requestWithURL:url PageIndex:_pageIndex callBack:^(NSArray *array, NSError *error) {
        if (dc.pageIndex==1) {
            [dc.dataArr removeAllObjects];
            
        }
        dc.dataArr=[DNProductDetail arrayOfModelsFromDictionaries:array];
        [dc.tableview reloadData];
        [dc.tableview headerEndRefreshing];
        [dc.tableview footerEndRefreshing];
        
    }];
}
-(void)allProduct
{
    __weak DNProductSubControllerViewController*dc=self;
    NSString*urlM=[moreProductShowUrl stringByAppendingString:[NSString stringWithFormat:@"%ld.json",(long)_pageIndex]];
    [DNProductDetail requestWithURL:urlM PageIndex:_pageIndex callBack:^(NSArray *array, NSError *error) {
        if (dc.pageIndex==1) {
            [dc.dataArr removeAllObjects];
            
        }
        dc.dataArr=[DNProductDetail arrayOfModelsFromDictionaries:array];
        
        [dc.tableview reloadData];
        [dc.tableview headerEndRefreshing];
        [dc.tableview footerEndRefreshing];
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

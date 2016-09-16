//
//  DNCommunityDetailViewController.m
//  工平矿业
//
//  Created by apple on 16/7/18.
//  Copyright © 2016年 xiaoAn. All rights reserved.
//

#import "DNCommunityDetailViewController.h"
#import "UIBarButtonItem+Item.h"
#import "GPCommunityModel.h"
#import "GPCommunitViewFrame.h"
#import "GPCommnuityDetailCell.h"


#import "MJRefresh.h"
#import "UIImageView+WebCache.h"

#import "GPCommunityDetailContentTableController.h"
#import "DNLastAnswerTableViewCell.h"
#import "DNLastAnswerDetailModel.h"
#import "DNLastAnswerDetailModel+net.h"
#import "DNLastAnswerNumModel.h"
#import "DNLastAnswerNumModel+net.h"

#import "GPPublishTopicController.h"
@interface DNCommunityDetailViewController ()<UITableViewDataSource,UITableViewDelegate>
@property (nonatomic,strong)UIView * headerView;
@property(nonatomic,strong)NSMutableArray*dataArr;
@property(nonatomic,strong)UITableView*tableView;
@property(nonatomic,assign)NSInteger pageIndex;
@end

@implementation DNCommunityDetailViewController
-(NSMutableArray*)dataArr
{
    if (!_dataArr) {
        _dataArr=[[NSMutableArray alloc]init];
    }
    return _dataArr;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.title =@"最后回复";
    self.navigationItem.rightBarButtonItem = [UIBarButtonItem barButtonItemWithTitle:@"发布话题" target:self action:@selector(publishTopic) forControlEvents:UIControlEventTouchUpInside];
    [self createUI];
    [self refreshData];
}
-(void)publishTopic{
    
    GPPublishTopicController * vc = [[GPPublishTopicController alloc]init];
    [self.navigationController pushViewController:vc animated:YES];
}

#pragma mark 添加头部视图
-(void)createUI{
    _tableView=[[UITableView alloc]initWithFrame:CGRectMake(0, 0, self.view.bounds.size.width, self.view.bounds.size.height) style:UITableViewStyleGrouped];
    _tableView.dataSource=self;
    _tableView.delegate=self;
    [self.view addSubview:_tableView];
    [_tableView registerNib:[UINib nibWithNibName:@"DNLastAnswerTableViewCell" bundle:nil] forCellReuseIdentifier:@"iden"];
    __weak DNCommunityDetailViewController *weakSelf = self;
    
    
    //    //添加下拉刷新
    [self.tableView addHeaderWithCallback:^{
        [weakSelf refreshData];
    }];
    //    //上啦加载更多
    
    [self.tableView addFooterWithCallback:^{
        [weakSelf moreData];
    }];
    NSString*url=[lastAnswerNumUrl stringByAppendingString:[NSString stringWithFormat:@"%d.json",USERID]];
    [DNLastAnswerNumModel requestWithURL:url callBack:^(NSArray *array, NSError *error) {
        NSMutableArray*arr=[[NSMutableArray alloc]init];
        arr=[DNLastAnswerNumModel arrayOfModelsFromDictionaries:array];
        for (DNLastAnswerNumModel*model in arr) {
            weakSelf.headerView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_W, 50)];
            NSString*headImageUrl=[NSString stringWithFormat:@"http://192.168.0.14/XiYuanUpload/%@",model.sqPicurl];
            UIImageView * imageView = [[UIImageView alloc]initWithFrame:CGRectMake(20, 20, 80, 80)];
            [imageView sd_setImageWithURL:[NSURL URLWithString:[headImageUrl substringToIndex:headImageUrl.length-1]]];
            UILabel * label = [[UILabel alloc]initWithFrame:CGRectMake(105, 20, SCREEN_W - 120, 20)];
            label.text = model.sqName;
            
            UILabel * labelRe = [[UILabel alloc]initWithFrame:CGRectMake(105, 70, 80, 20)];
            labelRe.text = [NSString stringWithFormat:@"回复数:%@",model.tzNumber];
            
            UILabel * labelTopic = [[UILabel alloc]initWithFrame:CGRectMake(185, 70, 80, 20)];
            labelTopic.text = [NSString stringWithFormat:@"话题数:%@",model.htNumber];
            
            UILabel * labelNum = [[UILabel alloc]initWithFrame:CGRectMake(265, 70, SCREEN_W - 200, 20)];
            labelNum.text = [NSString stringWithFormat:@"人数:%@",model.peopleNumber];
            
            weakSelf.tableView.tableHeaderView = weakSelf.headerView;
            [weakSelf.headerView addSubview:imageView];
            [weakSelf.headerView addSubview:label];
            [weakSelf.headerView addSubview:labelRe];
            [weakSelf.headerView addSubview:labelTopic];
            [weakSelf.headerView addSubview:labelNum];
            
        }
        
    }];
    
}
-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 50;
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 120;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return _dataArr.count;
}

-(UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString*iden=@"iden";
    DNLastAnswerTableViewCell*cell=[tableView dequeueReusableCellWithIdentifier:iden forIndexPath:indexPath];
    cell.model=_dataArr[indexPath.row];
    return cell;
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
    __weak DNCommunityDetailViewController*weakSelf=self;
    NSString*url=[lastAnswerDetailUrl stringByAppendingString:[NSString stringWithFormat:@"%d/%ld.json",USERID,(long)_pageIndex]];
    [DNLastAnswerDetailModel requestWithURL:url callBack:^(NSArray *array, NSError *error) {
        if (weakSelf.pageIndex==1) {
            [weakSelf.dataArr removeAllObjects];
            
        }
        weakSelf.dataArr=[DNLastAnswerDetailModel arrayOfModelsFromDictionaries:array];
        [weakSelf.tableView headerEndRefreshing];
        [weakSelf.tableView footerEndRefreshing];
        [weakSelf.tableView reloadData];
    }];
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

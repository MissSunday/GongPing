//
//  GPHomeController.m
//  公平矿业
//
//  Created by apple on 16/6/1.
//  Copyright © 2016年 xiaoAn. All rights reserved.
//

#import "GPHomeController.h"


//搜索框
#import "CZSearchBar.h"

#import "KFSearchViewController.h"

#import "SearchBarView.h"

//滚动视图

#import "SDCycleScrollView.h"

#import "LZPageViewController.h"
#import "GPOfficeShowController.h"
#import "GPVipTableViewController.h"


#import "GPproductCategaryController.h"

#import "GPCommunityAllViewController.h"
#import "GPCommunityMineViewController.h"
#import "DNCommunityRankController.h"

//刷新
#import "MJRefresh.h"

//模型
#import "GPHomeProductShowModel.h"
#import "GPHomeProductShowList.h"
#import "GPHomeInfoMole.h"
#import "GPHomeInfoList.h"

#import "UIImageView+WebCache.h"

#import "UIBarButtonItem+Item.h"

#import "DNAdvisoryDetailViewController.h"
#import "ZLCGuidePageView.h" 

#import "GPOfficeShowController.h"
#import "DNProductSubControllerViewController.h"
#import "DNCommunityViewController.h"
#define SCREEN_WIDTH self.view.bounds.size.width
#define SCREEN_HEIGHT self.view.bounds.size.height
@interface GPHomeController ()<UITableViewDataSource, UITableViewDelegate,SearchBarViewDelegate>
@property (nonatomic,strong)UITableView * tableView;
@property(nonatomic,strong)UIView * headerView;
@property(nonatomic,strong)SDCycleScrollView *cycleScrollView;
@property(nonatomic,strong)NSMutableArray * productShowArr;
@property(nonatomic,strong)NSMutableArray * infoArr;
@end

@implementation GPHomeController

-(NSMutableArray *)productShowArr{
    if (_productShowArr) {
        _productShowArr = [NSMutableArray array];
    }
    return _productShowArr;
}

- (void)viewDidLoad {
    //创建导航栏的搜索框1
    [self addTitle];
    
    
    [self initDate];
    
    //创建tabble的头部
    self.headerView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, self.view.bounds.size.width, 160+0.33*(SCREEN_WIDTH-45)+15+15)];
    self.headerView.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:_headerView];
    [self.tableView headerBeginRefreshing];
    [self.tableView addHeaderWithTarget:self action:@selector(initDate)];
    //创建tableview
    [self setupTableView];
    //创建广告
    [self addAD];
    //创建四个按钮
    [self addBtn];
    
}

-(void)initDate{
    _productShowArr = [NSMutableArray array];
    _infoArr = [NSMutableArray array];
    [GPHomeProductShowList listToolSuccess:^(NSArray *models) {
        for (GPHomeProductShowModel * model  in models) {
            [_productShowArr addObject:model];
        }
        [self.tableView reloadData];
    } failure:^(NSError *error) {
        
    }];
    [GPHomeInfoList listToolSuccess:^(NSArray *models) {
        for (GPHomeInfoList * model  in models) {
            [_infoArr addObject:model];
        }
        [self.tableView reloadData];
        
    } failure:^(NSError *error) {
        
    }];
    
}


#pragma mark --- tableView dataSoure/delegate
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 2;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 2;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    if (indexPath.section ==0 ){
        static NSString * iden = @"cellOne";
        UITableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:iden];
        if (cell == nil) {
            cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:iden ];
        }
        cell.textLabel.font = [UIFont systemFontOfSize:14];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        if (_infoArr.count == 0) {
            
        }else{
            GPHomeInfoMole * model = [[GPHomeInfoMole alloc]init];
            model = _infoArr[indexPath.row];
            cell.textLabel.text =model.zxDetail;
        }
        return cell;
        
    }else if (indexPath.section == 1){
        
        static NSString * id = @"cellTwo";
        UITableViewCell *cell = [tableView cellForRowAtIndexPath:indexPath];
        if (cell == nil) {
            cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:id ];
        }
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        if (_productShowArr.count == 0) {
            UIImageView * imageViewF = [[UIImageView alloc]initWithFrame:CGRectMake(10, 0, (SCREEN_WIDTH - 40)/2, 100)];
            imageViewF.image = [UIImage imageNamed:@"index.png"];
            UIImageView * imageViewS = [[UIImageView alloc]initWithFrame:CGRectMake((SCREEN_WIDTH - 40)/2+30, 0, (SCREEN_WIDTH - 40)/2, 100)];
            imageViewS.image = [UIImage imageNamed:@"index.png1"];
            [cell addSubview:imageViewF];
            [cell addSubview:imageViewS];
            
            UILabel * labelF = [[UILabel alloc]initWithFrame:CGRectMake(60, 70, (SCREEN_WIDTH - 40)/2, 100)];
            labelF.text = @"金属";
            UILabel * labelS = [[UILabel alloc]initWithFrame:CGRectMake((SCREEN_WIDTH - 40)/2+90, 70, (SCREEN_WIDTH - 40)/2, 100)];
            labelS.text = @"金属";
            [cell addSubview:labelF];
            [cell addSubview:labelS];
        }else{
            if (indexPath.row == 0) {
                GPHomeProductShowModel * modelOne = [[GPHomeProductShowModel alloc]init];
                modelOne = _productShowArr[0];
                GPHomeProductShowModel * modelTwo = [[GPHomeProductShowModel alloc]init];
                modelTwo = _productShowArr[1];
                UIImageView * imageViewF = [[UIImageView alloc]initWithFrame:CGRectMake(10, 0, (SCREEN_WIDTH - 40)/2, 100)];
                [imageViewF sd_setImageWithURL:[NSURL URLWithString:modelOne.productPicurl] placeholderImage:[UIImage imageNamed:@"index.png1"]];
                UIImageView * imageViewS = [[UIImageView alloc]initWithFrame:CGRectMake((SCREEN_WIDTH - 40)/2+30, 0, (SCREEN_WIDTH - 40)/2, 100)];
                [imageViewS sd_setImageWithURL:[NSURL URLWithString:modelOne.productPicurl] placeholderImage:[UIImage imageNamed:@"index.png1"]];
                [cell addSubview:imageViewF];
                [cell addSubview:imageViewS];
                
                UILabel * labelF = [[UILabel alloc]initWithFrame:CGRectMake(60, 70, (SCREEN_WIDTH - 40)/2, 100)];
                labelF.text = modelOne.productName;
                UILabel * labelS = [[UILabel alloc]initWithFrame:CGRectMake((SCREEN_WIDTH - 40)/2+90, 70, (SCREEN_WIDTH - 40)/2, 100)];
                labelS.text = modelTwo.productName;
                [cell addSubview:labelF];
                [cell addSubview:labelS];
            }else{
                GPHomeProductShowModel * modelOne = [[GPHomeProductShowModel alloc]init];
                modelOne = _productShowArr[0];
                GPHomeProductShowModel * modelTwo = [[GPHomeProductShowModel alloc]init];
                modelTwo = _productShowArr[1];
                UIImageView * imageViewF = [[UIImageView alloc]initWithFrame:CGRectMake(10, 0, (SCREEN_WIDTH - 40)/2, 100)];
                NSURL *imgurl=[NSURL URLWithString:modelOne.productPicurl];
                [imageViewF sd_setImageWithURL:imgurl placeholderImage:[UIImage imageNamed:@"index.png1"]];
                
                UIImageView * imageViewS = [[UIImageView alloc]initWithFrame:CGRectMake((SCREEN_WIDTH - 40)/2+30, 0, (SCREEN_WIDTH - 40)/2, 100)];
                [imageViewS sd_setImageWithURL:imgurl placeholderImage:[UIImage imageNamed:@"index.png1"]];
                [cell addSubview:imageViewF];
                [cell addSubview:imageViewS];
                
                UILabel * labelF = [[UILabel alloc]initWithFrame:CGRectMake(60, 70, (SCREEN_WIDTH - 40)/2, 100)];
                labelF.text = modelOne.productName;
                UILabel * labelS = [[UILabel alloc]initWithFrame:CGRectMake((SCREEN_WIDTH - 40)/2+90, 70, (SCREEN_WIDTH - 40)/2, 100)];
                labelS.text = modelTwo.productName;
                [cell addSubview:labelF];
                [cell addSubview:labelS];
            }
        }

        return cell;
    }else{
        static NSString * id = @"cell";
        UITableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:id];
        if (cell == nil) {
            cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:id ];
        }
        return cell;
    }
    
    
}


-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.section == 0) {
        DNAdvisoryDetailViewController*dvc=[[DNAdvisoryDetailViewController alloc]init];
        GPHomeInfoMole * model=_infoArr[indexPath.row];
        dvc.pdoductId=model.zxId;
        
       [self.navigationController pushViewController:dvc animated:YES];
    }else{
        
    }
    
    
}

#pragma matk 创建搜索框1
-(void)addTitle{
        //将搜索条放在一个UIView上
        SearchBarView *searchView = [[SearchBarView alloc]initWithFrame:CGRectMake(0, 7, 240, 30)];
        searchView.delegate=self;
    
        self.navigationItem.titleView = searchView;

}

#pragma mark - SearchBarViewDelegate Method
- (void)searchBarSearchButtonClicked:(SearchBarView *)searchBarView {
    KFSearchViewController *searchVC = [[KFSearchViewController alloc] init];
    [self.navigationController pushViewController:searchVC animated:YES];
    
}



#pragma mark 创建tableView
-(void)setupTableView{
    
    UITableView * tableView = [[UITableView alloc]initWithFrame:CGRectMake(0,0, self.view.bounds.size.width, self.view.bounds.size.height) style:UITableViewStyleGrouped];
    tableView.backgroundColor = [UIColor whiteColor];
    tableView.dataSource = self;
    tableView.delegate = self;
    self.tableView = tableView;
    self.tableView.tableHeaderView = self.headerView;
    self.tableView.showsVerticalScrollIndicator = NO;
    [self.view addSubview:self.tableView];
}

#pragma mark 广告
-(void)addAD{
    UIView *header=[[UIView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, 150)];
    NSArray *imagesURLStrings = @[
                                  @"http://img30.360buyimg.com/mobilecms/s480x180_jfs/t1606/199/444346922/48930/355f9ef/55841cd0N92d9fa7c.jpg",
                                  @"http://img30.360buyimg.com/mobilecms/s480x180_jfs/t1609/58/409100493/49144/7055bec5/557e76bfNc065aeaf.jpg"
                                  ];
    
    // 网络加载 --- 创建不带标题的图片轮播器
    _cycleScrollView = [SDCycleScrollView cycleScrollViewWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, 150) imageURLStringsGroup:nil];
    
    _cycleScrollView.infiniteLoop = YES;
    _cycleScrollView.backgroundColor=[UIColor lightGrayColor];
    _cycleScrollView.pageControlStyle = SDCycleScrollViewPageContolStyleClassic;
    _cycleScrollView.autoScrollTimeInterval = 2.0; // 轮播时间间隔，默认1.0秒，可自定义
    
    
    //模拟加载延迟
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.5 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        _cycleScrollView.imageURLStringsGroup = imagesURLStrings;
    });
    
    [header addSubview:_cycleScrollView];
    [self.headerView addSubview:header];

}
#pragma mark 入口四个按钮
-(void)addBtn{
    NSArray * array = @[@"热门资讯.png",@"产品展示.png"];
    NSArray * arrayTwo = @[@"闲置物资.png",@"社区交流.png"];
    CGFloat margin = 15;
    CGFloat marginy = 15;
    CGFloat btnW = (SCREEN_WIDTH - 45)/2;
    CGFloat btnY = 0.33*btnW;
    CGFloat marginY = 160;
    for (int i = 0 ; i < 2; i++) {
        UIButton * btn = [[UIButton alloc]init];
        btn.frame = CGRectMake(margin *(i+1)+btnW*i,marginY, btnW, btnY);
        btn.tag = 1000+i;
        btn.backgroundColor = [UIColor yellowColor];
        btn.layer.cornerRadius = 10;
       [btn setBackgroundImage:[UIImage imageNamed:array[i]] forState:UIControlStateNormal];
        [btn addTarget:self action:@selector(jumpToDetailInfo:) forControlEvents:UIControlEventTouchUpInside];
        [self.headerView addSubview:btn];
    }
    for (int j = 0; j <2; j++) {
        UIButton * btn = [[UIButton alloc]init];
        btn.frame = CGRectMake(margin *(j+1)+btnW*j,marginY+marginy + btnY, btnW, btnY);
        btn.tag = 2000+j;
        btn.backgroundColor = [UIColor yellowColor];
        btn.layer.cornerRadius = 10;
        [btn setBackgroundImage:[UIImage imageNamed:arrayTwo[j]] forState:UIControlStateNormal];
        [btn addTarget:self action:@selector(jumpToComm:) forControlEvents:UIControlEventTouchUpInside];
        [self.headerView addSubview:btn];
    }
}


#pragma mark 跳转到发布信息
-(void)jumpToDetailInfo:(UIButton *)sender{
    if (sender.tag == 1000) {

        LZPageViewController *pageVc = [[LZPageViewController alloc] initWithTitles:@[@"官方发布",@"会员发布"] controllersClass:@[[GPOfficeShowController class],[GPVipTableViewController class]] title:@"热门咨询" WithFrame:CGRectMake (0,40,SCREEN_WIDTH,SCREEN_HEIGHT - 104) view:nil] ;
        [self.navigationController pushViewController:pageVc animated:YES];
    }else{
        GPproductCategaryController *product = [[GPproductCategaryController alloc] init];
        [self.navigationController pushViewController:product animated:YES];
    }
    
}

#pragma mark 社区
-(void)jumpToComm:(UIButton *)sender{
    if (sender.tag == 2000) {
        
        
    }else{
        DNCommunityViewController*cvc=[[DNCommunityViewController alloc]init];
        [self.navigationController pushViewController:cvc animated:YES];
    }
    
}

-(void)Search{
  
    KFSearchViewController*vc=[[KFSearchViewController alloc]init];
    [self.navigationController pushViewController:vc animated:YES];
    
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.section == 0) {
        return 50;
    }else{
        return 150;
    }
}

- ( CGFloat )tableView:( UITableView *)tableView heightForHeaderInSection:( NSInteger )section
{
    return 30.0 ;
}
- (UIView *) tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
   UIView *headerView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, tableView.bounds.size.width, 30)] ;
    UILabel * label = [[UILabel alloc]initWithFrame:CGRectMake(10, 5, 60, 20)];
    if (section == 0) {
        label.text = @"资讯信息";
    }else{
        label.text = @"产品展示";
    }
    
    label.font = [UIFont systemFontOfSize:12];
    UIButton * btn = [[UIButton alloc]initWithFrame:CGRectMake(tableView.bounds.size.width-70, 5, 60, 20)];
    [btn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [btn setImage:[UIImage imageNamed:@"查看更多"] forState:UIControlStateNormal];
    if (section == 0) {
        [btn addTarget:self action:@selector(moreNewInfo) forControlEvents:UIControlEventTouchUpInside];
    }else{
        [btn addTarget:self action:@selector(moreProductShow) forControlEvents:UIControlEventTouchUpInside];
    }
    [headerView setBackgroundColor:[UIColor groupTableViewBackgroundColor]];
    [headerView addSubview:label];
    [headerView addSubview:btn];
    return headerView;
}



#pragma mark 咨询信息
-(void)moreNewInfo{
    GPOfficeShowController * vc = [[GPOfficeShowController alloc]init];
    [self.navigationController pushViewController:vc animated:YES];
    
}

#pragma mark 产品展示
-(void)moreProductShow{
    DNProductSubControllerViewController * dc = [[DNProductSubControllerViewController alloc]init];
    dc.isSelect=YES;
    [self.navigationController pushViewController:dc animated:YES];
}
@end

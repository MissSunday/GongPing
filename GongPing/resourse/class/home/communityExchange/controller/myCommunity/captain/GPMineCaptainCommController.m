//
//  GPMineCaptainCommController.m
//  公平矿业
//
//  Created by apple on 16/6/14.
//  Copyright © 2016年 xiaoAn. All rights reserved.
//

#import "GPMineCaptainCommController.h"
#import "GPMineCaptainCollectionViewCell.h"


#import "DNCommunityDetailViewController.h"
#import "GPInviteCommunityController.h"



#import "DNPublished-Approve-ViolationsModel.h"
#import "DNPublished_Approve_ViolationsModel+net.h"

#import "UIImageView+WebCache.h"
#import "MJRefresh.h"

@interface GPMineCaptainCommController ()<UICollectionViewDataSource,UICollectionViewDelegate,UICollectionViewDelegateFlowLayout>
@property(nonatomic,strong)NSMutableArray*dataArr;
@property(nonatomic,strong)UICollectionView*collectionView;
@property(nonatomic,assign)NSInteger pageIndex;

@end

@implementation GPMineCaptainCommController

-(NSMutableArray*)dataArr
{
    if (!_dataArr) {
        _dataArr=[[NSMutableArray alloc]init];
    }
    return _dataArr;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    [self refreshData];
    [self createUI];
   
    
}
-(void)createUI
{
    UICollectionViewFlowLayout *flowayout = [[UICollectionViewFlowLayout alloc]init];
    flowayout.minimumInteritemSpacing = 0.f;
    flowayout.minimumLineSpacing = 0.5f;
    
    _collectionView = [[UICollectionView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_W, SCREEN_H-104) collectionViewLayout:flowayout];
    
    [_collectionView registerClass:[GPMineCaptainCollectionViewCell class] forCellWithReuseIdentifier:@"collectionCell"];
    
    [_collectionView setBackgroundColor:[UIColor clearColor]];
    
    
    _collectionView.delegate = self;
    _collectionView.dataSource = self;
    _collectionView.alwaysBounceVertical = YES;
    [self.view addSubview:_collectionView];
    
    __weak GPMineCaptainCommController *weakSelf = self;
    
    
    
    //    //添加下拉刷新
    [self.collectionView addHeaderWithCallback:^{
        [weakSelf refreshData];
    }];
    //    //上啦加载更多
    
    [self.collectionView addFooterWithCallback:^{
        [weakSelf moreData];
    }];
}


#pragma mark------CollectionView的代理方法
-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    if (_dataArr.count) {
        return _dataArr.count;
    }else{
        return 6;
    }
    
}
-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString * id = @"collectionCell";
    GPMineCaptainCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:id forIndexPath:indexPath];
    cell.contentView.backgroundColor = [UIColor clearColor];
    [cell.inviteBtn addTarget:self action:@selector(invite) forControlEvents:UIControlEventTouchUpInside];
    if (_dataArr.count) {
        DNPublished_Approve_ViolationsModel *model=  _dataArr[indexPath.row];
        NSString*imageUrl=[NSString stringWithFormat:@"http://192.168.0.14/XiYuanUpload/%@",model.SQ_PICURL];
        [cell.iconImage sd_setImageWithURL:[NSURL URLWithString:[imageUrl substringToIndex:imageUrl.length-1]]];
        cell.name.text = model.SQ_NAME;
        
    }
    return cell;
    
    
}
-(UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout insetForSectionAtIndex:(NSInteger)section
{
    
    return UIEdgeInsetsMake(5, 10, 0, 10);
    
}
-(CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
    return CGSizeMake((self.view.bounds.size.width-30)/3, 160);
    
    
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    
        DNCommunityDetailViewController * vc = [[DNCommunityDetailViewController alloc]init];
        vc.titleName = @"我的矿长社区";
        [self.navigationController pushViewController:vc animated:YES];
    NSLog(@"...");
}

-(void)invite{
    
    GPInviteCommunityController * vc = [[GPInviteCommunityController alloc]init];
   
    [self.navigationController pushViewController:vc animated:YES];
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
    __weak GPMineCaptainCommController*weakSelf=self;
    NSString*url=[postStatusUrl stringByAppendingString:[NSString  stringWithFormat:@"%@/1/%ld.json",EnterCount,(long)weakSelf.pageIndex]];
    [DNPublished_Approve_ViolationsModel requestWithURL:url
callBack:^(NSArray *array, NSError *error) {
    if (weakSelf.pageIndex==1) {
        [weakSelf.dataArr removeAllObjects];
        
    }
    weakSelf.dataArr=[DNPublished_Approve_ViolationsModel arrayOfModelsFromDictionaries:array];
    [weakSelf.collectionView reloadData];
    [weakSelf.collectionView headerEndRefreshing];
    [weakSelf.collectionView footerEndRefreshing];
    [weakSelf.collectionView reloadData];
    
}];
    
    
}
@end

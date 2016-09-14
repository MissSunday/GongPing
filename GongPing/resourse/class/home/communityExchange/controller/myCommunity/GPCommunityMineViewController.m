//
//  GPCommunityMineViewController.m
//  公平矿业
//
//  Created by apple on 16/6/6.
//  Copyright © 2016年 xiaoAn. All rights reserved.
//

#import "GPCommunityMineViewController.h"
#import "UIBarButtonItem+Item.h"
#import "GPCommunityMainCell.h"
#import "DNCommunityDetailViewController.h"

#import "GPCreatCommunityController.h"

#import "LZPageViewController.h"
#import "GPMineCaptainCommController.h"

#import "GPStillAuditingController.h"

#import "DNJoinCommunityViewController.h"
#import "GPMineMemberController.h"

#import "LZPageViewController.h"

#import "GPCapainPeopleRepairController.h"
#import "GPCaptainContentRepairController.h"

#import "GPCommunityMineList.h"
#import "GPCommunityAllModel.h"

#import "UIImageView+WebCache.h"
@interface GPCommunityMineViewController ()<UICollectionViewDataSource,UICollectionViewDelegate,UICollectionViewDelegateFlowLayout>{
    UICollectionView * _rightCollectionView;
    NSMutableArray * _captainArr;
    NSMutableArray * _memberArr;
}

@end

@implementation GPCommunityMineViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    [self initDate];
    
    
    UICollectionViewFlowLayout *flowayout = [[UICollectionViewFlowLayout alloc]init];
    
    flowayout.minimumInteritemSpacing = 0.f;
    flowayout.minimumLineSpacing = 0.5f;
    
    _rightCollectionView = [[UICollectionView alloc]initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height) collectionViewLayout:flowayout];
    
    [_rightCollectionView registerClass:[GPCommunityMainCell class] forCellWithReuseIdentifier:@"collectionCell"];
    
    [_rightCollectionView setBackgroundColor:[UIColor clearColor]];
    
    
    _rightCollectionView.delegate = self;
    _rightCollectionView.dataSource = self;
   
    [self.view addSubview:_rightCollectionView];
    
    
    
    
}

-(void)initDate{
    _captainArr = [NSMutableArray array];
    _memberArr = [NSMutableArray array];
    [GPCommunityMineList listToolSuccess:^(NSArray *models) {
        for (GPCommunityAllModel * model in models) {
            [_captainArr addObject:model];
        }
        [_rightCollectionView reloadData];
    } failure:^(NSError *error) {
        
    } withTag:@"getkzsq"];
    
    [GPCommunityMineList listToolSuccess:^(NSArray *models) {
        for (GPCommunityAllModel * model in models) {
            [_memberArr addObject:model];
           
        }
        [_rightCollectionView reloadData];
    } failure:^(NSError *error) {
        
    } withTag:@"getkgsq"];
}

#pragma mark------CollectionView的代理方法
-(NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView{
    return 2;
}

-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    
    return 3;
    
}
-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString * id = @"collectionCell";
    GPCommunityMainCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:id forIndexPath:indexPath];
    cell.contentView.backgroundColor = [UIColor clearColor];
    if (indexPath.section == 0) {
        if (_captainArr.count) {
            GPCommunityAllModel *model = [[GPCommunityAllModel alloc]init];
            model = _captainArr[indexPath.row];
            cell.humanNum.text = model.sqName;
            [cell.MineImage sd_setImageWithURL:[NSURL URLWithString:model.sqPicurl] placeholderImage:[UIImage imageNamed:@"index.png"]];
        }
        
    }else{
        if (_memberArr.count) {
            GPCommunityAllModel *model = [[GPCommunityAllModel alloc]init];
            model = _memberArr[indexPath.row];
            cell.humanNum.text = model.sqName;
            [cell.MineImage sd_setImageWithURL:[NSURL URLWithString:model.sqPicurl] placeholderImage:[UIImage imageNamed:@"index.png"]];
        }
        
    }
    return cell;
}

-(UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout insetForSectionAtIndex:(NSInteger)section
{
    
    return UIEdgeInsetsMake(0, 0, 0, 14);
    
}
-(CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
    return CGSizeMake(self.view.bounds.size.width/3 -6, 120);
    
    
}

#pragma mark 创建社区头
-(CGSize)collectionView:(UICollectionView*)collectionView layout:(UICollectionViewLayout*)collectionViewLayout referenceSizeForHeaderInSection:(NSInteger)section
{
    
    
    if(section == 0)
    {
        [self setViewWiewLabelText:@"矿长社区" btnName:@"更多"  withFrame:CGRectMake(0, 0,self.view.bounds.size.width , 30) withTag:1000];
        
        CGSize size = {320, 30};
        return size;
    }
    else
    {
        [self setViewWiewLabelText:@"矿工社区" btnName:@"更多" withFrame:CGRectMake(0, 180,self.view.bounds.size.width , 30) withTag:1001];
        CGSize size = {320, 30};
        return size;
    }
}

#pragma mark section头
-(UIView *)setViewWiewLabelText:(NSString *)LabelName btnName:(NSString *)BtnName  withFrame:(CGRect)frame withTag:(double)num
{
    UIView * view = [[UIView alloc]initWithFrame:frame];
    view.backgroundColor = [UIColor groupTableViewBackgroundColor];
    UILabel * label = [[UILabel alloc]initWithFrame:CGRectMake(10, 5, 100, 20)];
    label.text = LabelName;
    label.textAlignment = NO;
    UIButton * btn = [[UIButton alloc]initWithFrame:CGRectMake(self.view.bounds.size.width - 60, 5, 40, 20)];
    [btn addTarget:self action:@selector(more:) forControlEvents:UIControlEventTouchUpInside];
    [btn setTitle:BtnName forState:UIControlStateNormal];
    btn.tag = num;
    //_moreBtn = btn;
    [btn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [view addSubview:btn];
    [view addSubview:label];
    [self.view addSubview:view];
    return view;
}

#pragma mark 创建社区尾
-(CGSize)collectionView:(UICollectionView*)collectionView layout:(UICollectionViewLayout*)collectionViewLayout referenceSizeForFooterInSection:(NSInteger)section
{
    
    
    if(section == 0)
    {
        [self setBtnName:@"创建社区"  withFrame:CGRectMake(0, 150,self.view.bounds.size.width , 30) withTag:100];
        
        CGSize size = {320, 30};
        return size;
    }
    else
    {
        [self setBtnName:@"加入社区"  withFrame:CGRectMake(0, 330,self.view.bounds.size.width , 30) withTag:101];
        CGSize size = {320, 30};
        return size;
    }
}

#pragma mark section脚
-(UIView *)setBtnName:(NSString *)BtnName withFrame:(CGRect)frame withTag:(double)num
{
    
    UIView * view = [[UIView alloc]initWithFrame:frame];
    view.backgroundColor = [UIColor lightGrayColor];
    UIButton * btn = [[UIButton alloc]initWithFrame:CGRectMake(5, 5, self.view.bounds.size.width-5, 20)];
    [btn addTarget:self action:@selector(createCommunity:) forControlEvents:UIControlEventTouchUpInside];
    [btn setTitle:BtnName forState:UIControlStateNormal];
    btn.tag = num;
    [btn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [view addSubview:btn];
    [self.view addSubview:view];
    return view;
}

#pragma mark 更多
-(void)more:(UIButton *)sender{
   
    if (sender.tag == 1000) {
        LZPageViewController *pageVc = [[LZPageViewController alloc] initWithTitles:@[@"已发布",@"待审核",@"违规"] controllersClass:@[[GPMineCaptainCommController class],[GPStillAuditingController class],[GPCapainPeopleRepairController class]] title:@"社区交流" WithFrame:CGRectMake (0,40,SCREEN_W, SCREEN_H- 104) view:nil];
        pageVc.navigationItem.rightBarButtonItem = [UIBarButtonItem barButtonItemWithTitle:@"管理社区" target:self action:@selector(charge) forControlEvents:UIControlEventTouchUpInside];
        pageVc.title=@"我的矿长社区";
        [self.navigationController pushViewController:pageVc animated:YES];
    }else{
        
        GPMineMemberController * vc = [[GPMineMemberController alloc]init];
        [self.navigationController pushViewController:vc animated:YES];
       // GPLog(@"。。。");
    }
    
}

/**
 *  管理社区
 *
 *  @return <#return value description#>
 */

-(void)charge{
    LZPageViewController *pageVc = [[LZPageViewController alloc] initWithTitles:@[@"内容维护",@"人员维护"] controllersClass:@[[GPCaptainContentRepairController class],[GPCapainPeopleRepairController class],] title:@"社区交流" WithFrame:CGRectMake (0,40,SCREEN_W,SCREEN_H - 104) view:nil];
    
    [self.navigationController pushViewController:pageVc animated:YES];
}

#pragma mark 创建社区 加入社区
-(void)createCommunity:(UIButton *)sender{
   
    if (sender.tag == 100) {
        GPCreatCommunityController * vc = [[GPCreatCommunityController alloc]init];
        [self.navigationController pushViewController:vc animated:YES];
    }else{
        DNJoinCommunityViewController * vc = [[DNJoinCommunityViewController alloc]init];
        [self.navigationController pushViewController:vc animated:YES];
    }
}




- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    DNCommunityDetailViewController * vc = [[DNCommunityDetailViewController alloc]init];
    vc.titleName = @"矿工社区";
    [self.navigationController pushViewController:vc animated:YES];
    
}
@end

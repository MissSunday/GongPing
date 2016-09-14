//
//  GPCaptainContentRepairController.m
//  工平矿业
//
//  Created by apple on 16/6/17.
//  Copyright © 2016年 xiaoAn. All rights reserved.
//

#import "GPCaptainContentRepairController.h"
#import "GPMineCaptainCollectionViewCell.h"
#import "GPInviteCommunityController.h"

#import "LZPageViewController.h"

#import "GPCaptainContentDeleteController.h"
#import "GPCaptainContentTopViewController.h"
@interface GPCaptainContentRepairController ()<UICollectionViewDataSource,UICollectionViewDelegate,UICollectionViewDelegateFlowLayout>{
    UICollectionView * _collectionView;
}


@end

@implementation GPCaptainContentRepairController



- (void)viewDidLoad {
    [super viewDidLoad];
    
    UICollectionViewFlowLayout *flowayout = [[UICollectionViewFlowLayout alloc]init];
    flowayout.minimumInteritemSpacing = 0.f;
    flowayout.minimumLineSpacing = 0.5f;
    
    _collectionView = [[UICollectionView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_W, SCREEN_H) collectionViewLayout:flowayout];
    
    [_collectionView registerClass:[GPMineCaptainCollectionViewCell class] forCellWithReuseIdentifier:@"collectionCell"];
    
    [_collectionView setBackgroundColor:[UIColor clearColor]];
    
    
    _collectionView.delegate = self;
    _collectionView.dataSource = self;
    
    [self.view addSubview:_collectionView];
    
}

#pragma mark------CollectionView的代理方法
-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    
    return 28;
    
}
-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString * id = @"collectionCell";
    GPMineCaptainCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:id forIndexPath:indexPath];
    cell.contentView.backgroundColor = [UIColor clearColor];
    [cell.inviteBtn addTarget:self action:@selector(invite) forControlEvents:UIControlEventTouchUpInside];
    return cell;
    
    
}
-(UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout insetForSectionAtIndex:(NSInteger)section
{
    
    return UIEdgeInsetsMake(0, 10, 0, 10);
    
}
-(CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
    return CGSizeMake(self.view.bounds.size.width/2 -20, 160);
    
    
}

-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    LZPageViewController * pageVc = [[LZPageViewController alloc] initWithTitles:@[@"删除",@"置顶"] controllersClass:@[[GPCaptainContentDeleteController class],[GPCaptainContentTopViewController class]] title:@"社区交流" WithFrame:CGRectMake (0,40,SCREEN_W,SCREEN_H - 104) view:nil];
    [self.navigationController pushViewController:pageVc animated:YES];
}

-(void)invite{
    
    GPInviteCommunityController * vc = [[GPInviteCommunityController alloc]init];
    
    [self.navigationController pushViewController:vc animated:YES];
}
@end

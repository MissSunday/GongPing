//
//  GPMineCommunityLeaderController.m
//  公平矿业
//
//  Created by apple on 16/6/9.
//  Copyright © 2016年 xiaoAn. All rights reserved.
//

#import "GPMineCommunityLeaderController.h"
#import "GPCommunityAllCell.h"
#import "GPMineTopicTableController.h"
@interface GPMineCommunityLeaderController ()

@end

@interface GPMineCommunityLeaderController ()<UICollectionViewDataSource,UICollectionViewDelegate,UICollectionViewDelegateFlowLayout>{
    UICollectionView * _rightCollectionView;
}


@end

@implementation GPMineCommunityLeaderController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    
    UICollectionViewFlowLayout *flowayout = [[UICollectionViewFlowLayout alloc]init];
    
    flowayout.minimumInteritemSpacing = 0.f;
    flowayout.minimumLineSpacing = 0.5f;
    
    _rightCollectionView = [[UICollectionView alloc]initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height) collectionViewLayout:flowayout];
    
    [_rightCollectionView registerClass:[GPCommunityAllCell class] forCellWithReuseIdentifier:@"collectionCell"];
    
    [_rightCollectionView setBackgroundColor:[UIColor clearColor]];
    
    
    _rightCollectionView.delegate = self;
    _rightCollectionView.dataSource = self;
    
    [self.view addSubview:_rightCollectionView];
    
    
    
}



#pragma mark------CollectionView的代理方法
-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    
    return 28;
    
}
-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString * id = @"collectionCell";
    GPCommunityAllCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:id forIndexPath:indexPath];
    cell.contentView.backgroundColor = [UIColor clearColor];
    
    return cell;
    
    
}
-(UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout insetForSectionAtIndex:(NSInteger)section
{
    
    return UIEdgeInsetsMake(0, 10, 0, 10);
    
}
-(CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
    return CGSizeMake(self.view.bounds.size.width/2 -20, 120);
    
    
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    GPMineTopicTableController * vc = [[GPMineTopicTableController alloc]init];
    [self.navigationController pushViewController:vc animated:YES];
    //NSLog(@"点击了");
}

@end

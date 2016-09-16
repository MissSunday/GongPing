//
//  GPMyCommunionController.m
//  工平矿业
//
//  Created by apple on 16/6/10.
//  Copyright © 2016年 xiaoAn. All rights reserved.
//

#import "GPMyCaptainCommunionController.h"
#import "GPCommunityAllCell.h"
@interface GPMyCaptainCommunionController ()<UICollectionViewDataSource,UICollectionViewDelegate,UICollectionViewDelegateFlowLayout>
{
    
    UIButton * _doneBtn;
    UIButton * _statueBtn;
    UIButton * _layerBtn;
    UICollectionView * _collectionView;
}
@end

@implementation GPMyCaptainCommunionController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor yellowColor];
    
    UICollectionViewFlowLayout *flowayout = [[UICollectionViewFlowLayout alloc]init];
    flowayout.minimumInteritemSpacing = 0.f;
    flowayout.minimumLineSpacing = 0.5f;
    
    _collectionView = [[UICollectionView alloc]initWithFrame:CGRectMake(0, 40, SCREEN_W, SCREEN_H) collectionViewLayout:flowayout];
    
    [_collectionView registerClass:[GPCommunityAllCell class] forCellWithReuseIdentifier:@"collectionCell"];
    
    [_collectionView setBackgroundColor:[UIColor clearColor]];
    
    
    _collectionView.delegate = self;
    _collectionView.dataSource = self;
    
    [self.view addSubview:_collectionView];
    
    UIButton *infoBtn=[[UIButton alloc]initWithFrame:CGRectMake(0, 0, SCREEN_W/3, 40)];
    [infoBtn setTitle:@"已发布" forState:UIControlStateNormal];
    [infoBtn setBackgroundColor:[UIColor colorWithRed:32 / 255.0 green:34 / 255.0 blue:47/ 255.0 alpha:1]];
    [infoBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [infoBtn addTarget:self action:@selector(newInfo) forControlEvents:UIControlEventTouchUpInside];
    _doneBtn=infoBtn;
    [self.view addSubview:_doneBtn];
    
    UIButton *proBtn=[[UIButton alloc]initWithFrame:CGRectMake(SCREEN_W/3, 0, SCREEN_W/3, 40)];
    [proBtn setTitle:@"待审核" forState:UIControlStateNormal];
    [proBtn setBackgroundColor:[UIColor blackColor]];
    [proBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [proBtn addTarget:self action:@selector(productInfo) forControlEvents:UIControlEventTouchUpInside];
    _statueBtn=proBtn;
    [self.view addSubview:_statueBtn];
    
    UIButton *Btn=[[UIButton alloc]initWithFrame:CGRectMake( 2*SCREEN_W/3, 0, SCREEN_W/3, 40)];
    [Btn setTitle:@"违规" forState:UIControlStateNormal];
    [Btn setBackgroundColor:[UIColor blackColor]];
    [Btn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [Btn addTarget:self action:@selector(illegal) forControlEvents:UIControlEventTouchUpInside];
    _layerBtn=Btn;
    [self.view addSubview:_layerBtn];
}

#pragma mark 咨询信息
-(void)newInfo{
    
    [_doneBtn setBackgroundColor:[UIColor colorWithRed:32 / 255.0 green:34 / 255.0 blue:47/ 255.0 alpha:1]];
    [_statueBtn setBackgroundColor:[UIColor blackColor]];
    [_layerBtn setBackgroundColor:[UIColor blackColor]];
}

#pragma mark 产品信息
-(void)productInfo{
    
    [_statueBtn setBackgroundColor:[UIColor colorWithRed:32 / 255.0 green:34 / 255.0 blue:47/ 255.0 alpha:1]];
    [_doneBtn setBackgroundColor:[UIColor blackColor]];
    [_layerBtn setBackgroundColor:[UIColor blackColor]];
    
}

#pragma mark 违规
-(void)illegal{
    [_layerBtn setBackgroundColor:[UIColor colorWithRed:32 / 255.0 green:34 / 255.0 blue:47/ 255.0 alpha:1]];
    [_statueBtn setBackgroundColor:[UIColor blackColor]];
    [_doneBtn  setBackgroundColor:[UIColor blackColor]];
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
    return CGSizeMake(self.view.bounds.size.width/2 -20, 160);
    
    
}




@end

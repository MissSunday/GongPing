//
//  GPCommunityAllViewController.m
//  公平矿业
//
//  Created by apple on 16/6/6.
//  Copyright © 2016年 xiaoAn. All rights reserved.
//

#import "GPCommunityAllViewController.h"

#import "KFSearchViewController.h"
#import "UIBarButtonItem+Item.h"
#import "GPCommunityAllCell.h"

#import "DNCommunityRankController.h"
#import "DNCommunityListTableViewCell.h"
#import "DNCommunityDetailViewController.h"


#import "GPCommunityAllModel.h"
#import "GPCommunityAllList.h"

#import "UIImageView+WebCache.h"
@interface GPCommunityAllViewController ()<UICollectionViewDataSource,UICollectionViewDelegateFlowLayout>

@property(nonatomic,strong)UICollectionView*rightCollectionView;
@property(nonatomic,strong)NSMutableArray*dataArr;
@end

@implementation GPCommunityAllViewController

-(NSMutableArray*)dataArr
{
    if (!_dataArr) {
        _dataArr=[[NSMutableArray alloc]init];
    }
    return _dataArr;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    [self downloadData];
    UICollectionViewFlowLayout *flowayout = [[UICollectionViewFlowLayout alloc]init];
    flowayout.minimumInteritemSpacing = 0.f;
    flowayout.minimumLineSpacing = 0.5f;
    
    _rightCollectionView = [[UICollectionView alloc]initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height) collectionViewLayout:flowayout];
    
    [_rightCollectionView registerClass:[GPCommunityAllCell class] forCellWithReuseIdentifier:@"collectionCell"];
    
    [_rightCollectionView setBackgroundColor:[UIColor redColor]];
    
    
    _rightCollectionView.delegate = self;
    _rightCollectionView.dataSource = self;
    
    [self.view addSubview:_rightCollectionView];
    
}
#pragma mark------CollectionView的代理方法

-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    if (_dataArr) {
        return _dataArr.count+1 ;
    }
    else{
     return 9;
    }
    
    
}
-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString * iden = @"collectionCell";
    GPCommunityAllCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:iden forIndexPath:indexPath];
    cell.contentView.backgroundColor = [UIColor clearColor];
    if (_dataArr.count) {
        if (indexPath.item!=_dataArr.count) {
         GPCommunityAllModel*model=self.dataArr[indexPath.item];
                    cell.name.text = model.sqName;
                    [cell.imageStr sd_setImageWithURL:[NSURL URLWithString:model.sqPicurl]placeholderImage:[UIImage imageNamed:@"index.png"]];
        }
        else
        {
            cell.name.text = @"更多社区";
        }
       
    }

 
    
    return cell;
    
    
}
-(UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout insetForSectionAtIndex:(NSInteger)section
{
    
    return UIEdgeInsetsMake(10, 5, 5, 5);
 
}
-(CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
    return CGSizeMake((self.view.bounds.size.width-30)/3, 120);
   
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.row == 8) {
        DNCommunityRankController*rc=[DNCommunityRankController new];
        [self.navigationController pushViewController:rc animated:YES];
    }else{
        DNCommunityDetailViewController * vc = [[DNCommunityDetailViewController alloc]init];
        vc.titleName = @"矿工社区";
        [self.navigationController pushViewController:vc animated:YES];
    }
    
}
#pragma mark-加载数据
-(void)downloadData{
    __weak GPCommunityAllViewController*weakSelf=self;
    [GPCommunityAllList listToolSuccess:^(NSArray *models) {
        for (GPCommunityAllModel * model in models) {
            [weakSelf.dataArr addObject:model];
        }
        [weakSelf.rightCollectionView reloadData];
    } failure:^(NSError *error) {
        
    }];
}

@end

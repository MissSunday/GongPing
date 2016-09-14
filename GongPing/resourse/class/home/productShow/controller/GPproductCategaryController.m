//
//  GPproductCategaryController.m
//  工平矿业
//
//  Created by apple on 16/6/4.
//  Copyright © 2016年 xiaoAn. All rights reserved.
//

#import "GPproductCategaryController.h"
#import "LeftTableViewCell.h"
#import "RightCollectionViewCell.h"
#import "DNProductSubControllerViewController.h"
#import "CZHttpTool.h"
#import "GPCategaryIDModel.h"

#import "GPCategaryIDModel+net.h"

#import "productSubModel.h"
#import "productSubModel+net.h"
#define SCREEN_WIDTH  self.view.bounds.size.width
@interface GPproductCategaryController ()

@end

@implementation GPproductCategaryController
#pragma mark 懒加载创建数组
-(NSMutableArray*)myData
{
    if (!_myData) {
        _myData=[[NSMutableArray alloc]init];
    }
    return _myData;
    
}
- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"产品展示";
    self.view.backgroundColor = [UIColor groupTableViewBackgroundColor];
    [self creatTableView];
    [self CreatRightCollectionView];
    _dataArr=[[NSMutableArray alloc]initWithObjects:@"矿石产品",@"煤炭产品",@"设备产品",@"药剂产品",@"技术服务",@"其他", nil];
}
-(void)creatTableView{
    _leftTableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, 0.3*SCREEN_WIDTH, self.view.frame.size.height)];
    _leftTableView.backgroundColor = [UIColor groupTableViewBackgroundColor];
    _leftTableView.delegate = self;
    _leftTableView.dataSource = self;
    [self.view addSubview:_leftTableView];
}

-(void)CreatRightCollectionView
{
    UICollectionViewFlowLayout *flowayout = [[UICollectionViewFlowLayout alloc]init];
    
    flowayout.minimumInteritemSpacing = 0.f;
    flowayout.minimumLineSpacing = 0.5f;
    
    _rightCollectionView = [[UICollectionView alloc]initWithFrame:CGRectMake(0.3*SCREEN_WIDTH, 64, self.view.frame.size.width-0.3*SCREEN_WIDTH, self.view.frame.size.height) collectionViewLayout:flowayout];
    
    [_rightCollectionView registerClass:[RightCollectionViewCell class] forCellWithReuseIdentifier:@"RightCollectionViewCell"];
    
    [_rightCollectionView setBackgroundColor:[UIColor whiteColor]];
    
    
    _rightCollectionView.delegate = self;
    _rightCollectionView.dataSource = self;
    
    
    //RR添加
    _subStr=[productSubUrl stringByAppendingString:@"1.json"];
    [self downloadData];
    [self.view addSubview:_rightCollectionView];
    [self.rightCollectionView reloadData];
    
}
//实现TableView的代理方法;
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    
    return _dataArr.count;
    
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    LeftTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    
    if (!cell)
    {
        NSArray *ArrayCell = [[NSBundle mainBundle]loadNibNamed:@"LeftTableViewCell" owner:self options:nil];
        cell = ArrayCell[0];
    }
    cell.tableview_textLabel.text = _dataArr[indexPath.row];
    cell.selectionStyle = 1;//设置Cell选中效果
    cell.textLabel.textAlignment = NSTextAlignmentCenter;
    return cell;
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    return 44;
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView scrollToRowAtIndexPath:indexPath atScrollPosition:UITableViewScrollPositionTop animated:YES];
    
    [_rightCollectionView scrollRectToVisible:CGRectMake(0, 0, self.rightCollectionView.frame.size.width, self.rightCollectionView.frame.size.height) animated:YES];
    _selectedIndex = indexPath.row;
    
    
    self.fID=[NSString stringWithFormat:@"%ld",_selectedIndex+1];
    _subStr=[productSubUrl stringByAppendingString:[NSString stringWithFormat:@"%ld.json",_selectedIndex+1]];
    [self downloadData];
}

#pragma mark------CollectionView的代理方法
-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return _myData.count;
    
}
-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    
    RightCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"RightCollectionViewCell" forIndexPath:indexPath];
    //根据左边点击的indepath更新右边内容;
    cell.collectionView_imageview.image = [UIImage imageNamed:@"my_guess_icon"];
   
    productSubModel*model=_myData[indexPath.row];
    cell.collectionView_Label.text = model.SEC_NAME;
    _selectedId = indexPath.row;
    return cell;
    
    
}
-(UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout insetForSectionAtIndex:(NSInteger)section
{
    
    return UIEdgeInsetsMake(5, 10, 0, 10);
    
}
-(CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
    return CGSizeMake(100, 120);
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    productSubModel*model=_myData[indexPath.row];
    
    self.sID=model.SEC_ID;
    DNProductSubControllerViewController * dc= [[DNProductSubControllerViewController alloc]init];
    dc.fId=self.fID;
    dc.sId=self.sID;
    [self.navigationController pushViewController:dc animated:YES];
}
#pragma mark 数据加载
-(void)downloadData
{

    __weak GPproductCategaryController*gpc=self;
    [productSubModel requestWithURL:_subStr callBack:^(NSDictionary*dic, NSError *error) {
        
        NSArray*modelArr=dic[@"object"];
        gpc.myData=[productSubModel arrayOfModelsFromDictionaries:modelArr];
        [gpc.rightCollectionView reloadData];
    }];
  
}
@end


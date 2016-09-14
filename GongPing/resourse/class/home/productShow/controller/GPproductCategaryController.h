//
//  GPproductCategaryController.h
//  工平矿业
//
//  Created by apple on 16/6/4.
//  Copyright © 2016年 xiaoAn. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface GPproductCategaryController : UIViewController<UITableViewDelegate,UITableViewDataSource,UICollectionViewDataSource,UICollectionViewDelegate,UICollectionViewDelegateFlowLayout>
@property (nonatomic, strong) UICollectionView *rightCollectionView;
@property (nonatomic ,strong) NSMutableArray *dataArr;
@property (nonatomic ,strong) NSMutableArray *myData;
@property (nonatomic, strong) UITableView *leftTableView;
//拼接二级产品url
@property(nonatomic,copy)NSString*subStr;
@property (nonatomic ,assign) NSInteger selectedIndex;
@property (nonatomic ,assign) NSInteger selectedId;

@property (nonatomic,strong) NSMutableArray * rightArr;

@property (nonatomic ,copy)NSString * name;
@property(nonatomic,copy)NSString*fID;
@property(nonatomic,copy)NSString*sID;
@end

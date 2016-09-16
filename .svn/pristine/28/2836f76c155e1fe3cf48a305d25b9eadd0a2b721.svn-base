//
//  DNAdvisoryDetailViewController.m
//  工平矿业
//
//  Created by apple on 16/7/12.
//  Copyright © 2016年 xiaoAn. All rights reserved.
//

#import "DNAdvisoryDetailViewController.h"

#import "DNDetailModel.h"
#import "DNDetailModel+net.h"
@interface DNAdvisoryDetailViewController ()
@property(nonatomic,strong)UILabel *titleLabel;

@property(nonatomic,strong)UITextView *describeLabel;
@property(nonatomic,strong)NSMutableArray*dataArr;

@end

@implementation DNAdvisoryDetailViewController
-(NSMutableArray*)dataArr
{

    if (!_dataArr) {
        _dataArr=[[NSMutableArray alloc]init];
    }
    return _dataArr;
}
- (void)viewDidLoad {
    
    [super viewDidLoad];
    
  

    [self downloadData];
    
    _titleLabel = [[UILabel alloc]initWithFrame:CGRectMake(0, 64, [UIScreen mainScreen].bounds.size.width, 50)];
    _titleLabel.font = [UIFont systemFontOfSize:23];
    [self.view addSubview:_titleLabel];
    
    self.automaticallyAdjustsScrollViewInsets = NO;
    _describeLabel = [[UITextView alloc]initWithFrame:CGRectMake(0, 64+50, [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height)];
    _describeLabel.font = [UIFont systemFontOfSize:20];
    //_describeLabel.autoresizingMask = UIViewAutoresizingFlexibleHeight;//自适应高度
    _describeLabel.editable = NO;
    
    _describeLabel.textAlignment = NSTextAlignmentLeft;
    [self.view addSubview:_describeLabel];
}


#pragma mark-数据加载
-(void)downloadData
{
    NSString*url=[AdvisoryDetailUrl stringByAppendingString:[NSString stringWithFormat:@"%@.json",self.pdoductId]];
    __weak DNAdvisoryDetailViewController*weakSelf=self;
   [DNDetailModel requestWithURL:url callBack:^(NSDictionary *dic, NSError *error) {
       
       DNDetailModel*model=[[DNDetailModel alloc]initWithDictionary:dic error:nil];
       NSLog(@"------%@",model.zxTitle);
      weakSelf.titleLabel.text=model.zxTitle;
       weakSelf.describeLabel.text=model.zxDetail;
   }];

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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

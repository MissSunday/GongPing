//
//  DNProDetailControllerViewController.m
//  公平矿业
//
//  Created by apple on 16/7/9.
//  Copyright © 2016年 xiaoAn. All rights reserved.
//

#import "DNProDetailControllerViewController.h"
#import "UIImageView+WebCache.h"

#import "DNProductDesModel.h"
#import "DNProductDesModel+net.h"
#import "DNMessageViewController.h"
@interface DNProDetailControllerViewController ()
@property (weak, nonatomic) IBOutlet UIImageView *picImageView;
@property (weak, nonatomic) IBOutlet UILabel *labNam;
@property (weak, nonatomic) IBOutlet UILabel *labDes;
@property (weak, nonatomic) IBOutlet UIButton *phoneBtn;
@property (weak, nonatomic) IBOutlet UIButton *sendBtn;
@property(nonatomic,copy)NSString*phoneNum;


@property(nonatomic,strong)NSMutableArray*dataArr;
@property(nonatomic,strong)DNProductDesModel*model;
@end

@implementation DNProDetailControllerViewController
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
    self.title=@"产品详情";
    [self doloadData];
}
- (IBAction)phoneBtn:(id)sender {
    
    //真机测试
     [[UIApplication sharedApplication] openURL:[NSURL URLWithString:
                                                 [NSString stringWithFormat:@"tel://%@",self.phoneNum]]];
}
- (IBAction)sendBtn:(id)sender {
    DNMessageViewController*mvc=[[DNMessageViewController alloc]init];
    mvc.productId=self.productId;
    [self.navigationController pushViewController:mvc animated:YES];
}


#pragma mark-加载数据
-(void)doloadData
{
    __weak DNProDetailControllerViewController*dc=self;
    NSString*url=[productDesUrl stringByAppendingString:[NSString stringWithFormat:@"%@.json",dc.productId]];
    [DNProductDesModel requestWithURL:url callBack:^(NSDictionary*dic, NSError *error) {
        DNProductDesModel*model=[[DNProductDesModel alloc]initWithDictionary:dic error:nil];
        dc.labNam.text=model.productName;
        dc.labDes.text=model.productDetail;
        NSString*picUrl=[NSString stringWithFormat:@"http://192.168.0.14/XiYuanUpload/%@",model.productPicurl];
        dc.phoneNum=model.productPhone;
        [dc.picImageView sd_setImageWithURL:[NSURL URLWithString:[picUrl substringToIndex:picUrl.length-1]]];

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

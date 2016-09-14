//
//  GPMallRepairController.m
//  工平矿业
//
//  Created by apple on 16/6/7.
//  Copyright © 2016年 xiaoAn. All rights reserved.
//

#import "GPMallRepairController.h"
#import "CZTextView.h"


#import "MessagePhotoView.h"//图片视图 01.22
#import "ZBMessageShareMenuView.h"

#import "UIBarButtonItem+Item.h"
#import "CZHttpTool.h"
#import "AFNetworking.h"

#import "MBProgressHUD+MJ.h"
@interface GPMallRepairController ()<UITextViewDelegate,UIGestureRecognizerDelegate,MessagePhotoViewDelegate,ZBMessageShareMenuViewDelegate>
{
    UITextField * _nameText;
    CZTextView * _textView;
    UIButton * _upLoadBtn;
}
@property (nonatomic,strong) MessagePhotoView *photoView;
@end

@implementation GPMallRepairController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.view setBackgroundColor:[UIColor groupTableViewBackgroundColor]];
    self.navigationItem.title = @"商城维护";
    UIBarButtonItem *right = [UIBarButtonItem barButtonItemWithTitle:@"保存" target:self action:@selector(optionRightButtonAction) forControlEvents:UIControlEventTouchUpInside];
    // 设置导航条的按钮
    self.navigationItem.rightBarButtonItem = right;
    
    //添加商城名称
    [self buildUI];
    
    //添加商城简介
    [self setUpTextView];
    
    //上传商城图片
    [self upLoadPic];
    [self upLoadPho];
}


#pragma mark 添加商城名称
-(void)buildUI{
    UILabel * label =[[UILabel alloc]initWithFrame:CGRectMake(10, 75, 100, 20)];
    label.text = @"商城名称:";
    label.font = [UIFont systemFontOfSize:13];
    [self.view addSubview:label];
    
    UITextField * nameText = [[UITextField alloc]initWithFrame:CGRectMake(110, 70, self.view.bounds.size.width - 130, 30)];
    nameText.borderStyle = UITextBorderStyleRoundedRect;
    _nameText = nameText;
    [self.view addSubview:_nameText];
    
    UILabel * labelTwo =[[UILabel alloc]initWithFrame:CGRectMake(10, 110, 120, 20)];
    labelTwo.text = @"商城简介:";
    labelTwo.font = [UIFont systemFontOfSize:13];
    [self.view addSubview:labelTwo];
}

#pragma mark - 添加textView
- (void)setUpTextView
{
    CZTextView *textView = [[CZTextView alloc]initWithFrame:CGRectMake(10, 140, self.view.bounds.size.width - 20, 100)];
    _textView = textView;
    textView.font = [UIFont systemFontOfSize:15];
    [self.view addSubview:textView];
    
    // 默认允许垂直方向拖拽
    textView.alwaysBounceVertical = YES;
    
    _textView.delegate = self;
}


#pragma mark 上传图片按钮
-(void)upLoadPic{
    // 上传图片按钮
    UIButton *btn = [[UIButton alloc]initWithFrame:CGRectMake(50, 250, self.view.bounds.size.width - 100, 30)];
    [btn setTitle:@"添加商城图片" forState:UIControlStateNormal];
    btn.layer.cornerRadius = 8;
    btn.backgroundColor = [UIColor grayColor];
    [btn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [btn setTitleColor:[UIColor whiteColor] forState:UIControlStateDisabled];
    
    _upLoadBtn = btn;
    [self.view addSubview:_upLoadBtn];
}


//添加图片
-(void)upLoadPho{
    if (!self.photoView)
    {
        self.photoView = [[MessagePhotoView alloc]initWithFrame:CGRectMake(0,300,self.view.frame.size.width, 200)];
        [self.view addSubview:self.photoView];
        self.photoView.delegate = self;
        
    }
}


//实现代理方法
-(void)addPicker:(UIImagePickerController *)picker{
    
    [self presentViewController:picker animated:YES completion:nil];
}

#pragma mark - ZBMessageShareMenuView Delegate
- (void)didSelecteShareMenuItem:(ZBMessageShareMenuItem *)shareMenuItem atIndex:(NSInteger)index{
    
    
    
}

-(void)optionRightButtonAction{
   
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    //发送网络请求
    NSString * name = _nameText.text;
    NSString * info = _textView.text;
    NSString * str = [NSString stringWithFormat:@"Http://192.168.0.31/XYGPKY_App/Product/myScToUpdate/%@/%@/%@/%@.json",@"1",[name stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding],[info stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding],@"201606130906947002"];
    [manager POST:str parameters:nil success:^(AFHTTPRequestOperation *operation, id responseObject) {
        [MBProgressHUD showSuccess:@"保存成功"];
        [self.navigationController popToRootViewControllerAnimated:YES];
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        [MBProgressHUD showSuccess:@"保存失败"];
    }];

    
    
}

@end

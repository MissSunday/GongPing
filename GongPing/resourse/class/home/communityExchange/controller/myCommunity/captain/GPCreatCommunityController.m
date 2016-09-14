//
//  GPCreatCommunityController.m
//  公平矿业
//
//  Created by apple on 16/6/14.
//  Copyright © 2016年 xiaoAn. All rights reserved.
//

#import "GPCreatCommunityController.h"
#import "UIBarButtonItem+Item.h"


#import "MessagePhotoView.h"//图片视图 01.22
#import "ZBMessageShareMenuView.h"
@interface GPCreatCommunityController ()<UITextFieldDelegate,UIGestureRecognizerDelegate,MessagePhotoViewDelegate,ZBMessageShareMenuViewDelegate>{
    UIButton * _upLoadBtn;
}
@property (nonatomic,strong)UITextField * tef;
@property (nonatomic,strong) MessagePhotoView *photoView;
@end

@implementation GPCreatCommunityController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self buildUI];
    self.navigationItem.title = @"创建社区";
    self.view.backgroundColor = [UIColor groupTableViewBackgroundColor];
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc]initWithTitle:@"创建" style:0 target:self action:@selector(creatCommunity)];
    //添加手势，点击屏幕其他区域关闭键盘的操作
    UITapGestureRecognizer *gesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(hidenKeyboard)];
    gesture.numberOfTapsRequired = 1;
    gesture.delegate = self;
    //上传商城图片
    [self upLoadPic];
    [self upLoadPho];
}

- (void)hidenKeyboard
{
    [_tef resignFirstResponder];
}

-(void)buildUI{
    UILabel * label =[[UILabel alloc]initWithFrame:CGRectMake(10, 75, 100, 20)];
    label.text = @"社区名:";
    label.font = [UIFont systemFontOfSize:13];
    [self.view addSubview:label];
    
    UITextField * nameText = [[UITextField alloc]initWithFrame:CGRectMake(80, 70, self.view.bounds.size.width - 130, 30)];
    nameText.borderStyle = UITextBorderStyleRoundedRect;
    _tef = nameText;
    //nameText.placeholder = @"请输入资讯信息标题";
    [self.view addSubview:_tef];
}

-(void)creatCommunity{
    GPLog(@"....");
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

@end

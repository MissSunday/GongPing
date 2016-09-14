//
//  GPMyMallController.m
//  工平矿业
//
//  Created by apple on 16/6/7.
//  Copyright © 2016年 xiaoAn. All rights reserved.
//

#import "GPMyMallController.h"

#import "UIButton+Extension.h"
#import "GPLabel.h"

#import "CZTextView.h"

#import "GPMallRepairController.h"
@interface GPMyMallController ()<UITextViewDelegate,UIGestureRecognizerDelegate>

@property (nonatomic, weak) CZTextView *textView;

@end
@implementation GPMyMallController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor groupTableViewBackgroundColor];
    self.navigationItem.title = @"我的商城";
    [self buildUI];
    [self setUpTextView];
    //添加手势，点击屏幕其他区域关闭键盘的操作
    UITapGestureRecognizer *gesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(hidenKeyboard)];
    gesture.numberOfTapsRequired = 1;
    gesture.delegate = self;
    [self.view addGestureRecognizer:gesture];
}

- (void)hidenKeyboard
{
    [_textView resignFirstResponder];
    
}

-(void)buildUI{
    UIImageView * imageView = [[UIImageView alloc]initWithFrame:CGRectMake(0, 64, SCREEN_W, 100)];
    imageView.image = [UIImage imageNamed:@"voucherimg"];
    [self.view addSubview:imageView];
    
    //创建商城名称
    //CGRectW:10 CGRectY:180 CGRectwidth:60 CGRectW:20
    UILabel * label = [UILabel labelWithName:@"商城名称:" WithFrame:CGRectMake(10, 180, 60, 20) Font:13];
    [self.view addSubview:label];
    UILabel * labelDetail = [UILabel labelWithName:@"你好啊，哈哈哈哈哈哈" WithFrame:CGRectMake(80, 180, SCREEN_W - 90, 20) Font:15];
    [self.view addSubview:labelDetail];
    
    UIButton * btn = [UIButton createButtonWithFrame:CGRectMake(30, 370, SCREEN_W - 60, 30) Title:@"商城维护" Target:self Selector:@selector(goToMallRepaire)];
    [self.view addSubview:btn];
}

#pragma mark 跳转到商城维护页面
-(void)goToMallRepaire{
    GPMallRepairController * vc = [[GPMallRepairController alloc]init];
    [self.navigationController pushViewController:vc animated:YES];
}

#pragma mark - 添加textView
- (void)setUpTextView
{
    CZTextView *textView = [[CZTextView alloc]initWithFrame:CGRectMake(10, 230, self.view.bounds.size.width - 20, 100)];
    _textView = textView;
    // 设置占位符
//    textView.placeHolder = @"xixixixiixja年底时就按你烦死你恩违反 我费发放";
    textView.font = [UIFont systemFontOfSize:15];
    [self.view addSubview:textView];
    
    // 默认允许垂直方向拖拽
    textView.alwaysBounceVertical = YES;
    
    // 监听文本框的输入
    /**
     *  Observer:谁需要监听通知
     *  name：监听的通知的名称
     *  object：监听谁发送的通知，nil:表示谁发送我都监听
     *
     */
    
    // 监听拖拽
    _textView.delegate = self;
}

@end

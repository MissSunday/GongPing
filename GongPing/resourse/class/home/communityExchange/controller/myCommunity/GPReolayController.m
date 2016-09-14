//
//  GPReolayController.m
//  公平矿业
//
//  Created by apple on 16/6/15.
//  Copyright © 2016年 xiaoAn. All rights reserved.
//

#import "GPReolayController.h"

#import "CZTextView.h"
@interface GPReolayController ()<UITextViewDelegate,UIGestureRecognizerDelegate>
@property (nonatomic, weak) CZTextView *textView;
@end

@implementation GPReolayController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.title = @"回复";
    self.view.backgroundColor = [UIColor groupTableViewBackgroundColor];
    CZTextView *textView = [[CZTextView alloc]initWithFrame:CGRectMake(10, 80, self.view.bounds.size.width - 20, 140)];
    _textView = textView;
    
    textView.font = [UIFont systemFontOfSize:15];
    textView.placeHolder = @"请输入回复内容，最多可输入200个汉字";
    [self.view addSubview:textView];
    
    // 默认允许垂直方向拖拽
    textView.alwaysBounceVertical = YES;
    
    // 监听拖拽
    _textView.delegate = self;
    
    UIButton * btn = [[UIButton alloc]initWithFrame:CGRectMake(30, 250, SCREEN_W-60, 30)];
    [btn setTitle:@"回复" forState:UIControlStateNormal];
    [btn addTarget:self action:@selector(publishTopic) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btn];
    btn.backgroundColor = [UIColor orangeColor];
    btn.layer.cornerRadius = 10;
}

-(void)publishTopic{
    GPLog(@"--");
}

@end

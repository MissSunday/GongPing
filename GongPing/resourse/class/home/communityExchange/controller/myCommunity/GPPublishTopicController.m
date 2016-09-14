//
//  GPPublishTopicController.m
//  工平矿业
//
//  Created by apple on 16/6/14.
//  Copyright © 2016年 xiaoAn. All rights reserved.
//

#import "GPPublishTopicController.h"
#import "CZTextView.h"
@interface GPPublishTopicController ()<UITextViewDelegate,UIGestureRecognizerDelegate>
@property (nonatomic, strong) CZTextView *textView;
@end

@implementation GPPublishTopicController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.title = @"发布话题";
    self.view.backgroundColor = [UIColor groupTableViewBackgroundColor];
    _textView = [[CZTextView alloc]initWithFrame:CGRectMake(10, 80, self.view.bounds.size.width - 20, 140)];
    
    _textView.font = [UIFont systemFontOfSize:15];
    
    _textView.placeHolder = @"请输入话题内容，最多可输入30个汉字";
    [self.view addSubview:_textView];
    
    // 默认允许垂直方向拖拽
    _textView.alwaysBounceVertical = YES;
    
    // 监听拖拽
    _textView.delegate = self;
    
    UIButton * btn = [[UIButton alloc]initWithFrame:CGRectMake(30, 250, SCREEN_W-60, 30)];
    [btn setTitle:@"发布" forState:UIControlStateNormal];
    [btn addTarget:self action:@selector(publishTopic) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btn];
    btn.backgroundColor = [UIColor orangeColor];
    btn.layer.cornerRadius = 10;
}
- (BOOL)textViewShouldBeginEditing:(UITextView *)textView
{
    
    _textView.placeHolder=nil;
    return YES;
}
-(void)publishTopic{
    [self.textView resignFirstResponder];
    [self.navigationController popViewControllerAnimated:YES];
}

@end

//
//  GPNewsSendController.m
//  工平矿业
//
//  Created by apple on 16/6/4.
//  Copyright © 2016年 xiaoAn. All rights reserved.
//

#import "GPNewsSendController.h"

#import "Member.h"
#import "MBProgressHUD+MJ.h"
#import "AFNetworking.h"

@interface GPNewsSendController ()<UITextViewDelegate,UIGestureRecognizerDelegate>


@end

@implementation GPNewsSendController




- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor groupTableViewBackgroundColor];
    self.navigationItem.title = @"资讯信息发布";
  
    
 
    
    [self addUI];
    
    
    // 添加textView
    [self setUpTextView];
    
    // 发布按钮
    UIButton *btn = [[UIButton alloc]initWithFrame:CGRectMake(50, _textView.frame.origin.y+200 +20, self.view.bounds.size.width - 100, 30)];
    [btn setTitle:@"发布信息" forState:UIControlStateNormal];
    btn.layer.cornerRadius = 8;
    btn.backgroundColor = [UIColor colorWithRed:248/255.0f green:144/255.0f blue:34/255.0f alpha:1];
    [btn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [btn setTitleColor:[UIColor redColor] forState:UIControlStateDisabled];
    
    _btnSend = btn;
    //_btnSend.enabled = NO;
    // 监听按钮点击
    [btn addTarget:self action:@selector(postNews) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:_btnSend];
    

    
    
    //添加手势，点击屏幕其他区域关闭键盘的操作
    UITapGestureRecognizer *gesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(hidenKeyboard)];
    gesture.numberOfTapsRequired = 1;
    gesture.delegate = self;
    [self.view addGestureRecognizer:gesture];
}

#pragma  mark 点击隐藏键盘

#pragma mark - 键盘操作

- (void)hidenKeyboard
{
    [_textView resignFirstResponder];
    [_nameText resignFirstResponder];
}


-(void)addUI{
    UILabel * label =[[UILabel alloc]initWithFrame:CGRectMake(10, 75+15, 100, 20)];
    label.text = @"资讯信息标题";
    label.font = [UIFont systemFontOfSize:16];
    [self.view addSubview:label];
    
    UITextField * nameText = [[UITextField alloc]initWithFrame:CGRectMake(110+10, 70+15, self.view.bounds.size.width - 130, 30)];
    nameText.borderStyle = UITextBorderStyleRoundedRect;
    _nameText = nameText;
    //nameText.placeholder = @"请输入资讯信息标题";
    [self.view addSubview:_nameText];
    /*
    UILabel * labelTwo =[[UILabel alloc]initWithFrame:CGRectMake(10, 110, 120, 20)];
    labelTwo.text = @"资讯信息详细内容";
    labelTwo.font = [UIFont systemFontOfSize:13];
    [self.view addSubview:labelTwo];
     */
    
    
}

#pragma mark - 添加textView
- (void)setUpTextView
{
    CZTextView *textView = [[CZTextView alloc]initWithFrame:CGRectMake(10, 140, self.view.bounds.size.width - 20, 200)];
    _textView = textView;
    // 设置占位符
    textView.placeHolder = @"请输入要发布的内容";
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
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(textChange) name:UITextViewTextDidChangeNotification object:nil];
    
    // 监听拖拽
    _textView.delegate = self;
}

#pragma mark - 文字改变的时候调用
- (void)textChange
{
    //NSLog(@"%lu",_textView.text.length);
    // 判断下textView有木有内容
    if (_textView.text.length ) { // 有内容
        _textView.hidePlaceHolder = YES;
        //_btnSend.enabled = YES;
    }else{
        _textView.hidePlaceHolder = NO;
        //_btnSend.enabled = NO;
        
    }
}

- (void)dealloc
{
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}


// 发送消息


-(void)postNews{
    if (_textView.text.length && _nameText.text.length ) {
        
        Member *memberInfo = [[Member allObjects] objectAtIndex:0];
        NSLog(@"%@",memberInfo.userId);
      
        NSString *urlStr = [NSString stringWithFormat:@"Http://192.168.0.31/XYGPKY_App/Zixun/addZixunByUser/%@/%@/%@.json",_nameText.text,_nameText.text,memberInfo.userId];
        
        
        NSString *ecodeStr = [urlStr stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
        
        AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
        
        [manager POST:ecodeStr parameters:nil success:^(AFHTTPRequestOperation *operation, id responseObject) {
            [MBProgressHUD showSuccess:@"发送咨询成功"];
            [self.navigationController popViewControllerAnimated:YES];
        } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
            NSLog(@"发送失败%@",error);

        }];
        
        
        
        
    }else{
        [MBProgressHUD showError:@"请您补全信息"];
    }
    
}




@end

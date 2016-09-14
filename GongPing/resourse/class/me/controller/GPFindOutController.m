//
//  GPFindOutController.m
//  公平矿业
//
//  Created by apple on 16/6/11.
//  Copyright © 2016年 xiaoAn. All rights reserved.
//

#import "GPFindOutController.h"

@interface GPFindOutController ()<UITextFieldDelegate, UIGestureRecognizerDelegate>{
    UIButton *l_timeButton;
    UITextField *_tfsms;
    UITextField *_tfmp;
    NSString *smscode;
    
    UITextField *_psd;
    UITextField *_surePsd;
}

@end

@implementation GPFindOutController


#define SCREEN_WIDTH self.view.bounds.size.width




- (void)viewDidLoad {
    [super viewDidLoad];
    [self buidUI];
}

#pragma mark 创建UI
-(void)buidUI{
    [self addnavitem];
    [self addconfirmbtn];
}
#pragma mark 添加导航栏
-(void)addnavitem{
    self.view.backgroundColor=[UIColor whiteColor];
    self.navigationItem.title=@"找回密码";
    self.edgesForExtendedLayout = UIRectEdgeNone;
    //添加手势，点击屏幕其他区域关闭键盘的操作
    UITapGestureRecognizer *gesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(hidenKeyboard)];
    gesture.numberOfTapsRequired = 1;
    gesture.delegate = self;
    [self.view addGestureRecognizer:gesture];
}


#pragma mark - 键盘操作

- (void)hidenKeyboard
{
    [_tfsms resignFirstResponder];
    [_tfmp resignFirstResponder];
    [_psd resignFirstResponder];
    [_surePsd resignFirstResponder];
}



#pragma mark 登录界面
-(void)addregview{

    
    UITextField *tfmp=[[UITextField alloc]init];
    tfmp.frame=CGRectMake(40,10, SCREEN_WIDTH-80, 30);
    _tfmp=tfmp;
    _tfmp.borderStyle=UITextBorderStyleRoundedRect;;
    _tfmp.placeholder=@"请输入手机号码";
    _tfmp.keyboardType=UIKeyboardTypeNumberPad;
    _tfmp.delegate=self;
    [self.view addSubview:_tfmp];

    
    UITextField *tfsms=[[UITextField alloc]init];
    tfsms.frame=CGRectMake(40, 50, SCREEN_WIDTH-80, 30);
    _tfsms=tfsms;
    _tfsms.borderStyle=UITextBorderStyleRoundedRect;
    _tfsms.keyboardType=UIKeyboardTypeNumberPad;
    _tfsms.secureTextEntry=YES;
    _tfsms.delegate=self;
    _tfsms.placeholder=@"请输入验证码";
    [self.view addSubview:_tfsms];
    

    
    UITextField *psd=[[UITextField alloc]init];
    psd.frame=CGRectMake(40,90, SCREEN_WIDTH-80, 30);
    _psd=psd;
    psd.borderStyle=UITextBorderStyleRoundedRect;
    psd.placeholder=@"请输新密码";
    psd.keyboardType=UIKeyboardTypeNumberPad;
    psd.delegate=self;
    [self.view addSubview:_psd];

    
    UITextField *surePsd=[[UITextField alloc]init];
    surePsd.frame=CGRectMake(40, 130, SCREEN_WIDTH-80, 30);
    _surePsd=surePsd;
    _surePsd.borderStyle=UITextBorderStyleNone;
    _surePsd.keyboardType=UIKeyboardTypeNumberPad;
    _surePsd.secureTextEntry=YES;
    _surePsd.delegate=self;
    _surePsd.placeholder=@"再次输入新密码";
    [self.view addSubview:_surePsd];
}

#pragma mark 验证注册码
-(void) addconfirmbtn{
    
    [self addregview];
    
    l_timeButton=[[UIButton alloc]init];
    l_timeButton.frame=CGRectMake(SCREEN_WIDTH-110, 133, 100, 30);
    l_timeButton.layer.cornerRadius = 5;
    [l_timeButton addTarget:self action:@selector(sendsmscode) forControlEvents:UIControlEventTouchUpInside];
    l_timeButton.titleLabel.font=[UIFont systemFontOfSize:13];
    l_timeButton.backgroundColor=[UIColor orangeColor];
    [l_timeButton setTitle:@"获取验证码" forState:UIControlStateNormal];
    [self.view addSubview:l_timeButton];
    
    UIButton *confirmbtn=[[UIButton alloc]init];
    confirmbtn.frame=CGRectMake(10, 260,SCREEN_WIDTH-20, 40);
    [confirmbtn setTitle:@"提交" forState:UIControlStateNormal];
    [confirmbtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    confirmbtn.backgroundColor=[UIColor colorWithRed:0.0f/255.0f green:122.0f/255.0f blue:255.0f/255.0f alpha:1.0f];
    confirmbtn.layer.cornerRadius = 10;
    [confirmbtn addTarget:self action:@selector(checksms:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:confirmbtn];
}

#pragma mark 发送验证码
-(void)sendsmscode{
//    if(_tfmp.text.length!=11){
//        UIAlertView *alter=[[UIAlertView alloc]initWithTitle:nil message:@"请输入正确手机号！" delegate:nil cancelButtonTitle:@"好的" otherButtonTitles:nil, nil];
//        [alter show];
//        return;
//    }
    [self gethttpsms];
    [self startTime];
}

#pragma mark 文本框代理
-(BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string{
    
    if(textField==_tfmp){
        if(range.location>=11){
            return NO;
        }
    }
    return YES;
}

#pragma mark 获取服务器验证码
-(void)gethttpsms{
    
    
    
    
}
#pragma mark 开始计时
-(void)startTime{
    __block int timeout=60; //倒计时时间
    dispatch_queue_t queue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
    dispatch_source_t _timer = dispatch_source_create(DISPATCH_SOURCE_TYPE_TIMER, 0, 0,queue);
    dispatch_source_set_timer(_timer,dispatch_walltime(NULL, 0),1.0*NSEC_PER_SEC, 0); //每秒执行
    dispatch_source_set_event_handler(_timer, ^{
        if(timeout<=0){ //倒计时结束，关闭
            dispatch_source_cancel(_timer);
            dispatch_async(dispatch_get_main_queue(), ^{
                //设置界面的按钮显示 根据自己需求设置
                [l_timeButton setTitle:@"重新获取" forState:UIControlStateNormal];
                l_timeButton.userInteractionEnabled = YES;
            });
        }else{
            //            int minutes = timeout / 60;
            int seconds = timeout % 60;
            NSString *strTime = [NSString stringWithFormat:@"%.2d", seconds];
            dispatch_async(dispatch_get_main_queue(), ^{
                //设置界面的按钮显示 根据自己需求设置
                //NSLog(@"____%@",strTime);
                [l_timeButton setTitle:[NSString stringWithFormat:@"%@秒后重新发送",strTime] forState:UIControlStateNormal];
                l_timeButton.userInteractionEnabled = NO;
            });
            timeout--;
            
            
        }
    });
    dispatch_resume(_timer);
    
}
-(void)checksms:(UIButton *)sender{
    if([_tfsms.text isEqualToString:smscode]){
        
    }else{
        UIAlertView *alter = [[UIAlertView alloc] initWithTitle:nil message:@"验证码不正确" delegate:nil cancelButtonTitle:@"好的" otherButtonTitles:nil, nil];
        [alter show];
    }
    
}


@end



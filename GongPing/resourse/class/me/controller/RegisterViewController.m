//
//  RegisterViewController.m
//  jdmobile
//
//  Created by 丁博洋 on 15/6/18.
//  Copyright (c) 2015年 SYETC02. All rights reserved.
//

#import "RegisterViewController.h"
#import "BaseRequest.h"
#import "NSString+Mobel.h"

#define SCREEN_WIDTH self.view.bounds.size.width


@interface RegisterViewController ()<UITextFieldDelegate, UIGestureRecognizerDelegate>{
    UIButton *l_timeButton;
    UITextField *_tfsms;
    UITextField *_tfmp;
   
    
    UITextField *_psd;
    UITextField *_surePsd;
    UITextField *_userNikName;
    
}


@end

@implementation RegisterViewController


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
    self.navigationItem.title=@"注册";
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
    UIView *view=[[UIView alloc]init];
    view.backgroundColor=[UIColor whiteColor];
    view.frame=CGRectMake(0, 80, SCREEN_WIDTH, 170);
    
    UITextField *nikName = [[UITextField alloc]init];
    nikName.frame = CGRectMake(40,20, SCREEN_WIDTH-40-10-30, 30);
    _userNikName = nikName;
    _userNikName.borderStyle=UITextBorderStyleRoundedRect ;
    _userNikName.placeholder=@"请输入昵称";
    _userNikName.keyboardType=UIKeyboardTypeNumberPad;
    _userNikName.delegate=self;
    [view addSubview:_userNikName];

    
    
    UITextField *tfmp=[[UITextField alloc]init];
    tfmp.frame=CGRectMake(40,10+50, SCREEN_WIDTH-40-10-30, 30);
    _tfmp=tfmp;
    _tfmp.borderStyle=UITextBorderStyleRoundedRect ;
    _tfmp.placeholder=@"请输入手机号码";
    _tfmp.keyboardType=UIKeyboardTypeNumberPad;
    _tfmp.delegate=self;
    [view addSubview:_tfmp];
    
    UITextField *tfsms=[[UITextField alloc]init];
    tfsms.frame=CGRectMake(40, 130+50, SCREEN_WIDTH-120-40-40, 30);
    _tfsms=tfsms;
    _tfsms.borderStyle=UITextBorderStyleRoundedRect;
    _tfsms.keyboardType=UIKeyboardTypeNumberPad;
    //_tfsms.secureTextEntry=YES;
    _tfsms.delegate=self;
    _tfsms.placeholder=@"请输入验证码";
    [view addSubview:_tfsms];
    
    [self.view addSubview:view];

    UITextField *psd=[[UITextField alloc]init];
    psd.frame=CGRectMake(40,50+50, SCREEN_WIDTH-40-10-30, 30);
    _psd=psd;
    psd.borderStyle=UITextBorderStyleRoundedRect;
    psd.placeholder=@"请输密码";
    psd.keyboardType=UIKeyboardTypeASCIICapable;
    psd.delegate=self;
    psd.secureTextEntry = YES;
    [view addSubview:_psd];
    

    
    UITextField *surePsd=[[UITextField alloc]init];
    surePsd.frame=CGRectMake(40, 90+50, SCREEN_WIDTH-40-10-30, 30);
    _surePsd=surePsd;
    _surePsd.borderStyle=UITextBorderStyleRoundedRect;
    //_surePsd.keyboardType=UIKeyboardTypeNumberPad;
    _surePsd.secureTextEntry=YES;
    _surePsd.delegate=self;
    _surePsd.placeholder=@"再次输入密码";
    [view addSubview:_surePsd];
}

#pragma mark 验证注册码
-(void) addconfirmbtn{
    
    [self addregview];
    
    l_timeButton=[[UIButton alloc]init];
    l_timeButton.frame=CGRectMake(SCREEN_WIDTH-110-30, 130+80+50, 100, 30);
    l_timeButton.layer.cornerRadius = 5;
    [l_timeButton addTarget:self action:@selector(sendsmscode) forControlEvents:UIControlEventTouchUpInside];
    l_timeButton.titleLabel.font=[UIFont systemFontOfSize:13];
    l_timeButton.backgroundColor=[UIColor orangeColor];
    [l_timeButton setTitle:@"获取验证码" forState:UIControlStateNormal];
    [self.view addSubview:l_timeButton];
    
    UIButton *confirmbtn=[[UIButton alloc]init];
    confirmbtn.frame=CGRectMake(40, 260+50,SCREEN_WIDTH-80, 40);
    [confirmbtn setTitle:@"注册" forState:UIControlStateNormal];
    [confirmbtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    confirmbtn.backgroundColor=[UIColor colorWithRed:0.0f/255.0f green:122.0f/255.0f blue:255.0f/255.0f alpha:1.0f];
    confirmbtn.layer.cornerRadius = 10;
    [confirmbtn addTarget:self action:@selector(checksms:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:confirmbtn];
}

#pragma mark 发送验证码
-(void)sendsmscode{
    
  if(_tfmp.text.length!=11||[_tfmp.text checkPhoneNumInput]==NO){

      UIAlertView *alter = [[UIAlertView alloc] initWithTitle:nil message:@"请输入正确手机号！" delegate:nil cancelButtonTitle:@"好的" otherButtonTitles:nil, nil];
      [alter show];
      return;
   }
    [self gethttpsms];
    [self startTime];
}

#pragma mark 文本框代理
-(BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string{
    
    if (textField == _userNikName) {
        if (range.location>=12) {
            return NO;
            
        }
    }
    
    
    if(textField==_tfmp){
        if(range.location>=11){
            return NO;
        }
            }
    if (textField == _tfsms) {
        if (range.location >=6) {
            return NO;
        }
    }
    if (textField == _psd ) {
        if (range.location>=16) {
            return NO;
            
        }
    }
    if (textField == _surePsd ) {
        if (range.location>=16) {
            return NO;
            
        }
    }
    
    
    
    
    return YES;
}

#pragma mark 获取服务器验证码
-(void)gethttpsms{
 
    NSString *telephoneNumber = _tfmp.text;
    NSString *URL = [NSString stringWithFormat:@"Http://192.168.0.31/XYGPKY_App/User/sendSMSCode/%@.json",telephoneNumber];
    
    
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    
    [manager POST:URL parameters:nil success:^(AFHTTPRequestOperation *operation, id responseObject) {
        
        
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        
        NSLog(@"请求验证码失败%@",error);
    }];
    
    
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
    
    if (_tfmp.text.length == 0||_userNikName.text.length==0 || _psd.text.length ==0) {
        UIAlertView *alter = [[UIAlertView alloc] initWithTitle:nil message:@"请输填写完整信息" delegate:nil cancelButtonTitle:@"好的" otherButtonTitles:nil, nil];
        [alter show];
        return;

    }
    
    if ([self cutDownStringSpecialWords:_psd.text]==NO) {
        UIAlertView *alter = [[UIAlertView alloc] initWithTitle:nil message:@"请输入6-16位数字和英文密码" delegate:nil cancelButtonTitle:@"好的" otherButtonTitles:nil, nil];
        [alter show];
        return;
    };
    if ([self cutDownStringSpecialWords:_surePsd.text]==NO) {
        UIAlertView *alter = [[UIAlertView alloc] initWithTitle:nil message:@"请输入6-16位数字和英文密码" delegate:nil cancelButtonTitle:@"好的" otherButtonTitles:nil, nil];
        [alter show];
        return;
    };
    
    if ([_psd.text isEqualToString:_surePsd.text]==NO) {
        
        UIAlertView *alter = [[UIAlertView alloc] initWithTitle:nil message:@"两次密码不一致" delegate:nil cancelButtonTitle:@"好的" otherButtonTitles:nil, nil];
        [alter show];
        return;

    }
    
    
    NSString *URL = [NSString stringWithFormat:@"Http://192.168.0.31/XYGPKY_App/User/regiest/%@/%@/%@/%@.json",_userNikName.text,_tfmp.text,_tfsms.text,_surePsd.text];
    
    
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    
    [manager POST:URL parameters:nil success:^(AFHTTPRequestOperation *operation, id responseObject) {
        
        UIAlertView *alter = [[UIAlertView alloc] initWithTitle:nil message:responseObject[@"messageResult"][@"message"] delegate:nil cancelButtonTitle:@"知道了" otherButtonTitles:nil, nil];
        [alter show];
        
        
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        
        NSLog(@"请求验证码失败%@",error);
    }];
    
   
    
    
        /*
        UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"验证码不正确" message:nil preferredStyle:UIAlertControllerStyleAlert];
        [alert addAction:[UIAlertAction actionWithTitle:@"好的" style:UIAlertActionStyleCancel handler:^(UIAlertAction *  action) {
        }]];
        [self presentViewController:alert animated:YES completion:nil];
        
         [alert addAction:[UIAlertAction actionWithTitle:nil style:UIAlertActionStyleDefault handler:^(UIAlertAction *  action) {
         
         }]];
        UIActionSheet *actionSheet = [[UIActionSheet alloc]initWithTitle:@"验证码不正确" delegate:self cancelButtonTitle:@"好的" destructiveButtonTitle:nil otherButtonTitles:nil, nil];
        
        [actionSheet showInView:self.view];
       */
    
}
    //     RegStepCarOwnerVC *reg=[[RegStepCarOwnerVC alloc]init];
    //     [self.navigationController  pushViewController:reg animated:YES];
//密码
-(BOOL)cutDownStringSpecialWords:(NSString *)textStr
{
    BOOL result = YES;
    NSCharacterSet *nameCharacters = [[NSCharacterSet
                                       characterSetWithCharactersInString:@"abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789"] invertedSet];
    NSRange userNameRange = [textStr rangeOfCharacterFromSet:nameCharacters];
    if (userNameRange.location != NSNotFound) {
        NSLog(@"包含特殊字符");
        result = NO;
    }
    
    return result;
}



@end

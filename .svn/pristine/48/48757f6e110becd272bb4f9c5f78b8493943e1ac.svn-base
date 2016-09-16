//
//  GPMobileQuickViewController.m
//  test
//
//  Created by apple on 16/8/30.
//  Copyright © 2016年 xiaoAn. All rights reserved.
//

#import "GPMobileQuickViewController.h"
#import "NSString+Mobel.h"

#define SCREEN_WIDTH self.view.bounds.size.width

@interface GPMobileQuickViewController ()

@end

@implementation GPMobileQuickViewController

-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    [_phoneNumber becomeFirstResponder];
    
}
- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"手机快速登录";
    self.view.backgroundColor = [UIColor groupTableViewBackgroundColor];

    [self createUI];
    
}
-(void)createUI
{
    _phoneNumber = [[UITextField alloc]init];
    _phoneNumber.frame=CGRectMake(40,84, SCREEN_WIDTH-40-10-30, 40);
 
    _phoneNumber.borderStyle=UITextBorderStyleRoundedRect ;
    _phoneNumber.placeholder=@"请输入手机号码";
    _phoneNumber.keyboardType=UIKeyboardTypeNumberPad;
    _phoneNumber.delegate=self;

    [self.view addSubview:_phoneNumber];
    _yzm = [[UITextField alloc]init];
    
    _yzm.frame=CGRectMake(40, 84+40+20, SCREEN_WIDTH-120-40-40, 40);
    
    _yzm.borderStyle=UITextBorderStyleRoundedRect;
    _yzm.keyboardType=UIKeyboardTypeNumberPad;
    //_tfsms.secureTextEntry=YES;
    _yzm.delegate=self;
    _yzm.placeholder=@"请输入验证码";
    [self.view addSubview:_yzm];

    _timeButton=[[UIButton alloc]init];
    _timeButton.frame=CGRectMake(SCREEN_WIDTH-110-30, 84+40+20, 100, 40);
    _timeButton.layer.cornerRadius = 5;
    [_timeButton addTarget:self action:@selector(sendsmscode) forControlEvents:UIControlEventTouchUpInside];
    _timeButton.titleLabel.font=[UIFont systemFontOfSize:13];
    _timeButton.backgroundColor=[UIColor orangeColor];
    [_timeButton setTitle:@"获取验证码" forState:UIControlStateNormal];
    [self.view addSubview:_timeButton];
    
    UIButton *confirmbtn=[[UIButton alloc]init];
    confirmbtn.frame=CGRectMake(40, 84+40+20+40+20,SCREEN_WIDTH-80, 40);
    [confirmbtn setTitle:@"登  录" forState:UIControlStateNormal];
    [confirmbtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    confirmbtn.backgroundColor=[UIColor colorWithRed:0.0f/255.0f green:122.0f/255.0f blue:255.0f/255.0f alpha:1.0f];
    confirmbtn.layer.cornerRadius = 10;
    [confirmbtn addTarget:self action:@selector(checksms:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:confirmbtn];
    
    
}
-(BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string
{
    if (textField == _phoneNumber) {
        
        if (range.location >=11) {
            
            return NO;
        }
    }
    return YES;
}

#pragma mark 判断手机号是否正常
-(void)sendsmscode
{
    if (_phoneNumber.text.length == 0) {
        
        UIAlertView *alter = [[UIAlertView alloc] initWithTitle:nil message:@"请输入手机号！" delegate:nil cancelButtonTitle:@"好的" otherButtonTitles:nil, nil];
        [alter show];
        return;
    }
    if ([_phoneNumber.text checkPhoneNumInput]==NO) {
        UIAlertView *alter = [[UIAlertView alloc] initWithTitle:nil message:@"请输入正确手机号！" delegate:nil cancelButtonTitle:@"好的" otherButtonTitles:nil, nil];
        [alter show];
        return;
    }
    [self postrequest];
    [self startTime];

}
#pragma mark 开始发送请求
-(void)postrequest
{
   
    
    NSString *telephoneNumber = _phoneNumber.text;
    NSString *URL = [NSString stringWithFormat:@"Http://192.168.0.31/XYGPKY_App/User/sendSMSCode/%@.json",telephoneNumber];
    
    
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    
    [manager POST:URL parameters:nil success:^(AFHTTPRequestOperation *operation, id responseObject) {
        
        
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        
        NSLog(@"请求失败%@",error);
    }];
    
    
    
}
#pragma mark 登录请求
-(void)checksms:(UIButton *)btn
{
    if (_phoneNumber.text.length == 0) {
        
        UIAlertView *alter = [[UIAlertView alloc] initWithTitle:nil message:@"请输入手机号！" delegate:nil cancelButtonTitle:@"好的" otherButtonTitles:nil, nil];
        [alter show];
        return;
    }
    if ([_phoneNumber.text checkPhoneNumInput]==NO) {
        UIAlertView *alter = [[UIAlertView alloc] initWithTitle:nil message:@"请输入正确手机号！" delegate:nil cancelButtonTitle:@"好的" otherButtonTitles:nil, nil];
        [alter show];
        return;
    }
    if (_yzm.text.length == 0) {
        UIAlertView *alter = [[UIAlertView alloc] initWithTitle:nil message:@"请输入验证码！" delegate:nil cancelButtonTitle:@"好的" otherButtonTitles:nil, nil];
        [alter show];
        return;
    }
    
    NSString *telephoneNumber = _phoneNumber.text;
    NSString *yanzhengma = _yzm.text;
    NSString *URL = [NSString stringWithFormat:@"Http://192.168.0.31/XYGPKY_App/User/loginByYzm/%@/%@.json",telephoneNumber,yanzhengma];
    
    
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    
    [manager POST:URL parameters:nil success:^(AFHTTPRequestOperation *operation, id responseObject) {
        
        
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        
        NSLog(@"登录失败%@",error);
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
                [_timeButton setTitle:@"重新获取" forState:UIControlStateNormal];
                _timeButton.userInteractionEnabled = YES;
            });
        }else{
            //            int minutes = timeout / 60;
            int seconds = timeout % 60;
            NSString *strTime = [NSString stringWithFormat:@"%.2d", seconds];
            dispatch_async(dispatch_get_main_queue(), ^{
                //设置界面的按钮显示 根据自己需求设置
                //NSLog(@"____%@",strTime);
                [_timeButton setTitle:[NSString stringWithFormat:@"%@秒后重新发送",strTime] forState:UIControlStateNormal];
                _timeButton.userInteractionEnabled = NO;
            });
            timeout--;
            
            
        }
    });
    dispatch_resume(_timer);
    
}

-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    
    [self.view endEditing:YES];
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

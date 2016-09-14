//
//  LoginViewController.m
//  jdmobile
//
//  Created by SYETC02 on 15/6/17.
//  Copyright (c) 2015年 SYETC02. All rights reserved.
//

#import "LoginViewController.h"
#import "DKTextField.h"
#import "CustomSwitch.h"
#import "RegisterViewController.h"
#import "UIBarButtonItem+Item.h"
#import "BaseRequest.h"
#import "Member.h"
#import "Member+net.h"
#import "TMStatusUtility.h"
#import "GPMeController.h"

#import "MASConstraint.h"
#import "View+MASAdditions.h"
#import "LolitaFunctions.h"

#import "UIImage+Extension.h"
#import "UIButton+Extension.h"

#import "MBProgressHUD+MJ.h"

#import "GPFindOutController.h"
#define _LolitaFunctions [LolitaFunctions sharedObject]
#define CellFooterheight 70
#define HeadrCardColor [UIColor colorWithRed:0 green:0 blue:0 alpha:0.2]
#define JDColor(r,g,b) [UIColor colorWithRed:(r)/255.0 green:(g)/255.0 blue:(b)/255.0 alpha:1.0]


static NSString *const defaultAddress = @"https://plogin.m.jd.com/user/login.action?appid=100&returnurl=http%3A%2F%2Fhome.m.jd.com%2FmyJd%2Fhome.action%3Fsid%3D6af1aba874fe8ed128b711e9d45f5216";

@interface LoginViewController ()<UITextFieldDelegate, UIGestureRecognizerDelegate,CustomSwitchDelegate>

@property (nonatomic, strong) UITextField *accountField;
@property (nonatomic, strong) DKTextField *passwordField;
@property (nonatomic, strong) CustomSwitch *passwordSwitch;

@property (nonatomic, strong) UIButton *loginButton;
@property (nonatomic, strong) UIButton *registerButton;
@property (nonatomic, strong) UIButton *backPwdButton;
@property (nonatomic, strong) UIButton *zhuXiaoButton;

@property (nonatomic,strong) UITextField * nameFiled;
@property (nonatomic,strong) UITextField * psdFiled;


@end

@implementation LoginViewController



- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor=JDColor(240, 243, 245);
    //self.view.userInteractionEnabled = YES;
    //设置导航栏
    self.navigationItem.title=@"登录";
    self.navigationItem.leftBarButtonItem = [UIBarButtonItem barButtonItemWithTitle:@"取消" target:self action:@selector(cancel) forControlEvents:UIControlEventTouchUpInside];
    self.navigationItem.rightBarButtonItem = [UIBarButtonItem barButtonItemWithTitle:@"注册" target:self action:@selector(zhuce) forControlEvents:UIControlEventTouchUpInside];
    
    //初始化视图
    //头部
    UIImageView * loginHeadBg = [[UIImageView alloc]init];
    loginHeadBg.backgroundColor = [UIColor magentaColor];
    loginHeadBg.image = [UIImage imageNamed:@"222"];
    [self.view addSubview:loginHeadBg];
    
    [loginHeadBg mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_offset (0);
        make.size.mas_equalTo(CGSizeMake(self.view.bounds.size.width, 200));
        make.top.mas_equalTo(self.view.mas_top);
    }];
    
    UIView * loginBg = [[UIView alloc]initWithFrame:CGRectMake(0, 210,self.view.bounds.size.width, 120)];
    loginBg.backgroundColor = [UIColor whiteColor];
    loginBg.layer.cornerRadius = 5.0f;
    //loginBg.image=[UIImage imageWithName:@"login_background"];
    loginBg.userInteractionEnabled = YES;
    [self.view addSubview:loginBg];
    //账号框
    _accountField =[UITextField new];
    _accountField.placeholder = @"手机号";
    _accountField.textColor = [UIColor grayColor];
    _accountField.autocapitalizationType = UITextAutocapitalizationTypeNone;//首字母是否大写
    _accountField.borderStyle=UITextBorderStyleNone; //外框类型
    _accountField.delegate = self;//设置代理 用于实现协议
    _accountField.returnKeyType = UIReturnKeyNext;//设置键盘按键类型
    _accountField.clearButtonMode = UITextFieldViewModeWhileEditing;//UITextField 的一件清除按钮是否出现
    _accountField.keyboardType = UIKeyboardTypeNumberPad;
    _accountField.enablesReturnKeyAutomatically = YES;//这里设置为无文字就灰色不可点
    [_accountField setLeftViewMode:UITextFieldViewModeAlways];
    [_accountField setLeftView:[_LolitaFunctions leftViewForTextFieldWithTest:@"账号："]];
    
    UIView *view = [[UIView alloc] initWithFrame:CGRectMake(80, 60.5, loginBg.bounds.size.width-80, 0.5)];
    view.alpha = 0.5;
    view.backgroundColor = [UIColor grayColor];
    [loginBg addSubview:view];
    //密码框
    _passwordField = [DKTextField new];
    _passwordField.placeholder = @"请输入密码";
    _passwordField.textColor = [UIColor grayColor];
    _passwordField.secureTextEntry = YES;//是否以密码形式显示
    _passwordField.delegate = self;
    _passwordField.returnKeyType = UIReturnKeyDone;
    _passwordField.clearButtonMode = UITextFieldViewModeWhileEditing;
    _passwordField.enablesReturnKeyAutomatically = YES;
    [_passwordField setLeftViewMode:UITextFieldViewModeAlways];
    [_passwordField setLeftView:[_LolitaFunctions leftViewForTextFieldWithTest:@"密码："]];
    
    // 密码显示开关
    _passwordSwitch = [[CustomSwitch alloc]initWithFrame:CGRectMake(loginBg.bounds.size.width-100, 270, 100, 60)];
    _passwordSwitch.delegate=self;
    _passwordSwitch.arrange = CustomSwitchArrangeONLeftOFFRight;
    _passwordSwitch.onImage = [UIImage imageWithName:@"register_passwd_on"] ;
    _passwordSwitch.offImage = [UIImage imageWithName:@"register_passwd_off"];
    _passwordSwitch.status = CustomSwitchStatusOff;
    [self.view addSubview: _passwordSwitch];
    
    
    [_accountField addTarget:self action:@selector(returnOnKeyboard:) forControlEvents:UIControlEventEditingChanged];
    [_passwordField addTarget:self action:@selector(returnOnKeyboard:) forControlEvents:UIControlEventEditingChanged];
    
    [loginBg addSubview: _accountField];
    [loginBg addSubview: _passwordField];
    //适配
    [_accountField mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_offset (0);
        make.size.mas_equalTo(CGSizeMake(self.view.bounds.size.width-10, 60));
        make.top.mas_equalTo(loginBg.mas_top);
    }];
    [_passwordField mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_offset (0);
        make.size.mas_equalTo(CGSizeMake(self.view.bounds.size.width-100, 60));
        make.bottom.mas_equalTo(loginBg.mas_bottom);
    }];
    //登录按钮
    _loginButton = [[UIButton alloc]initWithFrame:CGRectMake(10,350 ,[UIScreen mainScreen].bounds.size.width-20,0.375*[UIScreen mainScreen].bounds.size.width/4 )];
    _loginButton.backgroundColor=[UIColor colorWithRed:248/255.0f green:144/255.0f blue:34/255.0f alpha:1];
    _loginButton.layer.cornerRadius = 5.0f;
    [_loginButton setTitle:@"登录" forState:UIControlStateNormal];
    //[_loginButton setBackgroundImage:[UIImage imageNamed:@"denglu"] forState:UIControlStateNormal];
    _loginButton.enabled = NO;
    [_loginButton addTarget:self action:@selector(loginBtnClick) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:_loginButton];
    
    //快速登录按钮
    _registerButton = [UIButton buttonWithType:UIButtonTypeCustom];
    _registerButton.clipsToBounds = YES;
    _registerButton.layer.cornerRadius = 5;
    _registerButton.frame = CGRectMake(10, 350+0.375*[UIScreen mainScreen].bounds.size.width/4 +5, 80, 20 );
    [_registerButton setTitleColor:[UIColor magentaColor] forState:UIControlStateNormal];
    [_registerButton setTitle:@"快速登录" forState:UIControlStateNormal];
    [_registerButton addTarget:self action:@selector(onClick:) forControlEvents:UIControlEventTouchUpInside];
    _registerButton.tag=0;
    [_registerButton.titleLabel setFont:[UIFont systemFontOfSize:14]];
    [self.view addSubview:_registerButton];
    
    //忘记密码按钮
    _backPwdButton = [UIButton buttonWithType:UIButtonTypeCustom];
    _backPwdButton.frame = CGRectMake(self.view.bounds.size.width-90, 330+20+5+0.375*[UIScreen mainScreen].bounds.size.width/4, 80, 20);
    _backPwdButton.titleLabel.textAlignment = NSTextAlignmentRight;
    [_backPwdButton setTitle:@"找回密码" forState:UIControlStateNormal];
    [_backPwdButton.titleLabel setFont:[UIFont systemFontOfSize:14]];
    [_backPwdButton setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
    [_backPwdButton addTarget:self action:@selector(onClick:) forControlEvents:UIControlEventTouchUpInside];
    _backPwdButton.tag=1;
    [self.view addSubview:_backPwdButton];
    
    
    //添加手势，点击屏幕其他区域关闭键盘的操作
    UITapGestureRecognizer *gesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(hidenKeyboard)];
    gesture.numberOfTapsRequired = 1;
    gesture.delegate = self;
    [self.view addGestureRecognizer:gesture];
    
    
    
//    NSArray *accountAndPassword = @[@"11111"];
//    _accountField.text = accountAndPassword? accountAndPassword[0] : @"";
//    _accountField.text = @"";
    
   
    
}
//注销
-(void)zxbuttonclick{
    
    [TMStatusUtility userLogout];
    
}



- (void)onClick:(UIButton*)sender{
    
    GPMobileQuickViewController *quickLogin = [[GPMobileQuickViewController alloc]init];
    GPFindOutController * findPsd = [[GPFindOutController alloc] init];
    switch (sender.tag) {
        case 0:
            quickLogin.hidesBottomBarWhenPushed = YES;
           [self.navigationController pushViewController:quickLogin animated:YES];
            break;
        case 1:
            [self.navigationController pushViewController:findPsd animated:YES];
            break;
            
        default:
            break;
    }
}

- (void)cancel{
    [self.navigationController popToRootViewControllerAnimated:YES];
     //[self dismissViewControllerAnimated:YES completion:nil];
}
-(void)zhuce
{
    RegisterViewController *registerView = [[RegisterViewController alloc] init];
    registerView.hidesBottomBarWhenPushed = YES;
    [self.navigationController pushViewController:registerView animated:YES];
    NSLog(@"点击了注册按钮");
}

//登录操作
- (void)loginBtnClick{
    [self hidenKeyboard];
    NSString *URL = [NSString stringWithFormat:@"Http://192.168.0.31/XYGPKY_App/User/login/%@/%@.json",_accountField.text,_passwordField.text];
 
  
    [Member requestWithUrl:URL callback:^(NSDictionary *dic) {
        
        Member *model = [[Member alloc]init];
        model.userNickname = dic[@"userNickname"];
        model.password = dic[@"password"];
        model.phoneNumber = dic[@"phoneNumber"];
        model.userId = dic[@"userId"];
        model.sjyzm = dic[@"sjyzm"];
        model.createTime = dic[@"createTime"];
        
        NSLog(@"---------%@",model.phoneNumber);
        
        [model save];
        
        
        if ([TMStatusUtility isUserLogin]) {
            
            [MBProgressHUD showSuccess:@"登录成功"];
            //sleep(0.5);
            [self.navigationController popToRootViewControllerAnimated:YES];
         
        }
    }];
    
    
//
//    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
//    
//    [manager GET:URL parameters:nil success:^(AFHTTPRequestOperation *operation, id responseObject) {
//       
//        NSLog(@"%@",responseObject);
//       // NSString *str  = responseObject[@"messageResult"][@"message"];
//     
//        
//    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
//        
//         NSLog(@"登录失败%@",error);
//    }];
//    

    
    //[MBProgressHUD showMessage:@"登录中" toView:self.navigationController.view];

    
    
    
//    if (um!=nil) {
//        [HUD showWhileExecuting:@selector(myTask) onTarget:self withObject:nil animated:YES];
//        [UserDefaultsUtils saveOwnAccount:_accountField.text andPassword:_passwordField.text];
//        [UserDefaultsUtils saveOwnID:um.userId userName:um.userName commodity:(int)um.commodity shop:(int)um.shop record:(int)um.record];
//        [self saveCookies];
//        
//    }else{
//        [MBProgressHUD showSuccess:@"账户和密码不匹配"];
//    }
    
}
//-(void)delayMethod
//{
//    [self.navigationController popToRootViewControllerAnimated:YES];
//
//}
- (void)myTask {
    // Do something usefull in here instead of sleeping ...
    //sleep(5);
    
    [MBProgressHUD showSuccess:@"登录成功"];
    //sleep(0.5);
    //[self dismissViewControllerAnimated:YES completion:nil];
}

/*** 不知为何有时退出应用后，cookie不保存，所以这里手动保存cookie ***/

- (void)saveCookies
{
    
    
    
    NSData *cookiesData = [NSKeyedArchiver archivedDataWithRootObject: [[NSHTTPCookieStorage sharedHTTPCookieStorage] cookies]];
    NSString *cookieString = [[NSString alloc]initWithData:cookiesData encoding:NSUTF8StringEncoding];
    NSLog(@"%@",cookiesData);
    NSLog(@"%@",cookieString);
    
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    [defaults setObject: cookiesData forKey: @"sessionCookies"];
    [defaults synchronize];
    
}

#pragma mark - 键盘操作

- (void)hidenKeyboard
{
    [_accountField resignFirstResponder];
    [_passwordField resignFirstResponder];
}


- (void)returnOnKeyboard:(UITextField *)sender
{
    
    if (_accountField.text.length != 0 && _passwordField.text.length !=0 ) {
        _loginButton.enabled = YES;
        //[_loginButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        //[_loginButton setBackgroundImage:[UIImage imageNamed:@"login_btn_red"] forState:UIControlStateNormal];
    } else {
        _loginButton.enabled = NO;
        //[_loginButton setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
        //[_loginButton setBackgroundImage:[UIImage imageNamed:@"login_btn_gray"] forState:UIControlStateNormal];
    }
}
#pragma mark - UITextFieldDelegate
- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    if (textField == _accountField) {
        return [_passwordField becomeFirstResponder];
    } else {
        [self hidenKeyboard];
        return [_passwordField resignFirstResponder];
    }
}

#pragma mark - customSwitch delegate
-(void)customSwitchSetStatus:(CustomSwitchStatus)status
{
    switch (status) {
        case CustomSwitchStatusOn:
           
             _passwordField.secureTextEntry = NO;
            break;
        case CustomSwitchStatusOff:
            
             _passwordField.secureTextEntry = YES;
            break;
        default:
            break;
    }
}


@end

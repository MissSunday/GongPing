//
//  changePasswordVC.m
//  iocapp
//
//  Created by apple on 16/1/25.
//  Copyright © 2016年 TSJDC. All rights reserved.
//

#import "changePasswordVC.h"

@interface changePasswordVC ()
@property (weak, nonatomic) IBOutlet UITextField *oldpsd;

@property (weak, nonatomic) IBOutlet UITextField *newpsd;

@property (weak, nonatomic) IBOutlet UITextField *surepsd;
@property (weak, nonatomic) IBOutlet UIButton *sureBtn;


@end

@implementation changePasswordVC

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.title = @"修改密码";
    [self.sureBtn setBackgroundColor:[UIColor colorWithRed:21/255.0 green:114/255.0 blue:200/255.0 alpha:1.0]];
    
    UITapGestureRecognizer *tapGestureRecognizer = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(keyboardHide:)];
    //设置成NO表示当前控件响应后会传播到其他控件上，默认为YES。
    tapGestureRecognizer.cancelsTouchesInView = NO;
    //将触摸事件添加到当前view
    [self.view addGestureRecognizer:tapGestureRecognizer];
}

-(void)keyboardHide:(UITapGestureRecognizer*)tap{
    [_oldpsd resignFirstResponder];
    [_newpsd resignFirstResponder];
    [_surepsd resignFirstResponder];
}
-(void)back{
    [self.navigationController popViewControllerAnimated:YES];
}


- (IBAction)changePSD:(id)sender {
    //post
     if ([self validateNickname:self.oldpsd.text]){
        UIAlertView *alter = [[UIAlertView alloc] initWithTitle:nil message:@"密码中不应含有特殊字符" delegate:nil cancelButtonTitle:@"好的" otherButtonTitles:nil, nil];
        [alter show];
        return;
    }else if(self.oldpsd.text.length<6||self.newpsd.text.length <6||self.oldpsd.text.length>12||self.newpsd.text.length >12||self.surepsd.text.length<6||self.surepsd.text.length>12){
        UIAlertView *alter = [[UIAlertView alloc] initWithTitle:nil message:@"请输入6-12位用户名或者密码" delegate:nil cancelButtonTitle:@"好的" otherButtonTitles:nil, nil];
        [alter show];
        return;
    }else if ([self validateNickname:self.newpsd.text]){
        UIAlertView *alter = [[UIAlertView alloc] initWithTitle:nil message:@"密码中不应含有特殊字符" delegate:nil cancelButtonTitle:@"好的" otherButtonTitles:nil, nil];
        [alter show];
        return;
    }else if ([self validateNickname:self.surepsd.text]){
        UIAlertView *alter = [[UIAlertView alloc] initWithTitle:nil message:@"密码中不应含有特殊字符" delegate:nil cancelButtonTitle:@"好的" otherButtonTitles:nil, nil];
        [alter show];
        return;
    }

    if (self.oldpsd.text.length == 0) {
        UIAlertView * alter = [[UIAlertView alloc] initWithTitle:nil message:@"请输入旧密码" delegate:nil cancelButtonTitle:@"好的" otherButtonTitles:nil, nil];
        [alter show];
        return;
    }else if(self.newpsd.text.length == 0){
        UIAlertView * alter = [[UIAlertView alloc] initWithTitle:nil message:@"请输新入密码" delegate:nil cancelButtonTitle:@"好的" otherButtonTitles:nil, nil];
        [alter show];
        return;
    }else if(self.surepsd.text.length == 0){
        UIAlertView * alter = [[UIAlertView alloc] initWithTitle:nil message:@"请确定新密码" delegate:nil cancelButtonTitle:@"好的" otherButtonTitles:nil, nil];
        [alter show];
        return;
    }
    else if(![self.surepsd.text isEqualToString:[NSString stringWithFormat:@"%@",self.newpsd.text]]){
        UIAlertView * alter = [[UIAlertView alloc] initWithTitle:nil message:@"两次密码输入的不一样,请重新输入" delegate:self cancelButtonTitle:@"好的" otherButtonTitles:nil, nil];
        [alter show];
        return;
    }else if([self.oldpsd.text isEqualToString:[NSString stringWithFormat:@"%@",self.newpsd.text]]){
        UIAlertView * alter = [[UIAlertView alloc] initWithTitle:nil message:@"新密码与旧密码相同，请重新输入" delegate:self cancelButtonTitle:@"好的" otherButtonTitles:nil, nil];
        [alter show];
        return;
    }

  
}
#pragma mark 正则表达式检测昵称
- (BOOL)validateNickname:(NSString *)nickname {
    // 不包含特殊字符
    // 特殊字符包含`、-、=、\、[、]、;、'、,、.、/、~、!、@、#、$、%、^、&、*、(、)、_、+、|、?、>、<、"、:、{、}
    NSString *nicknameRegex = @".*[-`=\\\[\\];',./~!@#$%^&*()_+|{}:\"<>?]+.*";
    NSPredicate *nicknamePredicate = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", nicknameRegex];
    return [nicknamePredicate evaluateWithObject:nickname];
}
#pragma mark 正则表达式检测是否英文数字组合
-(BOOL)judgePassWordLegal:(NSString *)pass{
    BOOL result = false;
    if ([pass length] >= 6){
        // 判断长度大于6位后再接着判断是否同时包含数字和字符
        NSString * regex = @"^(?![0-9]+$)(?![a-zA-Z]+$)[0-9A-Za-z]{6,12}$";
        NSPredicate *pred = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", regex];
        result = [pred evaluateWithObject:pass];
    }
    return result;
}


-(void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex{
    
    if (buttonIndex == 0) {
        self.newpsd.text = @"";
        self.surepsd.text = @"";
    }
    
}
-(void)showAlert:(NSString *) _message;{//时间
    UIAlertView *promptAlert = [[UIAlertView alloc] initWithTitle:@"" message:_message delegate:nil cancelButtonTitle:nil otherButtonTitles:nil];
    [NSTimer scheduledTimerWithTimeInterval:1.0f target:self selector:@selector(timerFireMethod:) userInfo:promptAlert repeats:YES];
    [promptAlert show];
}
- (void)timerFireMethod:(NSTimer*)theTimer//弹出框
{
    UIAlertView *promptAlert = (UIAlertView*)[theTimer userInfo];
    [promptAlert dismissWithClickedButtonIndex:0 animated:NO];
    promptAlert =NULL;
}
@end

//
//  DNMessageViewController.m
//  工平矿业
//
//  Created by apple on 16/7/12.
//  Copyright © 2016年 xiaoAn. All rights reserved.
//

#import "DNMessageViewController.h"
#import "CZTextView.h"
@interface DNMessageViewController ()<UITextViewDelegate,UIGestureRecognizerDelegate>
@property (nonatomic, strong) CZTextView *textView;
@end

@implementation DNMessageViewController

- (void)viewDidLoad {
    [super viewDidLoad];
   self.title=@"留言";
    self.view.backgroundColor = [UIColor groupTableViewBackgroundColor];
    [self createUI];

}
-(void)createUI
{
    self.automaticallyAdjustsScrollViewInsets = NO;

    _textView = [[CZTextView alloc]initWithFrame:CGRectMake(10, 80, self.view.bounds.size.width - 20, 140)];
    
    _textView.font = [UIFont systemFontOfSize:15];
    
    _textView.placeHolder = @"请输入留言内容,最多可输入200个汉字";
    [self.view addSubview:_textView];
    
    // 默认允许垂直方向拖拽
    _textView.alwaysBounceVertical = YES;
    
    // 监听拖拽
    _textView.delegate = self;
    
    UIButton * btn = [[UIButton alloc]initWithFrame:CGRectMake(SCREEN_W*(1-0.35)/2, 250, 0.35*SCREEN_W, 0.35*SCREEN_W*0.25)];
    //[btn setTitle:@"留言" forState:UIControlStateNormal];
    [btn setBackgroundImage:[UIImage imageNamed:@"liuyan"] forState:UIControlStateNormal];
    [btn addTarget:self action:@selector(sendMessage) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btn];
    btn.backgroundColor = [UIColor colorWithRed:136/255.00 green:84/255.00 blue:95/255.00 alpha:1];
    btn.layer.cornerRadius = 10;
}
- (BOOL)textViewShouldBeginEditing:(UITextView *)textView
{
    _textView.placeHolder=nil;
    return YES;
}
-(void)sendMessage{
        AFHTTPRequestOperationManager*manager=[AFHTTPRequestOperationManager manager];
        manager.responseSerializer=[AFJSONResponseSerializer serializer];
        manager.requestSerializer=[AFJSONRequestSerializer serializer];
        manager.responseSerializer.acceptableContentTypes=[NSSet setWithObjects:@"application/json", nil];
        NSString*url=[leaveMessageUrl stringByAppendingString:[NSString stringWithFormat:@"%@/%d/%@.json",[_textView.text stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding],USERID,self.productId]];
        [manager POST  :url parameters:nil success:^(AFHTTPRequestOperation *operation, id responseObject) {
    
            NSLog(@"%@",responseObject);
        } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
            
        }];
    [self.textView resignFirstResponder];
    [self.navigationController popViewControllerAnimated:YES];
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

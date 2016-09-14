//
//  GPSendProductController.m
//  公平矿业
//
//  Created by apple on 16/6/6.
//  Copyright © 2016年 xiaoAn. All rights reserved.
//

#import "GPSendProductController.h"


#import "CZTextView.h"

#import "MBProgressHUD+MJ.h"

#import "GPCategaryModel.h"

#import "CZTextView.h"

#import "MessagePhotoView.h"//图片视图 01.22
#import "ZBMessageShareMenuView.h"

#import "UIBarButtonItem+Item.h"

#define SCREEN_W self.view.bounds.size.width
#define SCREEN_H self.view.bounds.size.height

@interface GPSendProductController ()<UIPickerViewDelegate,UIPickerViewDataSource,UITextViewDelegate,UIGestureRecognizerDelegate,MessagePhotoViewDelegate,ZBMessageShareMenuViewDelegate>
{
    UIView * _view;
    UIButton * _upLoadBtn;
}
@property (nonatomic, weak) CZTextView *textView;
@property (nonatomic,strong) MessagePhotoView *photoView;
/**
 *  存放数据的数组
 */
@property (nonatomic,strong)NSArray *citiesArray;
/**
 *  pickerview
 */
@property (strong, nonatomic) UIPickerView *pickerView;
/**
 *  选择按钮
 */
@property (strong, nonatomic)  UIButton * chooseBtn;

/**
 *  父类 模型
 */
@property (nonatomic,strong)GPCategaryModel * selecletPro;

@end

@implementation GPSendProductController

/**
 *  懒加载
 */
-(NSArray *)citiesArray{
    if (!_citiesArray) {
        NSArray *array = [NSArray arrayWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"02cities" ofType:@"plist"]];
        NSMutableArray *nmArray = [NSMutableArray arrayWithCapacity:array.count];
        for (NSDictionary *dic in array) {
            [nmArray addObject:[GPCategaryModel citiesWithDic:dic]];
        }
        _citiesArray = nmArray;
    }
    return _citiesArray;
}
//[self.view bringSubviewToFront:_view];
- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor groupTableViewBackgroundColor];
    self.navigationItem.title = @"产品信息添加";
    
    UIBarButtonItem *right = [UIBarButtonItem barButtonItemWithTitle:@"添加" target:self action:@selector(addProduct) forControlEvents:UIControlEventTouchUpInside];
    // 设置导航条的按钮
    self.navigationItem.rightBarButtonItem = right;
    
    [self buildUI];
    
    //上传商城图片
    [self upLoadPic];
    [self upLoadPho];
    
    //创建地址选择器
    [self createPickerView];
    [self pickerView:self.pickerView didSelectRow:0 inComponent:0];
    
   
}

-(void)buildUI{
    //产品名称
    UILabel * label = [[UILabel alloc]initWithFrame:CGRectMake(10, 79, 60, 30)];
    label.text = @"产品名称:";
    label.font = [UIFont systemFontOfSize:13];
    [self.view addSubview:label];
    
    UITextField * nameFiled = [[UITextField alloc]initWithFrame:CGRectMake(80, 79, SCREEN_W - 90, 30)];
    nameFiled.borderStyle  = 0;
    nameFiled.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:nameFiled];
    
    //产品类别
    UILabel * labelCategory = [[UILabel alloc]initWithFrame:CGRectMake(10, 120, 60, 30)];
    labelCategory.text = @"产品类别:";
    labelCategory.font = [UIFont systemFontOfSize:13];
    [self.view addSubview:labelCategory];
    
    UIButton * btn = [[UIButton alloc]initWithFrame:CGRectMake(80, 120, SCREEN_W - 90, 30)];
    [btn setTitle:@"选择类别" forState:UIControlStateNormal];
    btn.backgroundColor = [UIColor lightGrayColor];
    [btn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [btn addTarget:self action:@selector(chooose) forControlEvents:UIControlEventTouchUpInside];
    _chooseBtn = btn;
    [self.view addSubview:btn];
    
    //产品简介
    UILabel * labelintro = [[UILabel alloc]initWithFrame:CGRectMake(10, 160, 60, 30)];
    labelintro.text = @"产品简介:";
    labelintro.font = [UIFont systemFontOfSize:13];
    [self.view addSubview:labelintro];
    
    UITextField * introFiled = [[UITextField alloc]initWithFrame:CGRectMake(80, 160, SCREEN_W - 90, 30)];
    introFiled.borderStyle  = 0;
    introFiled.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:introFiled];
    
    //产品详细信息
    UILabel * labelDetail = [[UILabel alloc]initWithFrame:CGRectMake(10, 200, 100, 30)];
    labelDetail.text = @"产品详细信息：";
    labelDetail.font = [UIFont systemFontOfSize:13];
    [self.view addSubview:labelDetail];
    
    CZTextView *textView = [[CZTextView alloc]initWithFrame:CGRectMake(10, 240, self.view.bounds.size.width - 20, 100)];
    _textView = textView;

    textView.font = [UIFont systemFontOfSize:15];
    [self.view addSubview:textView];
    
    // 默认允许垂直方向拖拽
    textView.alwaysBounceVertical = YES;
    
    // 监听拖拽
    _textView.delegate = self;
    
    
    //产品价格
    UILabel * labelPrice = [[UILabel alloc]initWithFrame:CGRectMake(10, 350, 60, 30)];
    labelPrice.text = @"产品价格:";
    labelPrice.font = [UIFont systemFontOfSize:13];
    [self.view addSubview:labelPrice];
    
    UITextField * priceFiled = [[UITextField alloc]initWithFrame:CGRectMake(80, 350, SCREEN_W - 90, 30)];
    priceFiled.borderStyle  = 0;
    priceFiled.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:priceFiled];

    
    //产品数量
    UILabel * labelNum = [[UILabel alloc]initWithFrame:CGRectMake(10, 390, 60, 30)];
    labelNum.text = @"产品数量:";
    labelNum.font = [UIFont systemFontOfSize:13];
    [self.view addSubview:labelNum];
    
    UITextField * NumFiled = [[UITextField alloc]initWithFrame:CGRectMake(80, 390, SCREEN_W - 90, 30)];
    NumFiled.borderStyle  = 0;
    NumFiled.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:NumFiled];

 
}

#pragma mark 上传图片按钮
-(void)upLoadPic{
    // 上传图片按钮
    UIButton *btn = [[UIButton alloc]initWithFrame:CGRectMake(50, 430, self.view.bounds.size.width - 100, 20)];
    [btn setTitle:@"添加要上传的产品图片" forState:UIControlStateNormal];
    btn.layer.cornerRadius = 8;
    btn.backgroundColor = [UIColor grayColor];
    [btn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [btn setTitleColor:[UIColor whiteColor] forState:UIControlStateDisabled];
    
    _upLoadBtn = btn;
    [self.view addSubview:_upLoadBtn];
}


//添加图片
-(void)upLoadPho{
    if (!self.photoView)
    {
        self.photoView = [[MessagePhotoView alloc]initWithFrame:CGRectMake(0,460,self.view.frame.size.width, 150)];
        [self.view addSubview:self.photoView];
        self.photoView.delegate = self;
        
    }
}

//实现代理方法
-(void)addPicker:(UIImagePickerController *)picker{
    
    NSLog(@"...");
}


#pragma mark - ZBMessageShareMenuView Delegate
- (void)didSelecteShareMenuItem:(ZBMessageShareMenuItem *)shareMenuItem atIndex:(NSInteger)index{
    
    
    
}

-(void)chooose{
    
    //首先创建一个位于屏幕下方看不到的view
    //动画弹出地址选择页面
    [UIView animateWithDuration:0.6 animations:^{
        _view.transform = CGAffineTransformMakeTranslation(0, -350);
    }];


}
-(void)createPickerView{
    _view = [[UIView alloc]initWithFrame:CGRectMake(0, SCREEN_H+155, SCREEN_W, 200)];
    _view.backgroundColor = [UIColor grayColor];
    
    [self.view addSubview:_view];
    
    //创建一个pickerView放到view上
    _pickerView = [[UIPickerView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_W, 170)];
    //设置pickerView代理
    _pickerView.delegate = self;
    _pickerView.dataSource = self;
    
    [_view addSubview:_pickerView];
    
    //创建一个按钮放在view上，用于选择完子类后确定
    UIButton *button = [UIButton buttonWithType:UIButtonTypeSystem];
    [button addTarget:self action:@selector(doneClick) forControlEvents:UIControlEventTouchUpInside];
    button.backgroundColor = [UIColor blackColor];
    button.frame = CGRectMake(0, 0, SCREEN_W, 40);
    button.userInteractionEnabled = YES;
    [button setTitle:@"确定" forState:UIControlStateNormal];
    button.titleLabel.font = [UIFont boldSystemFontOfSize:20];
    [button setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [_view addSubview:button];

}

#pragma mark --uipickerviewdatasource中的方法
-(NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView{
    return 2;
}
-(NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component{
    
    if (component == 0) {
        return self.citiesArray.count;
    }else{
        
        // 2.如果是第1组，父类 父类的行数就要看当前正在显示的是哪个父类
        //获取省的索引
        NSInteger seleProIndx = [pickerView selectedRowInComponent:0];
        //获取当前父类的数据
        GPCategaryModel * selePro = self.citiesArray[seleProIndx];
        //保存当前父类的数据
        self.selecletPro = selePro;
        //返回省的子类的个数
        return selePro.cities.count;
        
    }
}
//返回每一行
-(NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component{
    if (component == 0) {
        
        //返回父类的名字
        GPCategaryModel * city = self.citiesArray[row];
        return city.name;
    }else{
    
        //返回保存的父类里面的内容
        return self.selecletPro.cities[row];
    }
    
}
//当用户选中某一行是刷新
-(void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component{
    if (component == 0) {
        [pickerView reloadComponent:1];
    }
    //选择了第几组的行
    NSInteger selePro = [pickerView selectedRowInComponent:0];
    NSInteger seleCity = [pickerView selectedRowInComponent:1];
    
    //获取内容
    GPCategaryModel * pro = self.citiesArray[selePro];
    //    NSString * city = pro.cities[seleCity];
    //获取保存的父类里面的子类
    NSString * city = self.selecletPro.cities[seleCity];
    //赋值
    [_chooseBtn setTitle:[NSString stringWithFormat:@"%@->%@",pro.name,city] forState:UIControlStateNormal];
}


-(void)doneClick{
    //选择完成后动画隐藏pickerView
    [UIView animateWithDuration:0.6 animations:^{
    _view.transform = CGAffineTransformIdentity;;
        
        
    }];
    
}


-(void)addProduct{
    NSLog(@"上传了");
}

@end

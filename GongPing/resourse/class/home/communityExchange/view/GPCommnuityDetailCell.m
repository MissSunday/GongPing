//
//  GPCommnuityDetailCell.m
//  工平矿业
//
//  Created by apple on 16/6/11.
//  Copyright © 2016年 xiaoAn. All rights reserved.
//

#import "GPCommnuityDetailCell.h"
#import "GPCommunitViewFrame.h"
#import "GPCommunityModel.h"
#import "UIImageView+WebCache.h"


@interface GPCommnuityDetailCell ()
// 头像
@property (nonatomic, weak) UIImageView *iconView;


// 昵称
@property (nonatomic, weak) UILabel *nameView;


// 投诉
@property (nonatomic, weak) UIButton *illBtn;


// 时间
@property (nonatomic, weak) UILabel *timeView;

// 正文
@property (nonatomic, weak) UILabel *textView;

@end

@implementation GPCommnuityDetailCell

#define CZNameFont [UIFont systemFontOfSize:13]
#define CZTimeFont [UIFont systemFontOfSize:12]
#define CZTextFont [UIFont systemFontOfSize:13]

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        
        // 添加所有子控件
        [self setUpChildView];
        self.backgroundColor = [UIColor clearColor];
    }
    
    return self;
}

+ (instancetype)cellWithTableView:(UITableView *)tableView
{
    static NSString *ID = @"cell";
    id cell = [tableView dequeueReusableCellWithIdentifier:ID ];
    
    if (cell == nil) {
        cell = [[self alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:ID];
        
        
    }
    
    return cell;
}


// 添加所有子控件
- (void)setUpChildView
{
    // 头像
    UIImageView *iconView = [[UIImageView alloc] init];
    [self addSubview:iconView];
    _iconView = iconView;
    
    // 昵称
    UILabel *nameView = [[UILabel alloc] init];
    nameView.font = CZNameFont;
    [self addSubview:nameView];
    _nameView = nameView;
    
    // vip
    UIButton *btn = [[UIButton alloc] init];
    [self addSubview:btn];
    [btn setTitle:@"投诉" forState:UIControlStateNormal];
    _illBtn = btn;
    
    // 时间
    UILabel *timeView = [[UILabel alloc] init];
    timeView.font = CZTimeFont;
    timeView.textColor = [UIColor orangeColor];
    [self addSubview:timeView];
    _timeView = timeView;
    
   
    
    // 正文
    UILabel *textView = [[UILabel alloc] init];
    textView.font = CZTextFont;
    textView.numberOfLines = 0;
    [self addSubview:textView];
    _textView = textView;
    

}


/*
 问题：1.cell的高度应该提前计算出来
 2.cell的高度必须要先计算出每个子控件的frame，才能确定
 3.如果在cell的setStatus方法计算子控件的位置，会比较耗性能
 
 解决:MVVM思想
 M:模型
 V:视图
 VM:视图模型（模型包装视图模型，模型+模型对应视图的frame）
 
 
 */
-(void)setCommunityF:(GPCommunitViewFrame *)communityF{
   
    _communityF = communityF;
     NSLog(@"%@", _communityF.community);
   
    // 设置data
    [self setUpData];
    
    // 设置frame
    [self setUpFrame];
   
}

- (void)setUpData
{
    NSLog(@"%@", _communityF.community);
    GPCommunityModel *model  = _communityF.community;
    // 头像
    [_iconView sd_setImageWithURL:[NSURL URLWithString:model.originalIcon] placeholderImage:[UIImage imageNamed:@"timeline_image_placeholder"]];
    
    // 昵称
    
    _nameView.textColor = [UIColor blackColor];
    
    _nameView.text = model.name;
    
    
    // 时间
    _timeView.text = model.created_at;
    
    // 正文
    _textView.text = model.text;
    
}

- (void)setUpFrame
{
    // 头像
    _iconView.frame = _communityF.originalIconFrame;
    
    // 昵称
    _nameView.frame = _communityF.originalNameFrame;
    
    // 投诉
    
    _illBtn.frame = _communityF.illegal;
    
    // 时间 每次有新的时间都需要计算时间frame
    GPCommunityModel *model  = _communityF.community;
    CGFloat timeX = _nameView.frame.origin.x;
    CGFloat timeY = CGRectGetMaxY( _nameView.frame) + CZStatusCellMargin * 0.5;
    CGSize timeSize = [model.created_at sizeWithFont:CZTimeFont];
    _timeView.frame = (CGRect){{timeX,timeY},timeSize};
    
    // 正文
    _textView.frame = _communityF.originalTextFrame;
    
  
    
}



@end

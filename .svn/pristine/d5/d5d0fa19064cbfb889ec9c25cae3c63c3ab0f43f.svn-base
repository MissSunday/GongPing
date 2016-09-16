//
//  CZTextView.m
//  传智微博
//
//  Created by apple on 15-3-13.
//  Copyright (c) 2015年 apple. All rights reserved.
//

#import "CZTextView.h"
#import "UIView+Frame.h"
@interface CZTextView ()

@property (nonatomic, weak) UILabel *placeHolderLabel;

@end

@implementation CZTextView
- (instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        self.font = [UIFont systemFontOfSize:13];
        self.layer.cornerRadius=5.0f;
        //self.layer.masksToBounds=YES;
        //self.layer.borderColor=[[UIColor blackColor]CGColor];
        //self.layer.borderWidth= 1.0f;
    
    }
    return self;
}
- (UILabel *)placeHolderLabel
{
    if (_placeHolderLabel == nil) {
        
        UILabel *label = [[UILabel alloc] init];
        

        [self addSubview:label];
        
        _placeHolderLabel = label;
        
    }
    
    return _placeHolderLabel;
}

- (void)setFont:(UIFont *)font
{
    [super setFont:font];
    
    self.placeHolderLabel.font = font;
    [self.placeHolderLabel sizeToFit];
}

- (void)setPlaceHolder:(NSString *)placeHolder
{
    _placeHolder = placeHolder;
    
    self.placeHolderLabel.text = placeHolder;
    // label的尺寸跟文字一样
    [self.placeHolderLabel sizeToFit];
}

- (void)setHidePlaceHolder:(BOOL)hidePlaceHolder
{
    _hidePlaceHolder = hidePlaceHolder;
    
    
    self.placeHolderLabel.hidden = hidePlaceHolder;
    
}


- (void)layoutSubviews
{
    [super layoutSubviews];

    self.placeHolderLabel.x = 5;
    self.placeHolderLabel.y = 8;
    
}

@end

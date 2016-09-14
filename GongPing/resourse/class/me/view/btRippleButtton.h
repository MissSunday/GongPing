//
//  BTRippleButtton.h
//  BTSimpleRippleButton
//
//  Created by Balram Tiwari on 01/06/14.
//  Copyright (c) 2014 Balram. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void (^completion)(BOOL success);

@interface BTRippleButtton : UIView{
    @private
    
    UILabel *title;
    UITapGestureRecognizer *gesture;
    SEL methodName;
    id superSender;
    UIColor *rippleColor;
    NSArray *rippleColors;
    BOOL isRippleOn;
}

@property (nonatomic, copy) completion block;
@property(nonatomic ,strong)UIImageView *imageView;


-(instancetype)initWithImage:(UIImage *)image andFrame:(CGRect)frame andTarget:(SEL)action andID:(id)sender;

-(instancetype)initWithFrame:(CGRect)frame onCompletion:(completion)completionBlock;

-(void)setRippleEffectWithColor:(UIColor *)color;
-(void)setRippeEffectEnabled:(BOOL)setRippeEffectEnabled;

@end

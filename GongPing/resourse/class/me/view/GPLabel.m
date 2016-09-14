//
//  GPLabel.m
//  公平矿业
//
//  Created by apple on 16/6/7.
//  Copyright © 2016年 xiaoAn. All rights reserved.
//

#import "GPLabel.h"

@implementation UILabel (Extension)



+(UILabel*)labelWithName:(NSString *)name  WithFrame:(CGRect)frame Font:(NSInteger)Num{
    UILabel * label = [[UILabel alloc]initWithFrame:frame];
    label.text = name;
    label.font = [UIFont systemFontOfSize:Num];
    return label;
}
@end

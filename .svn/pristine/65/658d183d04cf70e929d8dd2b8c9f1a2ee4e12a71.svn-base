//
//  GPCommunitViewFrame.m
//  工平矿业
//
//  Created by apple on 16/6/11.
//  Copyright © 2016年 xiaoAn. All rights reserved.
//

#import "GPCommunitViewFrame.h"
#import "GPCommunityModel.h"

#define GPCommCellMargin 10

#define Font [UIFont systemFontOfSize:14]
@implementation GPCommunitViewFrame


-(void)setCommunity:(GPCommunityModel *)community{
    _community = community;
    [self setUpFrame];
}

-(void)setUpFrame{
    // 头像
    CGFloat imageX = CZStatusCellMargin;
    CGFloat imageY = imageX;
    CGFloat imageWH = 35;
    _originalIconFrame = CGRectMake(imageX, imageY, imageWH, imageWH);
    
    // 昵称
    CGFloat nameX = CGRectGetMaxX(_originalIconFrame) + GPCommCellMargin;
    CGFloat nameY = imageY;
    CGSize nameSize = [_community.name sizeWithFont:[UIFont systemFontOfSize:14]];
    _originalNameFrame = (CGRect){{nameX,nameY},nameSize};
    
    // 举报
    
    CGFloat vipX = CGRectGetMaxX(_originalNameFrame) + GPCommCellMargin;
    CGFloat vipY = nameY;
    CGFloat vipWH = 30;
    CGFloat vipHH = 20;
    _illegal = CGRectMake(vipX, vipY, vipWH, vipHH);
        
    
    // 正文
    CGFloat textX = imageX;
    CGFloat textY = CGRectGetMaxY(_originalIconFrame) + GPCommCellMargin;
    
    CGFloat textW = [UIScreen mainScreen].bounds.size.width - 2 * 10;
    CGSize textSize = [_community.text sizeWithFont:Font constrainedToSize:CGSizeMake(textW, MAXFLOAT)];
    _originalTextFrame = (CGRect){{textX,textY},textSize};
    
    CGFloat originH = CGRectGetMaxY(_originalTextFrame) + GPCommCellMargin;
}

@end

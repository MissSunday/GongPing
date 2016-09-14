//
//  CYAddressTableViewCell.m
//  jdcjsr
//
//  Created by apple on 15/12/16.
//  Copyright (c) 2015年 apple. All rights reserved.
//

#import "GPInvientNumberTableViewCell.h"
@interface GPInvientNumberTableViewCell()

@end
@implementation GPInvientNumberTableViewCell


-(id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    self=[super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if(self){
    //self.backgroundColor = [UIColor whiteColor];
    self.imgView = [[UIImageView alloc]initWithFrame:CGRectMake(5, 15, 10, 10)];
    self.imgView.image = [UIImage imageNamed:@"weixuanzhong.png"];
    self.imgView.backgroundColor = [UIColor whiteColor];
    [self addSubview:self.imgView];
    self.addressLabel = [[UILabel alloc]initWithFrame:CGRectMake(30,11,self.contentView.bounds.size.width-70,30)];
    self.addressLabel.numberOfLines=2;
    self.addressLabel.font=[UIFont systemFontOfSize:15];
    [self addSubview:self.addressLabel];
    self.btn = [[UIButton alloc]initWithFrame:CGRectMake(30,110,self.contentView.bounds.size.width-40,30)];
    [self addSubview:self.btn];
        
    }
    return self;
}
@end

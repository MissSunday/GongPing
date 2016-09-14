//
//  GPMyMessageTableCell.m
//  公平矿业
//
//  Created by apple on 16/6/16.
//  Copyright © 2016年 xiaoAn. All rights reserved.
//

#import "GPMyMessageTableCell.h"

@implementation GPMyMessageTableCell

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}
+(id)deatilCell{
    return [[NSBundle mainBundle] loadNibNamed:@"GPMyMessageTableCell" owner:nil options:nil][0];
    
}
+(NSString *)ID{
    return @"cell";
}
+(CGFloat)cellHeight{
    return 40;
}
@end

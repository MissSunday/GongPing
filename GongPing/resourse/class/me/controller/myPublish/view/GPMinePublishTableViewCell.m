//
//  GPMinePublishTableViewCell.m
//  公平矿业
//
//  Created by apple on 16/6/15.
//  Copyright © 2016年 xiaoAn. All rights reserved.
//

#import "GPMinePublishTableViewCell.h"
@interface GPMinePublishTableViewCell ()

@property (weak, nonatomic) IBOutlet UILabel *nameLabel;
@property (weak, nonatomic) IBOutlet UILabel *timeLabel;

@end


@implementation GPMinePublishTableViewCell

- (void)awakeFromNib {
    
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

+(id)deatilCell{
    return [[NSBundle mainBundle] loadNibNamed:@"GPMinePublishTableViewCell" owner:nil options:nil][0];
    
}
+(NSString *)ID{
    return @"cell";
}
+(CGFloat)cellHeight{
    return 40;
}

@end

//
//  DNCommunityListTableViewCell.m
//  工平矿业
//
//  Created by apple on 16/7/14.
//  Copyright © 2016年 xiaoAn. All rights reserved.
//

#import "DNCommunityListTableViewCell.h"
#import "UIImageView+WebCache.h"
@implementation DNCommunityListTableViewCell

- (void)awakeFromNib {
    // Initialization code
}
-(void)setModel:(DNCommunityListModel *)model
{
    NSString*imageUrl=[NSString stringWithFormat:@"http://192.168.0.14/XiYuanUpload/%@",model.sqPicurl];
    [self.picImage sd_setImageWithURL:[NSURL URLWithString:[imageUrl substringToIndex:imageUrl.length-1]]];
    self.comName.text=model.sqName;
    self.topicName.text=model.htName;
}
- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end

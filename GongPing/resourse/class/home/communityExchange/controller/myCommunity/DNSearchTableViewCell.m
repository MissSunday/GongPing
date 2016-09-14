//
//  DNSearchTableViewCell.m
//  公平矿业
//
//  Created by apple on 16/7/15.
//  Copyright © 2016年 xiaoAn. All rights reserved.
//

#import "DNSearchTableViewCell.h"
#import "UIImageView+WebCache.h"
@implementation DNSearchTableViewCell


-(void)setModel:(DNCommunityListModel *)model
{
    NSString*imageUrl=[NSString stringWithFormat:@"http://192.168.0.14/XiYuanUpload/%@",model.sqPicurl];
    [self.sqPicImage sd_setImageWithURL:[NSURL URLWithString:[imageUrl substringToIndex:imageUrl.length-1]]];
    self.sqName.text=model.sqName;
    self.htName.text=model.htName;
}
- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end

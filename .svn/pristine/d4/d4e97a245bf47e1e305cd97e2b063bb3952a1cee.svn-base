//
//  DNJoinCommunityTableViewCell.m
//  工平矿业
//
//  Created by apple on 16/7/16.
//  Copyright © 2016年 xiaoAn. All rights reserved.
//

#import "DNJoinCommunityTableViewCell.h"
#import "UIImageView+WebCache.h"
@implementation DNJoinCommunityTableViewCell

-(void)setModel:(DNPublished_Approve_ViolationsModel *)model
{

     NSString*imageUrl=[NSString stringWithFormat:@"http://192.168.0.14/XiYuanUpload/%@",model.SQ_PICURL];
    [self.headImageView sd_setImageWithURL:[NSURL URLWithString:[imageUrl substringToIndex:imageUrl.length-1]]];
    self.communityName.text=model.SQ_NAME;
}
- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end

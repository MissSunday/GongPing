//
//  DNLastAnswerTableViewCell.m
//  公平矿业
//
//  Created by apple on 16/7/18.
//  Copyright © 2016年 xiaoAn. All rights reserved.
//

#import "DNLastAnswerTableViewCell.h"
#import "UIImageView+WebCache.h"
@implementation DNLastAnswerTableViewCell


-(void)setModel:(DNLastAnswerDetailModel *)model
{
    NSString*imageUrl=[NSString stringWithFormat:@"http://192.168.0.14/XiYuanUpload/%@",model.PICURL];
    [self.headImageView sd_setImageWithURL:[NSURL URLWithString:imageUrl]];
    self.publisherLabel.text=model.USER_NICKNAME;
    self.topicLabel.text=model.HT_NAME;
    NSDateFormatter*formatter=[[NSDateFormatter alloc]init];
    formatter.timeZone = [NSTimeZone timeZoneWithName:@"beijing"];
    [formatter setDateStyle:NSDateFormatterMediumStyle];
    [formatter setTimeStyle:NSDateFormatterShortStyle];
    NSTimeInterval _interval = [model.CREATE_TIME doubleValue]/1000.0;
    [formatter setDateFormat:@"yyy-MM-dd"];
    NSDate* date = [NSDate dateWithTimeIntervalSince1970:_interval];
    self.PublishTimeLabel.text = [formatter stringFromDate:date];
    self.answerNumLabel.text=[NSString stringWithFormat:@"%@",model.TZSL];
}
- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end

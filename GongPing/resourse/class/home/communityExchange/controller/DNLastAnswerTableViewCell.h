//
//  DNLastAnswerTableViewCell.h
//  公平矿业
//
//  Created by apple on 16/7/18.
//  Copyright © 2016年 xiaoAn. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DNLastAnswerDetailModel.h"
@interface DNLastAnswerTableViewCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UIImageView *headImageView;
@property (weak, nonatomic) IBOutlet UILabel *topicLabel;
@property (weak, nonatomic) IBOutlet UIButton *reportBtn;
@property (weak, nonatomic) IBOutlet UILabel *publisherLabel;
@property (weak, nonatomic) IBOutlet UILabel *PublishTimeLabel;
@property (weak, nonatomic) IBOutlet UILabel *answerNumLabel;
@property(nonatomic,strong)DNLastAnswerDetailModel*model;
@end

//
//  DNCommunityListTableViewCell.h
//  公平矿业
//
//  Created by apple on 16/7/14.
//  Copyright © 2016年 xiaoAn. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DNCommunityListModel.h"
@interface DNCommunityListTableViewCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UIImageView *picImage;
@property (weak, nonatomic) IBOutlet UILabel *comName;
@property (weak, nonatomic) IBOutlet UILabel *topicName;
@property(nonatomic,strong)DNCommunityListModel*model;
@end

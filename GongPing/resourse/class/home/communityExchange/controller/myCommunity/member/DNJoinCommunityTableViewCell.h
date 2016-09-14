//
//  DNJoinCommunityTableViewCell.h
//  公平矿业
//
//  Created by apple on 16/7/16.
//  Copyright © 2016年 xiaoAn. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DNPublished-Approve-ViolationsModel.h"
@interface DNJoinCommunityTableViewCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UIImageView *headImageView;
@property (weak, nonatomic) IBOutlet UILabel *communityName;
@property (weak, nonatomic) IBOutlet UIButton *joinBtn;
@property(nonatomic,strong)DNPublished_Approve_ViolationsModel*model;
@end

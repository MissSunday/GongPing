//
//  DNSearchTableViewCell.h
//  公平矿业
//
//  Created by apple on 16/7/15.
//  Copyright © 2016年 xiaoAn. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DNCommunityListModel.h"
@interface DNSearchTableViewCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UIImageView *sqPicImage;
@property (weak, nonatomic) IBOutlet UILabel *sqName;
@property (weak, nonatomic) IBOutlet UILabel *htName;
@property(nonatomic,strong)DNCommunityListModel*model;
@end

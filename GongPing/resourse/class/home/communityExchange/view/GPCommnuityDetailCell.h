//
//  GPCommnuityDetailCell.h
//  公平矿业
//
//  Created by apple on 16/6/11.
//  Copyright © 2016年 xiaoAn. All rights reserved.
//

#import <UIKit/UIKit.h>
@class GPCommunitViewFrame;
@interface GPCommnuityDetailCell : UITableViewCell

@property (nonatomic, strong) GPCommunitViewFrame * communityF;
+ (instancetype)cellWithTableView:(UITableView *)tableView;
@end

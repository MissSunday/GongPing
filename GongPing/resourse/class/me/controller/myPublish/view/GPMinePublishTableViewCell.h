//
//  GPMinePublishTableViewCell.h
//  公平矿业
//
//  Created by apple on 16/6/15.
//  Copyright © 2016年 xiaoAn. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface GPMinePublishTableViewCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UIButton *edit;

@property (weak, nonatomic) IBOutlet UIButton *deleteBtn;

+(NSString *)ID;
+(id)deatilCell;
+(CGFloat)cellHeight;
@end

//
//  GPMyMessageTableCell.h
//  公平矿业
//
//  Created by apple on 16/6/16.
//  Copyright © 2016年 xiaoAn. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface GPMyMessageTableCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UILabel *MyMessage;

@property (weak, nonatomic) IBOutlet UIButton *agreeBtn;

@property (weak, nonatomic) IBOutlet UIButton *refuseBtn;

+(NSString *)ID;
+(id)deatilCell;
+(CGFloat)cellHeight;

@end

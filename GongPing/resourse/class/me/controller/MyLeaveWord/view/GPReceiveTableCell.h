//
//  GPReceiveTableCell.h
//  工平矿业
//
//  Created by apple on 16/6/16.
//  Copyright © 2016年 xiaoAn. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface GPReceiveTableCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UILabel *productName;

@property (weak, nonatomic) IBOutlet UIButton *receivedMessageBtn;


+(NSString *)ID;
+(id)deatilCell;
+(CGFloat)cellHeight;
@end

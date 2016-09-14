//
//  GPMineCaptainCollectionViewCell.h
//  公平矿业
//
//  Created by apple on 16/6/14.
//  Copyright © 2016年 xiaoAn. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface GPMineCaptainCollectionViewCell : UICollectionViewCell

@property (weak, nonatomic) IBOutlet UIImageView *iconImage;
@property (weak, nonatomic) IBOutlet UILabel *name;


@property (weak, nonatomic) IBOutlet UIButton *inviteBtn;
@property (nonatomic,copy)NSString * sqId;
@end

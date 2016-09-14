//
//  GPMeController.h
//  工平矿业
//
//  Created by apple on 16/6/1.
//  Copyright © 2016年 xiaoAn. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Member.h"
//浪起来
#import "JSWave.h"
#import "TMStatusUtility.h"
#import "btRippleButtton.h"

#import "LoginViewController.h"

#import "GPproductCategaryController.h"

#import "LZPageViewController.h"
#import "GPMineCommunityLeaderController.h"
#import "GPMineCommuintyNumberController.h"

#import "GPMyCaptainCommunionController.h"

#import "GPPersonalInfoController.h"
//跳转VC
#import "GPMyMallController.h"

#import "GPMinePublishController.h"

#import "GPMyMessageTableController.h"

#import "GPMyReceivedTableController.h"
#import "GPMySentTableController.h"

#import "GPMineNewsInfoController.h"

#import "GPMineMemberController.h"

#import "Member+net.h"
#import "TMStatusUtility.h"
#import "GPMeController.h"

@interface GPMeController : UITableViewController

@property (strong, nonatomic) UITableView *metableview;
@property(nonatomic,strong)JSWave *headerView;
@property (nonatomic, strong) BTRippleButtton *unLoginBtnBg;
@property (nonatomic, strong)UIButton *userPhone;


@end

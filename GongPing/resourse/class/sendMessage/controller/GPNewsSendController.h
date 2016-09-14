//
//  GPNewsSendController.h
//  公平矿业
//
//  Created by apple on 16/6/4.
//  Copyright © 2016年 xiaoAn. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "CZTextView.h"


@interface GPNewsSendController : UIViewController



@property (nonatomic, weak) CZTextView *textView;
@property (nonatomic,weak)UIButton * btnSend;
@property (nonatomic,strong)UITextField * nameText;
@end

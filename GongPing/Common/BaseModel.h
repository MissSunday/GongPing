//
//  BaseModel.h
//  网络项目-爱限免
//
//  Created by 田雨飞 on 16/3/29.
//  Copyright (c) 2016年 田雨飞. All rights reserved.
//

#import "JSONModel.h"
#import "Reachability.h"    //检测网络状态的类

@interface BaseModel : JSONModel

+(Reachability *)defultRechability;

@end

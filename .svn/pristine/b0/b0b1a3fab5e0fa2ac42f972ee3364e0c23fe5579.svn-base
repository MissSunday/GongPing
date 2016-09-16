//
//  BaseModel.m
//  网络项目-爱限免
//
//  Created by 田雨飞 on 16/3/29.
//  Copyright (c) 2016年 田雨飞. All rights reserved.
//

#import "BaseModel.h"

@implementation BaseModel
//当字典和数据模型不完全匹配时,仍然继续赋值
+(BOOL)propertyIsOptional:(NSString *)propertyName
{
    return YES;
}

+(Reachability *)defultRechability
{
    static Reachability *reacha;
    static dispatch_once_t token;
    dispatch_once(&token, ^{
        //创建检测网络的对象
        reacha = [Reachability reachabilityForInternetConnection];
    });
    return reacha;
}

@end

//
//  GPCategaryModel.m
//  公平矿业
//
//  Created by apple on 16/6/8.
//  Copyright © 2016年 xiaoAn. All rights reserved.
//

#import "GPCategaryModel.h"

@implementation GPCategaryModel

/**
 *  重写init方法
 */
-(instancetype)initWithDic:(NSDictionary *)dic{
    if (self == [super init]) {
        [self setValuesForKeysWithDictionary:dic];
    }
    return self;
}

+(instancetype)citiesWithDic:(NSDictionary *)dic{
    return [[self alloc]initWithDic:dic];
}

@end

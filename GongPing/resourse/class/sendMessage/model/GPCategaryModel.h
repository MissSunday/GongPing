//
//  GPCategaryModel.h
//  工平矿业
//
//  Created by apple on 16/6/8.
//  Copyright © 2016年 xiaoAn. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface GPCategaryModel : NSObject

@property (nonatomic,strong)NSArray *cities;
@property (nonatomic,copy)NSString *name;

//重写init方法
-(instancetype)initWithDic:(NSDictionary *)dic;
+(instancetype)citiesWithDic:(NSDictionary *)dic;
@end

//
//  BaseRequest.h
//  网络项目-爱限免
//
//  Created by 田雨飞 on 16/3/29.
//  Copyright (c) 2016年 田雨飞. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Member.h"
@interface BaseRequest : NSObject

//GET 方法的封装
+(void)getWithURL:(NSString *)url parameter:(NSDictionary *)para completeHandle:(void(^)(id data, NSError *error))handle;
//POST 方法的封装
+(void)postWithURL:(NSString *)url parameter:(NSDictionary *)para completeHandle:(void(^)(id data, NSError *error))handle;

//登录请求
+(void)requestWithUrl:(NSString *)url completeBlock:(void(^)(Member*))success;



@end

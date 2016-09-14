//
//  BaseRequest.m
//  网络项目-爱限免
//
//  Created by 田雨飞 on 16/3/29.
//  Copyright (c) 2016年 田雨飞. All rights reserved.
//

#import "BaseRequest.h"

@implementation BaseRequest

+(void)getWithURL:(NSString *)url parameter:(NSDictionary *)para completeHandle:(void (^)(id, NSError *))handle
{
    //创建封装NSURLSession的管理对象
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    //设置二进制解析器
    manager.responseSerializer = [AFHTTPResponseSerializer serializer];
    [manager GET:url parameters:para success:^(NSURLSessionDataTask *task, id responseObject) {
        handle(responseObject, nil);
    } failure:^(NSURLSessionDataTask *task, NSError *error) {
        handle(nil, error);
    }];
    
}

+(void)postWithURL:(NSString *)url parameter:(NSDictionary *)para completeHandle:(void (^)(id, NSError *))handle
{
    //创建封装NSURLSession的管理对象
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    //设置二进制解析器
    manager.responseSerializer = [AFHTTPResponseSerializer serializer];
    [manager POST:url parameters:para success:^(NSURLSessionDataTask *task, id responseObject) {
        //成功回调
        handle(responseObject, nil);
    } failure:^(NSURLSessionDataTask *task, NSError *error) {
        //失败回调
        handle(nil, error);
    }];
}
+(void)requestWithUrl:(NSString *)url completeBlock:(void (^)(Member *))success
{
    //创建封装NSURLSession的管理对象
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    //设置二进制解析器
    manager.responseSerializer = [AFHTTPResponseSerializer serializer];
    [manager GET:url parameters:nil success:^(NSURLSessionDataTask *task, id responseObject) {
        
        success(responseObject);
        
    } failure:^(NSURLSessionDataTask *task, NSError *error) {
        
    }];

    
    
    
}

@end

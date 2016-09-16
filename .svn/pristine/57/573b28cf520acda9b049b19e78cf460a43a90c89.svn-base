//
//  DNProuductSearch+net.m
//  工平矿业
//
//  Created by apple on 16/7/11.
//  Copyright © 2016年 xiaoAn. All rights reserved.
//

#import "DNProuductSearch+net.h"
#import "BaseRequest.h"
@implementation DNProuductSearch (net)
+(void)requestWithURL:(NSString*)url PageIndex:(NSInteger)pageIndex callBack:(void(^)(NSArray*array, NSError *error))callBack
{
    NSDictionary *para = @{@"page":@(pageIndex)};
    [BaseRequest getWithURL:url parameter:para completeHandle:^(id data, NSError *error) {
        if (!error) {
            NSDictionary *dict = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:nil];
            NSDictionary*dic = dict[@"object"];
            NSArray*application=dic[@"result"];
            //将数组回传
            callBack((NSArray*)application, nil);
        }else{
            callBack(nil, error);
        }
    }];
}
@end

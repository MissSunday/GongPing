//
//  DNProductDesModel+net.m
//  公平矿业
//
//  Created by apple on 16/7/8.
//  Copyright © 2016年 xiaoAn. All rights reserved.
//

#import "DNProductDesModel+net.h"
#import "BaseRequest.h"
@implementation DNProductDesModel (net)
+(void)requestWithURL:(NSString*)url callBack:(void(^)(NSDictionary*dic, NSError *error))callBack
{
    [BaseRequest getWithURL:url parameter:nil completeHandle:^(id data, NSError *error) {
        if (!error) {
            NSDictionary *dict = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:nil];
            NSDictionary*application = dict[@"object"];
            //回传
            callBack((NSDictionary*)application, nil);
        }else{
            callBack(nil, error);
        }
    }];
}
@end

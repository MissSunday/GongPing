//
//  DNLastAnswerDetailModel+net.m
//  公平矿业
//
//  Created by apple on 16/7/18.
//  Copyright © 2016年 xiaoAn. All rights reserved.
//

#import "DNLastAnswerDetailModel+net.h"
#import "BaseRequest.h"
@implementation DNLastAnswerDetailModel (net)
+(void)requestWithURL:(NSString*)url callBack:(void(^)(NSArray*array, NSError *error))callBack
{
    
    [BaseRequest getWithURL:url parameter:nil completeHandle:^(id data, NSError *error) {
        if (!error) {
            NSDictionary *dict = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:nil];
            NSDictionary*application = dict[@"object"];
            NSArray*arr=application[@"result"];
            //将数组回传
            callBack((NSArray*)arr, nil);
        }else{
            callBack(nil, error);
        }
    }];
}
@end

//
//  GPCategaryIDModel+net.m
//  工平矿业
//
//  Created by apple on 16/7/7.
//  Copyright © 2016年 xiaoAn. All rights reserved.
//

#import "GPCategaryIDModel+net.h"
#import "BaseRequest.h"
@implementation GPCategaryIDModel (net)
+(void)requestWithURL:(NSString*)url callBack:(void(^)(NSArray*array, NSError *error))callBack
{
    [BaseRequest getWithURL:url parameter:nil completeHandle:^(id data, NSError *error) {
        if (!error) {
            NSDictionary *dict = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:nil];
            NSArray*application = dict[@"object"];
            //将数组回传
            callBack((NSArray*)application, nil);
        }else{
            callBack(nil, error);
        }
    }];
}
@end

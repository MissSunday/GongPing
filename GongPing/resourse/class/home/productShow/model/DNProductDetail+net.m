//
//  DNProductDetail+net.m
//  公平矿业
//
//  Created by apple on 16/7/8.
//  Copyright © 2016年 xiaoAn. All rights reserved.
//

#import "DNProductDetail+net.h"
#import "BaseRequest.h"
@implementation DNProductDetail (net)
+(void)requestWithURL:(NSString*)url PageIndex:(NSInteger)pageIndex callBack:(void(^)(NSArray*array, NSError *error))callBack
{
     NSDictionary *para = @{@"page":@(pageIndex)};
    [BaseRequest getWithURL:url parameter:para completeHandle:^(id data, NSError *error) {
        if (!error) {
            NSDictionary *dict = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:nil];
            NSDictionary*application = dict[@"object"];
            NSArray*resultArr=application[@"result"];
            //将数组回传
            callBack((NSArray*)resultArr, nil);
        }else{
            callBack(nil, error);
        }
    }];
}
@end

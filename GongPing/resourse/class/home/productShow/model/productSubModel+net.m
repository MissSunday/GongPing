//
//  productSubModel+net.m
//  工平矿业
//
//  Created by apple on 16/7/7.
//  Copyright © 2016年 xiaoAn. All rights reserved.
//

#import "productSubModel+net.h"
#import "BaseRequest.h"
@implementation productSubModel (net)
+(void)requestWithURL:(NSString*)url callBack:(void(^)(NSDictionary*dic, NSError *error))callBack
{
    [BaseRequest getWithURL:url parameter:nil completeHandle:^(id data, NSError *error) {
        if (!error) {
            
            NSDictionary *dict = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:nil];
            
            NSDictionary*application = dict[@"messageResult"];
            //将数组回传
            callBack((NSDictionary*)application, nil);
        }else{
            callBack(nil, error);
        }
    }];
}
@end

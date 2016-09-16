//
//  Member+net.m
//  test
//
//  Created by apple on 16/9/1.
//  Copyright © 2016年 xiaoAn. All rights reserved.
//

#import "Member+net.h"
#import "BaseRequest.h"

@implementation Member (net)
+(void)requestWithUrl:(NSString *)url callback:(void (^)(NSDictionary *))callback
{
    [BaseRequest getWithURL:url parameter:nil completeHandle:^(id data, NSError *error) {
        
        NSDictionary *dict = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:nil];
        
        NSDictionary*application = dict[@"messageResult"][@"object"];
       
        NSLog(@"%@",dict);
        //回传
        callback((NSDictionary*)application);
        
    }];
    
    
    
    
}
@end

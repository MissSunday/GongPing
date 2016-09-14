//
//  DNProuductSearch+net.h
//  公平矿业
//
//  Created by apple on 16/7/11.
//  Copyright © 2016年 xiaoAn. All rights reserved.
//

#import "DNProuductSearch.h"

@interface DNProuductSearch (net)
+(void)requestWithURL:(NSString*)url PageIndex:(NSInteger)pageIndex callBack:(void(^)(NSArray*array, NSError *error))callBack;
@end

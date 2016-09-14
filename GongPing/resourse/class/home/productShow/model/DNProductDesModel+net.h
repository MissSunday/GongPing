//
//  DNProductDesModel+net.h
//  公平矿业
//
//  Created by apple on 16/7/8.
//  Copyright © 2016年 xiaoAn. All rights reserved.
//

#import "DNProductDesModel.h"

@interface DNProductDesModel (net)
+(void)requestWithURL:(NSString*)url callBack:(void(^)(NSDictionary*dic, NSError *error))callBack;
@end

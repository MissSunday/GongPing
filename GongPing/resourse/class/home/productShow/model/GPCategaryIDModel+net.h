//
//  GPCategaryIDModel+net.h
//  公平矿业
//
//  Created by apple on 16/7/7.
//  Copyright © 2016年 xiaoAn. All rights reserved.
//

#import "GPCategaryIDModel.h"

@interface GPCategaryIDModel (net)
+(void)requestWithURL:(NSString*)url callBack:(void(^)(NSArray*array, NSError *error))callBack;
@end

//
//  DNLastAnswerNumModel+net.h
//  工平矿业
//
//  Created by apple on 16/7/18.
//  Copyright © 2016年 xiaoAn. All rights reserved.
//

#import "DNLastAnswerNumModel.h"

@interface DNLastAnswerNumModel (net)
+(void)requestWithURL:(NSString*)url callBack:(void(^)(NSArray*array, NSError *error))callBack;
@end

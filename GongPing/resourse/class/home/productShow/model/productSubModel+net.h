//
//  productSubModel+net.h
//  公平矿业
//
//  Created by apple on 16/7/7.
//  Copyright © 2016年 xiaoAn. All rights reserved.
//

#import "productSubModel.h"

@interface productSubModel (net)
+(void)requestWithURL:(NSString*)url callBack:(void(^)(NSDictionary*dic, NSError *error))callBack;
@end

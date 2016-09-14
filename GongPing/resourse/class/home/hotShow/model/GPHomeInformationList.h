//
//  GPHomeInformationList.h
//  公平矿业
//
//  Created by apple on 16/6/20.
//  Copyright © 2016年 xiaoAn. All rights reserved.
//

#import <Foundation/Foundation.h>


typedef void (^modelListToolSuccessBlock) (NSArray *models);
typedef void (^modelListToolFailureBlock) (NSError *error);

@interface GPHomeInformationList : NSObject

+(void)listToolSuccess:(modelListToolSuccessBlock)success failure:(modelListToolFailureBlock)failure withTag:(int)tag andPage:(int)page;



@end

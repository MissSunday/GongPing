//
//  GPHomeInfoList.m
//  工平矿业
//
//  Created by apple on 16/6/28.
//  Copyright © 2016年 xiaoAn. All rights reserved.
//

#import "GPHomeInfoList.h"

#import "CZHttpTool.h"
#import "GPHomeInfoMole.h"
@implementation GPHomeInfoList
+(void)listToolSuccess:(modelListToolSuccessBlock)success failure:(modelListToolFailureBlock)failure{
    
    NSMutableArray *models =[NSMutableArray array];
    
    [CZHttpTool GET:messageInfoUrl parameters:nil success:^(id responseObject) { // HttpTool请求成功的回调
        // 请求成功代码先保存
        NSDictionary *carlsit= responseObject[@"object"];
        
        for(NSDictionary *list in carlsit){
            GPHomeInfoMole * model = [GPHomeInfoMole new];
            model.zxId = list[@"zxId"];
            model.zxTitle = list[@"zxTitle"];
            model.zxDetail = list[@"zxDetail"];
            model.userId = list[@"userId"];
            [models addObject:model];
        }
        success(models);
        
        
    } failure:^(NSError *error) {
        if (failure) {
            failure(error);
        }
    }];
}
@end

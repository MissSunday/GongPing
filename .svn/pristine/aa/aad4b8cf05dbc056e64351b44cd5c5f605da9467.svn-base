//
//  GPHomeInformationList.m
//  工平矿业
//
//  Created by apple on 16/6/20.
//  Copyright © 2016年 xiaoAn. All rights reserved.
//

#import "GPHomeInformationList.h"
#import "CZHttpTool.h"
#import "GPHomeInformationModel.h"

@implementation GPHomeInformationList

+(void)listToolSuccess:(modelListToolSuccessBlock)success failure:(modelListToolFailureBlock)failure withTag:(int)tag andPage:(int)page{
    
    NSMutableArray *models =[NSMutableArray array];
    NSString * url = [NSString stringWithFormat:@"http://192.168.0.31/XYGPKY_App/Zixun/queryZixun/%d/%d.json",tag,page];
    //GPLog(@"%@",url);
    [CZHttpTool GET:url parameters:nil success:^(id responseObject) { // HttpTool请求成功的回调
        // 请求成功代码先保存
        NSDictionary *carlsit= responseObject[@"object"][@"result"];
        
        for(NSDictionary *list in carlsit){
            GPHomeInformationModel * model = [GPHomeInformationModel new];
            model.ZX_ID = list[@"ZX_ID"];
            model.ZX_TITLE = list[@"ZX_TITLE"];
            model.CREATE_TIME = list[@"CREATE_TIME"];
            [models addObject:model];
            
        }
       // NSLog(@"%@",models);
        success(models);
        
        
    } failure:^(NSError *error) {
        if (failure) {
            failure(error);
        }
    }];
}


@end

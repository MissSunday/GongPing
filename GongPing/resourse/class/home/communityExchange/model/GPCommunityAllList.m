//
//  GPCommunityAllList.m
//  公平矿业
//
//  Created by apple on 16/6/30.
//  Copyright © 2016年 xiaoAn. All rights reserved.
//

#import "GPCommunityAllList.h"

#import "CZHttpTool.h"
#import "GPCommunityAllModel.h"
@implementation GPCommunityAllList
+(void)listToolSuccess:(modelListToolSuccessBlock)success failure:(modelListToolFailureBlock)failure {
    
    NSMutableArray *models =[NSMutableArray array];
    NSString * url = @"http://192.168.0.31/XYGPKY_App/Sq/getEightSq.json";
    //GPLog(@"%@",url);
    [CZHttpTool GET:url parameters:nil success:^(id responseObject) { // HttpTool请求成功的回调
        // 请求成功代码先保存
        NSDictionary *carlsit= responseObject[@"object"];
        
        for(NSDictionary *list in carlsit){
            GPCommunityAllModel * model = [GPCommunityAllModel new];
            model.sqId = list[@"sqId"];
            model.sqName = list[@"sqName"];
            NSString * imageStr = list[@"sqPicurl"];
            NSString * str = [NSString stringWithFormat:@"%@/%@",@"http://192.168.0.14/XiYuanUpload/",imageStr];
            //从开头截取到指定位置,但是不包括该字符
            model.sqPicurl = [str substringToIndex:[str length]-1];
            
            [models addObject:model];
            
        }
        // GPLog(@"%@",models);
        success(models);
        
        
    } failure:^(NSError *error) {
        if (failure) {
            failure(error);
        }
    }];
}
@end

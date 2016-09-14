//
//  GPHomeProductShowList.m
//  公平矿业
//
//  Created by apple on 16/6/14.
//  Copyright © 2016年 xiaoAn. All rights reserved.
//

#import "GPHomeProductShowList.h"
#import "CZHttpTool.h"
#import "GPHomeProductShowModel.h"
@implementation GPHomeProductShowList
+(void)listToolSuccess:(modelListToolSuccessBlock)success failure:(modelListToolFailureBlock)failure{
    
    NSMutableArray *models =[NSMutableArray array];
    
    [CZHttpTool GET:productShowUrl parameters:nil success:^(id responseObject) { // HttpTool请求成功的回调
        // 请求成功代码先保存
         NSDictionary *carlsit= responseObject[@"object"];
        for(NSDictionary *list in carlsit){
            GPHomeProductShowModel * model = [GPHomeProductShowModel new];
            model.productId = list[@"productId"];
            model.productName = list[@"productName"];
            model.productJj = list[@"productJj"];
            NSString*picUrl = [NSString stringWithFormat:@"http://192.168.0.14/XiYuanUpload/%@",list[@"productPicurl"]];
            model.productPicurl=[picUrl substringToIndex:picUrl.length-1];
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

//
//  DNProductDetail.h
//  工平矿业
//
//  Created by apple on 16/7/8.
//  Copyright © 2016年 xiaoAn. All rights reserved.
//

#import "BaseModel.h"

@interface DNProductDetail : BaseModel
@property (nonatomic,copy)NSString * PRODUCT_ID;
@property (nonatomic,copy)NSString * PRODUCT_NAME;
@property (nonatomic,copy)NSString * PRODUCT_JJ;
@property (nonatomic,copy)NSString * PRODUCT_PICURL;
@property(nonatomic,copy)NSString*NUM;
@end

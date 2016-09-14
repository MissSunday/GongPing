//
//  GPCommunityModel.h
//  工平矿业
//
//  Created by apple on 16/6/11.
//  Copyright © 2016年 xiaoAn. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface GPCommunityModel : NSObject
/**
 *  头像
 */
@property (nonatomic,copy)NSString * originalIcon;

/**
 *  名字
 */
@property (nonatomic,copy)NSString * name;

/**
 *  创建时间
 */
@property (nonatomic, copy) NSString *created_at;

/**
 *  正文
 */
@property (nonatomic,copy)NSString * text;
@end

//
//  Member.h
//  517lng
//
//  Created by Ernie on 12-10-12.
//  Copyright (c) 2016年 517lng.com. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "TMBaseData.h"

@interface Member : TMBaseData{

}

@property (retain, nonatomic) NSString *password;
@property (retain, nonatomic) NSString *phoneNumber;
@property (retain, nonatomic) NSString *userId;
@property (retain, nonatomic) NSString *userNickname;
@property (retain, nonatomic) NSString *createTime;
@property (retain, nonatomic) NSString *sjyzm;

 /*
@property (retain, nonatomic) NSString *avatarlarge;
@property (retain, nonatomic) NSString *usergroup;
@property(retain,nonatomic) NSString* gender;
@property(nonatomic,retain) NSString * remainingaccount;
@property(retain,nonatomic)NSString* score;
@property(retain,nonatomic)NSString* sid;

@property(retain,nonatomic) NSString* stationid;
@property(retain,nonatomic) NSString* maxprice;
@property(retain,nonatomic) NSString* minprice;
*/

@end

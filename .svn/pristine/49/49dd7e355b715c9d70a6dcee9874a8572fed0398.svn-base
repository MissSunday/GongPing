//
//  GPCommunityAllCell.m
//  工平矿业
//
//  Created by apple on 16/6/6.
//  Copyright © 2016年 xiaoAn. All rights reserved.
//

#import "GPCommunityAllCell.h"

@interface GPCommunityAllCell ()

@end

@implementation GPCommunityAllCell

-(id)initWithFrame:(CGRect)frame
{
    
    self = [super initWithFrame:frame];
   
    if (self)
    {
        NSArray *arrCell = [[NSBundle mainBundle]loadNibNamed:@"GPCommunityAllCell" owner:self options:nil];
        if (arrCell.count<1)
        {
            return nil;
        }
        if (![[arrCell objectAtIndex:0]isKindOfClass:[UICollectionViewCell class]])
        {
            return nil;
        }
        self = [arrCell objectAtIndex:0];
    }
    
    return self;
}

@end

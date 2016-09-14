//
//  KFSearchHistoryCell.h
//  SearchHistory
//
//  Created by VS on 16/5/9.
//  Copyright © 2016年 VS. All rights reserved.
//

#import <UIKit/UIKit.h>

@class KFSearchHistoryCell;

@protocol KFSearchHistoryCellDeleagte <NSObject>

@optional
- (void)onDelSearchHistoryRecord:(KFSearchHistoryCell *)cell;
- (void)searchHistoryCellOnTap:(KFSearchHistoryCell *)cell;
@end

@interface KFSearchHistoryCell : UITableViewCell
@property (strong, nonatomic) NSString *text;
@property (copy, nonatomic) void(^operation)();
@property (strong, nonatomic, readonly) NSIndexPath *indexPath;
@property (weak, nonatomic) id<KFSearchHistoryCellDeleagte> delegate;

+ (instancetype)searchHistoryCellWithTableView:(UITableView *)tableView indexPath:(NSIndexPath *)indexPath;
@end

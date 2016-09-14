//
//  KFSearchHistoryCell.m
//  SearchHistory
//
//  Created by VS on 16/5/9.
//  Copyright © 2016年 VS. All rights reserved.
//

#import "KFSearchHistoryCell.h"

@interface KFSearchHistoryCell () {
    NSIndexPath * _indexPath;
}
@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
@end

@implementation KFSearchHistoryCell

- (void)awakeFromNib {
    [super awakeFromNib];
}

- (void)setIndexPath:(NSIndexPath *)indexPath {
   _indexPath = indexPath;
}

- (NSIndexPath *)indexPath {
    return _indexPath;
}

- (void)setText:(NSString *)text {
    _text = text;
    _titleLabel.text = text;
}



+ (instancetype)searchHistoryCellWithTableView:(UITableView *)tableView indexPath:(NSIndexPath *)indexPath{
    static NSString *CellID = @"SearchHistoryCell";
    KFSearchHistoryCell *cell = [tableView dequeueReusableCellWithIdentifier:CellID];
    if (!cell) {
        cell = [[[NSBundle mainBundle] loadNibNamed:@"KFSearchHistoryCell" owner:nil options:nil] lastObject];
    }
    [cell setIndexPath:indexPath];
    return cell;
}

- (IBAction)onDelBtnTap:(UIButton *)sender {
    if ([_delegate respondsToSelector:@selector(onDelSearchHistoryRecord:)]) {
        [_delegate onDelSearchHistoryRecord:self];
    }
}
- (IBAction)onCellTap:(UIButton *)sender {
    if ([_delegate respondsToSelector:@selector(searchHistoryCellOnTap:)]) {
        [_delegate searchHistoryCellOnTap:self];
    }
}

@end

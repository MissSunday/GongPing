//
//  KFSearchViewController.m
//  SearchHistory
//
//  Created by VS on 16/5/9.
//  Copyright © 2016年 VS. All rights reserved.
//

#define kSearchHistoryKey @"SearchHistoryKey"

#import "KFSearchViewController.h"
#import "KFSearchResultViewController.h"

#import "KFSearchHistoryCell.h"

@interface KFSearchViewController () <UITableViewDelegate, UITableViewDataSource, UISearchBarDelegate, KFSearchHistoryCellDeleagte>
@property (weak, nonatomic) IBOutlet UISearchBar *searchBar;
@property (weak, nonatomic) IBOutlet UITableView *tableView;

@property (assign, nonatomic) BOOL isHistory;
@property (strong, nonatomic) NSMutableArray *historyArray;

@end

@implementation KFSearchViewController
-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    self.navigationItem.titleView = _searchBar;
    //把_searchBar设置为第一响应者,进来之后弹出输入法
    [_searchBar becomeFirstResponder];

}


- (void)viewDidLoad {
    [super viewDidLoad];
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    NSArray *historyList = [defaults valueForKey:kSearchHistoryKey];
    if ((historyList.count != 0) && (![historyList isKindOfClass:[NSNull class]])) {
        self.historyArray = [historyList mutableCopy];
    }
    
    UITapGestureRecognizer *tapGestureRecognizer = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(keyboardHide:)];
    //设置成NO表示当前控件响应后会传播到其他控件上，默认为YES。
    tapGestureRecognizer.cancelsTouchesInView = NO;
    //将触摸事件添加到当前view
    [self.view addGestureRecognizer:tapGestureRecognizer];
}

-(void)keyboardHide:(UITapGestureRecognizer*)tap{
    [_searchBar resignFirstResponder];
    
    
}

- (NSMutableArray *)historyArray {
    if (!_historyArray) {
        _historyArray = [NSMutableArray array];
    }
    return _historyArray;
}

- (void)serachResultWithKeyWord:(NSString *)text {
    if ([text isEqualToString:@""]) {
        return;
    }
    [self.historyArray insertObject:text atIndex:0];
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    [defaults setObject:self.historyArray forKey:kSearchHistoryKey];
    [defaults synchronize];
    [_tableView reloadData];
    
    KFSearchResultViewController *vc = [[KFSearchResultViewController alloc] init];
    vc.keyword = text;
      [self.navigationController pushViewController:vc animated:YES];
}

#pragma mark - UITableViewdelegate
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    //return self.historyArray.count == 0 ? 1 : 2;
    if (self.historyArray.count == 0) {
        return 0;
    }
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    if (self.historyArray.count == 0) {
        return 1;
    } else {
        return self.historyArray.count;
        
    }
    //return 1;
    
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    if (self.historyArray.count == 0) {
        return nil;
    } else {
        
        KFSearchHistoryCell *cell = [KFSearchHistoryCell searchHistoryCellWithTableView:tableView indexPath:indexPath];
        if (self.historyArray.count != 0) {
            cell.text = self.historyArray[indexPath.row];
        }
        cell.delegate = self;
        return cell;
    }
    
    return [[UITableViewCell alloc] init];
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    if (self.historyArray.count == 0) {
        return 300;
    } else {
        
        return 45;
    }
}


#pragma mark - UISerachBarDelegate
- (void)searchBarSearchButtonClicked:(UISearchBar *)searchBar {
    [searchBar endEditing:YES];
    [self serachResultWithKeyWord:searchBar.text];
}

- (void)searchBar:(UISearchBar *)searchBar textDidChange:(NSString *)searchText {

    KFSearchResultViewController*rvc=[[KFSearchResultViewController alloc]init];
    rvc.keyword=searchText;
}

#pragma mark -  KFSearchHistoryCellDeleagte
- (void)onDelSearchHistoryRecord:(KFSearchHistoryCell *)cell {
    NSIndexPath *indexPath = cell.indexPath;
    [self.historyArray removeObjectAtIndex:indexPath.row];
    if (self.historyArray.count != 0) {
        [_tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationMiddle];
    }
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    [defaults setObject:self.historyArray forKey:kSearchHistoryKey];
    [defaults synchronize];
    [_tableView reloadData];
}

- (void)searchHistoryCellOnTap:(KFSearchHistoryCell *)cell {
    KFSearchResultViewController *vc = [[KFSearchResultViewController alloc] init];
    vc.keyword =  self.historyArray[cell.indexPath.row];
    [self.navigationController pushViewController:vc animated:YES];
}

- (UIView*)tableView:(UITableView*)tableView viewForFooterInSection:(NSInteger)section
{
    
    UIButton* clear = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, 44, 44)];
    
    [clear setTitle:@"清除搜索记录" forState:UIControlStateNormal];
    
    [clear setTitleColor:[UIColor lightGrayColor] forState:UIControlStateNormal];
    
    clear.backgroundColor = [UIColor whiteColor];
    
    clear.titleLabel.textAlignment = NSTextAlignmentCenter;
    
    clear.titleLabel.font = [UIFont systemFontOfSize:13.0];
    
    [clear addTarget:self action:@selector(clearClick:) forControlEvents:UIControlEventTouchUpInside];
    
    return clear;
}

- (void)clearClick:(UIButton*)btn
{
    
    [self.historyArray removeAllObjects];
    
    [self.tableView reloadData];
    
    //[self.tableView removeFromSuperview];
}

@end

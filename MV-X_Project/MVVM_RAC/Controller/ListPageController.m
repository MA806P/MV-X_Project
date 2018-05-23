//
//  ListPageController.m
//  MV-X_Project
//
//  Created by MA806P on 2018/5/22.
//  Copyright © 2018年 myz. All rights reserved.
//

#import "ListPageController.h"
#import "ListViewModel.h"
#import "ListViewCell.h"
#import "ListItem.h"
#import "ListDetailController.h"

static NSString * const kListCellId = @"ListCellId";

@interface ListPageController ()<UITableViewDelegate, UITableViewDataSource>

@property (nonatomic, strong) ListViewModel *viewModel;

@end

@implementation ListPageController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    
    UITableView *tableView = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStylePlain];
    tableView.allowsSelection = NO;
    tableView.delegate = self;
    tableView.dataSource = self;
    tableView.rowHeight = 60;
    [tableView registerNib:[UINib nibWithNibName:@"ListViewCell" bundle:nil] forCellReuseIdentifier:kListCellId];
    [self.view addSubview:tableView];
    
    self.viewModel = [[ListViewModel alloc] init];
    //[self.viewModel.loadCommand.executionSignals.switchToLatest subscribeNext:^(id  _Nullable x) {}];
    [[self.viewModel.loadCommand execute:nil] subscribeNext:^(id  _Nullable x) {
        [tableView reloadData];
    }];
    
    
    [self.viewModel.checkSignal subscribeNext:^(id  _Nullable x) {
        [tableView reloadData];
    }];
    
    [self.viewModel.jumpSignal subscribeNext:^(id  _Nullable x) {
        if (x) {
            ListItem *model = (ListItem *)x;
            ListDetailController *detailVC = [[ListDetailController alloc] init];
            detailVC.loadUrl = model.alt;
            [self.navigationController pushViewController:detailVC animated:YES];
        }
        
    }];
    
}

#pragma mark - UITableView delegate datasource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.viewModel.listModelArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    ListViewCell *cell = [tableView dequeueReusableCellWithIdentifier:kListCellId forIndexPath:indexPath];
    cell.viewModel = self.viewModel.listModelArray[indexPath.row];
    return cell;
}


@end

//
//  MVVMViewController.m
//  MV-X_Project
//
//  Created by MA806P on 2018/4/20.
//  Copyright © 2018年 myz. All rights reserved.
//

#import "MVVMViewController.h"
#import "MVVMViewModel.h"
#import "MVVMModel.h"
#import "MVVMView.h"


@interface MVVMViewController ()

@end

@implementation MVVMViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    
    MVVMModel *model = [[MVVMModel alloc] init];
    model.counter = 1;
    
    MVVMView *vmView = [[MVVMView alloc] initWithFrame:CGRectMake(0, 30, self.view.frame.size.width, 200)];
    vmView.backgroundColor = [UIColor lightGrayColor];
    [self.view addSubview:vmView];
    
    MVVMViewModel *viewModel = [[MVVMViewModel alloc] init];
    [vmView nonosetViewModel:viewModel];
    [viewModel hehesetModel:model];
    
    
}



@end

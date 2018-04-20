//
//  MVPViewController.m
//  MV-X_Project
//
//  Created by MA806P on 2018/4/20.
//  Copyright © 2018年 myz. All rights reserved.
//

#import "MVPViewController.h"
#import "MVPModel.h"
#import "MVPPresenter.h"
#import "MVPView.h"

@interface MVPViewController ()

@end

@implementation MVPViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    
    MVPModel *model = [[MVPModel alloc] init];
    model.counter = 1;
    
    MVPView *pview = [[MVPView alloc] initWithFrame:CGRectMake(0, 70, self.view.frame.size.width, 200)];
    pview.backgroundColor = [UIColor lightGrayColor];
    [self.view addSubview:pview];
    
    MVPPresenter *presenter = [[MVPPresenter alloc] initWithTestPView:pview model:model];
    pview.presenter = presenter;
    
}



@end

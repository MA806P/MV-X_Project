//
//  ViewController.m
//  MV-X_Project
//
//  Created by MA806P on 2018/4/19.
//  Copyright © 2018年 myz. All rights reserved.
//

#import "ViewController.h"
#import "MVPViewController.h"
#import "MVVMViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}


- (IBAction)goNextMVP:(id)sender {
    
    MVPViewController *vc = [[MVPViewController alloc] init];
    [self.navigationController pushViewController:vc animated:YES];
    
}


- (IBAction)goNextMVVM:(id)sender {
    
    MVVMViewController *vc = [[MVVMViewController alloc] init];
    [self.navigationController pushViewController:vc animated:YES];
}

- (IBAction)goRACPage:(id)sender {
}

@end

//
//  MVVMViewModel.m
//  MV-X_Project
//
//  Created by MA806P on 2018/4/20.
//  Copyright © 2018年 myz. All rights reserved.
//

#import "MVVMViewModel.h"
#import "MVVMModel.h"

@interface MVVMViewModel ()

@property (nonatomic, strong) MVVMModel *model;

@end

@implementation MVVMViewModel

- (void)hehesetModel:(MVVMModel *)model {
    self.model = model;
}

- (void)handleBtnClickAction {
    
    self.model.counter += 1;
    self.counterString = [NSString stringWithFormat:@"%ld", self.model.counter];
}

@end

//
//  MVVMViewModel.h
//  MV-X_Project
//
//  Created by MA806P on 2018/4/20.
//  Copyright © 2018年 myz. All rights reserved.
//

#import <Foundation/Foundation.h>

@class MVVMModel;

@interface MVVMViewModel : NSObject

@property (nonatomic, copy) NSString *counterString;

- (void)hehesetModel:(MVVMModel *)model;
- (void)handleBtnClickAction;

@end

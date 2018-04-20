//
//  MVPPresenter.h
//  MV-X_Project
//
//  Created by MA806P on 2018/4/20.
//  Copyright © 2018年 myz. All rights reserved.
//

#import <Foundation/Foundation.h>

@class MVPView, MVPModel;

@interface MVPPresenter : NSObject

- (instancetype)initWithTestPView:(MVPView *)view model:(MVPModel *)model;

- (void)handleEvntShowView;

@end

//
//  MVPView.h
//  MV-X_Project
//
//  Created by MA806P on 2018/4/20.
//  Copyright © 2018年 myz. All rights reserved.
//

#import <UIKit/UIKit.h>

@class MVPPresenter, MVPModel;

@interface MVPView : UIView

@property (nonatomic, strong) MVPPresenter *presenter;

- (void)refreshWithModel:(MVPModel *)model;

@end

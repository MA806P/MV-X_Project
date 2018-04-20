//
//  MVPPresenter.m
//  MV-X_Project
//
//  Created by MA806P on 2018/4/20.
//  Copyright © 2018年 myz. All rights reserved.
//

#import "MVPPresenter.h"
#import "MVPView.h"
#import "MVPModel.h"

@interface MVPPresenter ()

@property (nonatomic, strong) MVPView *view;
@property (nonatomic, strong) MVPModel *model;

@end

@implementation MVPPresenter

- (instancetype)initWithTestPView:(MVPView *)view model:(MVPModel *)model {
    if (self = [super init]) {
        _view = view;
        _model = model;
        
    }
    return self;
}

- (void)handleEvntShowView {
    _model.counter += 1;
    [_view refreshWithModel:_model];
}


@end

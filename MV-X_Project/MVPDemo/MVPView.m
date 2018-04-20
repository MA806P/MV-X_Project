//
//  MVPView.m
//  MV-X_Project
//
//  Created by MA806P on 2018/4/20.
//  Copyright © 2018年 myz. All rights reserved.
//

#import "MVPView.h"
#import "MVPPresenter.h"
#import "MVPModel.h"

@interface MVPView ()

@property (nonatomic, strong) UILabel *label;
@property (nonatomic, assign) NSInteger labelCount;

@end

@implementation MVPView

- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        
        UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(30, 40, 260, 30)];
        label.font = [UIFont systemFontOfSize:15];
        label.textColor = [UIColor whiteColor];
        label.text = @"0";
        [self addSubview:label];
        _label = label;
        
        
        UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
        btn.frame = CGRectMake(30, 80, 120, 30);
        [btn setTitle:@"点击改变" forState:UIControlStateNormal];
        [btn addTarget:self action:@selector(btnTouchAction) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:btn];
        
        
    }
    return self;
}




- (void)btnTouchAction {
    if ([self.presenter respondsToSelector:@selector(handleEvntShowView)]) {
        [self.presenter handleEvntShowView];
    }
}

- (void)refreshWithModel:(MVPModel *)model {
    self.label.text = [NSString stringWithFormat:@"count = %ld", model.counter];
}


@end

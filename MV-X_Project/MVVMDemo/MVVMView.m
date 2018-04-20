//
//  MVVMView.m
//  MV-X_Project
//
//  Created by MA806P on 2018/4/20.
//  Copyright © 2018年 myz. All rights reserved.
//

#import "MVVMView.h"
#import "MVVMViewModel.h"

@interface MVVMView ()

@property (nonatomic, strong) UILabel *label;
@property (nonatomic, assign) NSInteger labelCount;
@property (nonatomic, strong) MVVMViewModel *viewModel;

@end

@implementation MVVMView


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
    [self.viewModel handleBtnClickAction];
}


- (void)nonosetViewModel:(MVVMViewModel *)viewmodel {
    
    self.viewModel = viewmodel;
    [self.viewModel addObserver:self forKeyPath:@"counterString" options:NSKeyValueObservingOptionInitial | NSKeyValueObservingOptionNew context:nil];
}

- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary<NSKeyValueChangeKey,id> *)change context:(void *)context {
    
    if ([keyPath isEqualToString:@"counterString"] == NO) {
        [super observeValueForKeyPath:keyPath ofObject:object change:change context:context];
        return;
    }
    
    NSString *changeContentStr = [change objectForKey:NSKeyValueChangeNewKey];
    if (changeContentStr && [changeContentStr isKindOfClass:[NSNull class]] == NO) {
        self.label.text = changeContentStr;
    }
    
    
}

@end

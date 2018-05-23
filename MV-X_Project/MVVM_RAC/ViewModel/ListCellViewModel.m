//
//  ListCellViewModel.m
//  MV-X_Project
//
//  Created by MA806P on 2018/5/22.
//  Copyright © 2018年 myz. All rights reserved.
//

#import "ListCellViewModel.h"
#import "ListItem.h"

@implementation ListCellViewModel

- (instancetype)initWithModel:(ListItem *)item {
    if (self = [super init]) {
        _item = item;
        
        _checkCommand = [[RACCommand alloc] initWithSignalBlock:^RACSignal * _Nonnull(id  _Nullable input) {
            return [RACSignal createSignal:^RACDisposable * _Nullable(id<RACSubscriber>  _Nonnull subscriber) {
                [subscriber sendNext:self.item];
                [subscriber sendCompleted];
                return nil;
            }];
        }];
        
        
        _jumpCommand = [[RACCommand alloc] initWithSignalBlock:^RACSignal * _Nonnull(id  _Nullable input) {
            return [RACSignal createSignal:^RACDisposable * _Nullable(id<RACSubscriber>  _Nonnull subscriber) {
                [subscriber sendNext:self.item];
                [subscriber sendCompleted];
                return nil;
            }];
        }];
    }
    return self;
}

+ (instancetype)listCellViewModelWithModel:(ListItem *)item {
    return [[self alloc] initWithModel:item];
}



@end

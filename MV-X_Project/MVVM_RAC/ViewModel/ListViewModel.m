//
//  ListViewModel.m
//  MV-X_Project
//
//  Created by MA806P on 2018/5/22.
//  Copyright © 2018年 myz. All rights reserved.
//

#import "ListViewModel.h"
#import "ListItem.h"
#import "ListCellViewModel.h"
#import "AFNetworking.h"


@implementation ListViewModel

- (instancetype)init {
    if (self = [super init]) {
        
        _jumpSignal = [RACSubject subject];
        _checkSignal = [RACSubject subject];
        
        _loadCommand = [[RACCommand alloc] initWithSignalBlock:^RACSignal * _Nonnull(id  _Nullable input) {
            return [RACSignal createSignal:^RACDisposable * _Nullable(id<RACSubscriber>  _Nonnull subscriber) {
                
                AFHTTPSessionManager *m = [AFHTTPSessionManager manager];
                [m GET:@"https://api.douban.com/v2/movie/in_theaters" parameters:nil progress:^(NSProgress * _Nonnull downloadProgress) {
                } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
                    
                    NSArray *resultArray = responseObject[@"subjects"];
                    NSMutableArray *cellListArray = [NSMutableArray array];
                    for (NSDictionary *dic in resultArray) {
                        ListItem *item = [ListItem listItemWithDictionary:dic];
                        ListCellViewModel *cellViewModel = [ListCellViewModel listCellViewModelWithModel:item];
                        [[cellViewModel.checkCommand.executing skip:1] subscribeNext:^(NSNumber * _Nullable x) {
                            if (x.boolValue == NO) {
                                [self->_checkSignal sendNext:nil];
                            }
                        }];
                        
                        [cellViewModel.jumpCommand.executionSignals.switchToLatest subscribeNext:^(id  _Nullable x) {
                            [self->_jumpSignal sendNext:x];
                        }];
                        
                        
                        [cellListArray addObject:cellViewModel];
                    }
                    self.listModelArray = cellListArray;
                    
                    [subscriber sendNext:@1];
                    [subscriber sendCompleted];
                } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
                    [subscriber sendNext:@0];
                    [subscriber sendCompleted];
                }];
                
                return nil;
            }];
        }];
        
        
        
    }
    return self;
}


@end

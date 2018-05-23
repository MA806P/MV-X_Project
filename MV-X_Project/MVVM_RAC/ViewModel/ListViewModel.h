//
//  ListViewModel.h
//  MV-X_Project
//
//  Created by MA806P on 2018/5/22.
//  Copyright © 2018年 myz. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <ReactiveObjC.h>

@interface ListViewModel : NSObject

///列表数据数组
@property (nonatomic, copy) NSArray *listModelArray;

@property (nonatomic, strong) RACCommand *loadCommand;
@property (nonatomic, strong) RACSubject *checkSignal;
@property (nonatomic, strong) RACSubject *jumpSignal;

@end

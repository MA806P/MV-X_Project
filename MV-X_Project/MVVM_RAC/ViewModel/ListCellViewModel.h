//
//  ListCellViewModel.h
//  MV-X_Project
//
//  Created by MA806P on 2018/5/22.
//  Copyright © 2018年 myz. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <ReactiveObjC.h>

@class ListItem;

@interface ListCellViewModel : NSObject

@property (nonatomic, strong) ListItem *item;

@property (nonatomic, strong) RACCommand *checkCommand;
@property (nonatomic, strong) RACCommand *jumpCommand;

+ (instancetype)listCellViewModelWithModel:(ListItem *)item;

@end

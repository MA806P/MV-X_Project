//
//  ListItem.h
//  MV-X_Project
//
//  Created by MA806P on 2018/5/22.
//  Copyright © 2018年 myz. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ListItem : NSObject

@property (nonatomic, copy) NSString *title;
@property (nonatomic, copy) NSString *alt;
@property (nonatomic, copy) NSString *image;
@property (nonatomic, copy) NSString *large;
@property (nonatomic, copy) NSString *genres;

+ (instancetype)listItemWithDictionary:(NSDictionary *)dict;


@end

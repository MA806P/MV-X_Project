//
//  ListItem.m
//  MV-X_Project
//
//  Created by MA806P on 2018/5/22.
//  Copyright © 2018年 myz. All rights reserved.
//

#import "ListItem.h"

@implementation ListItem

- (instancetype)initWithDict:(NSDictionary *)dict {
    if (self = [super init]) {
        _title = dict[@"title"];
        _alt = dict[@"alt"];
        
        NSDictionary *images = dict[@"images"];
        if (images && [images isKindOfClass:[NSDictionary class]]) {
            _image = images[@"small"];
            _large = images[@"large"];
        } else {
            _image = @"";
            _large = @"";
        }
        
        NSMutableString *genresStr = [NSMutableString string];
        NSArray *genres = dict[@"genres"];
        for (NSString *str in genres) {
            [genresStr appendFormat:@"%@ ", str];
        }
        self.genres = genresStr;
    }
    return self;
}

+ (instancetype)listItemWithDictionary:(NSDictionary *)dict {
    return [[self alloc] initWithDict:dict];
}

@end

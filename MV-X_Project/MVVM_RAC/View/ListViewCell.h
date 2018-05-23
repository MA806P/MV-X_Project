//
//  ListViewCell.h
//  MV-X_Project
//
//  Created by MA806P on 2018/5/22.
//  Copyright © 2018年 myz. All rights reserved.
//

#import <UIKit/UIKit.h>

@class ListCellViewModel;

@interface ListViewCell : UITableViewCell

@property (nonatomic, strong) ListCellViewModel *viewModel;

@end

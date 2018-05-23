//
//  ListViewCell.m
//  MV-X_Project
//
//  Created by MA806P on 2018/5/22.
//  Copyright © 2018年 myz. All rights reserved.
//

#import "ListViewCell.h"
#import "ListCellViewModel.h"
#import "UIImageView+AFNetworking.h"
#import "ListItem.h"

@interface ListViewCell ()<UIGestureRecognizerDelegate>

@property (weak, nonatomic) IBOutlet UIImageView *imgView;
@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
@property (weak, nonatomic) IBOutlet UILabel *subTitleLabel;

@property (nonatomic, weak) UIView *imgContentView;
@property (nonatomic, weak) UIImageView *detailImgView;
@property (nonatomic, assign) CGRect detailImgFrame;
@property (nonatomic, assign) CGRect imgConvertFrame;
@end

@implementation ListViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    
    UITapGestureRecognizer *jumpTap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(cellJumpNextTapAction)];
    [self.contentView addGestureRecognizer:jumpTap];
    
    UITapGestureRecognizer *imgTap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(cellImageTapAction)];
    [self.imgView addGestureRecognizer:imgTap];
    
}

- (void)setViewModel:(ListCellViewModel *)viewModel {
    _viewModel = viewModel;
    
    ListItem *item = viewModel.item;
    [self.imgView setImageWithURL:[NSURL URLWithString:item.image]];
    self.titleLabel.text = item.title;
    self.subTitleLabel.text = item.genres;
    
}


- (void)cellJumpNextTapAction {
    [self.viewModel.jumpCommand execute:nil];
}

- (void)cellImageTapAction {
    
    UIWindow *window = [UIApplication sharedApplication].keyWindow;
    UIView *imgContentView = [[UIView alloc] initWithFrame:window.bounds];
    imgContentView.backgroundColor = [UIColor blackColor];
    imgContentView.alpha = 0.0;
    [window addSubview:imgContentView];
    self.imgContentView = imgContentView;
    
    UITapGestureRecognizer *closeTap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(closeDetailImageViewAction)];
    [self.imgContentView addGestureRecognizer:closeTap];
    
    
    UIImage *image = self.imgView.image;
    CGFloat imgW = imgContentView.frame.size.width;
    CGFloat imgH = imgW * (image.size.height/image.size.width);
    CGFloat imgY = (imgContentView.frame.size.height - imgH) * 0.5;
    self.detailImgFrame = CGRectMake(0, imgY, imgW, imgH);
    CGRect imgConvertFrame = [self.contentView convertRect:self.imageView.frame toView:window];
    imgConvertFrame.size.width = self.imgView.frame.size.width;
    imgConvertFrame.size.height = self.imgView.frame.size.height;
    self.imgConvertFrame = imgConvertFrame;
    
    UIImageView *detailImgView = [[UIImageView alloc] initWithFrame:imgConvertFrame];
    detailImgView.contentMode = UIViewContentModeScaleAspectFill;
    detailImgView.userInteractionEnabled = YES;
    detailImgView.image = self.imgView.image;
    [detailImgView setImageWithURL:[NSURL URLWithString:self.viewModel.item.large]];
    [window addSubview:detailImgView];
    self.detailImgView = detailImgView;
    
    UIPanGestureRecognizer *pan = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(panMoveImageVieAction:)];
    pan.delegate = self;
    [detailImgView addGestureRecognizer:pan];
    
    
    [UIView animateWithDuration:0.3 animations:^{
        detailImgView.frame = self.detailImgFrame;
        imgContentView.alpha = 1.0;
    }];
    
    [UIView animateWithDuration:0.3 delay:0 options:UIViewAnimationOptionCurveEaseInOut animations:^{
        detailImgView.frame = self.detailImgFrame;
        imgContentView.alpha = 1.0;
    } completion:nil];
    
}

- (void)closeDetailImageViewAction {
    [UIView animateWithDuration:0.1 delay:0 options:UIViewAnimationOptionCurveEaseIn animations:^{
        self.detailImgView.frame = self.imgConvertFrame;
        self.imgContentView.alpha = 0;
    } completion:^(BOOL finished) {
        [self.imgContentView removeFromSuperview];
        [self.detailImgView removeFromSuperview];
    }];
    
}


- (void)panMoveImageVieAction:(UIPanGestureRecognizer *)pan {
    
    CGPoint movePoint = [pan translationInView:self.imgContentView];
    CGFloat moveDistance = sqrt(movePoint.x * movePoint.x + movePoint.y * movePoint.y);
    CGFloat bounceD = 1 - moveDistance / self.imgContentView.frame.size.height;
    
    CGRect moveRect = self.detailImgFrame;
    moveRect.origin.x += movePoint.x;
    moveRect.origin.y += movePoint.y;
    moveRect.size.width *= bounceD;
    moveRect.size.height *= bounceD;
    self.detailImgView.frame = moveRect;
    self.imgContentView.alpha = bounceD;
    
    if (pan.state == UIGestureRecognizerStateEnded) {
        self.imgContentView.alpha = 1.0;
        self.detailImgView.frame = self.detailImgFrame;
        
        if (moveDistance > 160) {
            [self closeDetailImageViewAction];
        }
    }
}



@end

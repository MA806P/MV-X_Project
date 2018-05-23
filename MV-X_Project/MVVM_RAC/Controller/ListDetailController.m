//
//  ListDetailController.m
//  MV-X_Project
//
//  Created by MA806P on 2018/5/23.
//  Copyright © 2018年 myz. All rights reserved.
//

#import "ListDetailController.h"
#import <WebKit/WebKit.h>

@interface ListDetailController ()<WKUIDelegate>

@end

@implementation ListDetailController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    
    WKWebViewConfiguration *configuration = [[WKWebViewConfiguration alloc] init];
    WKWebView *webView = [[WKWebView alloc] initWithFrame:self.view.bounds configuration:configuration];
    [self.view addSubview:webView];
    
    webView.UIDelegate = self;
    [webView loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:self.loadUrl]]];
    
    
}





@end

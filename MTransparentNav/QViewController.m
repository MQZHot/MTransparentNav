//
//  QViewController.m
//  MTransparentNav
//
//  Created by mengqingzheng on 2017/8/8.
//  Copyright © 2017年 mengqingzheng. All rights reserved.
//

#import "QViewController.h"

@interface QViewController ()

@end

@implementation QViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor grayColor];
    self.title = @"下一页";
    self.navAlpha = 0;
//    [self.navigationController.navigationBar setShadowImage:nil];
    [self.navigationController.navigationBar setBackgroundImage:[UIImage new] forBarMetrics:UIBarMetricsCompact];
}
@end

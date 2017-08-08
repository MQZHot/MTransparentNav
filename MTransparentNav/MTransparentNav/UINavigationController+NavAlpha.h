//
//  UINavigationController+NavAlpha.h
//  MTransparentNav
//
//  Created by mengqingzheng on 2017/4/20.
//  Copyright © 2017年 mengqingzheng. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UINavigationController (NavAlpha)<UINavigationBarDelegate>


@end

// ============================================================
@interface UIViewController (NavAlpha)

/// 导航栏透明度
@property (nonatomic, assign) CGFloat navAlpha;

/// 导航栏背景颜色
@property (null_resettable, nonatomic, strong) UIColor *navBarTintColor;

/// 导航栏字体颜色
@property (null_resettable, nonatomic, strong) UIColor *navTintColor;

@end

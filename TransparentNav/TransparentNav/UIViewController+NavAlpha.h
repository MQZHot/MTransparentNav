//
//  UIViewController+NavAlpha.h
//  MTransparentNav
//
//  Created by mengqingzheng on 2017/5/11.
//  Copyright © 2017年 mengqingzheng. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIViewController (NavAlpha)

/// navAlpha
@property (nonatomic, assign) CGFloat navAlpha;

/// navbackgroundColor
@property (null_resettable, nonatomic, strong) UIColor *navBarTintColor;

/// tintColor
@property (null_resettable, nonatomic, strong) UIColor *navTintColor;

@end

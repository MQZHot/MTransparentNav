//
//  UINavigationController+NavAlpha.m
//  MTransparentNav
//
//  Created by mengqingzheng on 2017/4/20.
//  Copyright © 2017年 mengqingzheng. All rights reserved.
//

#import "UINavigationController+NavAlpha.h"
#import <objc/runtime.h>
#define IOS10 [[[UIDevice currentDevice]systemVersion] floatValue] >= 10.0

@implementation UINavigationController (NavAlpha)

-(void)navigationBar:(UINavigationBar *)navigationBar didPopItem:(UINavigationItem *)item {
    navigationBar.titleTextAttributes = @{NSForegroundColorAttributeName: self.topViewController.navTitleColor};
    navigationBar.tintColor = self.topViewController.navTintColor;
    navigationBar.barTintColor = self.topViewController.navBackgroundColor;
    [self setNavigationBackgroundAlpha:self.topViewController.navAlpha];
}

- (BOOL)navigationBar:(UINavigationBar *)navigationBar shouldPushItem:(UINavigationItem *)item {
    navigationBar.titleTextAttributes = @{NSForegroundColorAttributeName: self.topViewController.navTitleColor};
    navigationBar.tintColor = self.topViewController.navTintColor;
    navigationBar.barTintColor = self.topViewController.navBackgroundColor;
    [self setNavigationBackgroundAlpha:self.topViewController.navAlpha];
    return YES;
}

- (void)setNavigationBackgroundAlpha:(CGFloat)navAlpha {
    CGFloat alpha = MAX(MIN(navAlpha, 1), 0);
    UIView *barBackground = self.navigationBar.subviews[0];
    UIView *colorView = [self getColorViewOnView:barBackground];
    colorView.alpha = alpha;
    if ([barBackground valueForKey:@"_shadowView"]) {
        UIView *shadowView = [barBackground valueForKey:@"_shadowView"];
        shadowView.alpha = alpha;
        shadowView.hidden = alpha == 0 ? YES : NO;
    }
}

-(UIView *)getColorViewOnView:(UIView *)barBackground {
    if (self.navigationBar.translucent == NO || [self.navigationBar backgroundImageForBarMetrics:UIBarMetricsDefault] != nil) {
        return barBackground;
    } else {
        return IOS10 ? barBackground.subviews.lastObject : barBackground;
    }
}

@end

#pragma mark - UIViewController + NavAlpha
static char *vcAlphaKey = "vcAlphaKey";
static char *vcBgColorKey = "vcBgColorKey";
static char *vcNavTintColorKey = "vcNavTintColorKey";
static char *vcTitleColorKey = "vcTitleColorKey";
static char *vcNavOffsetYKey = "vcNavOffsetYKey";
@implementation UIViewController (NavAlpha)
/// 透明度
- (CGFloat)navOffsetY {
    if (objc_getAssociatedObject(self, vcNavOffsetYKey) == nil) { return 0; }
    return [objc_getAssociatedObject(self, vcNavOffsetYKey) floatValue];
}

- (void)setNavOffsetY:(CGFloat)navOffsetY {
    if (navOffsetY <= 0) navOffsetY = 0;
    if (navOffsetY >= [self getNavgationBarHeight]) navOffsetY = [self getNavgationBarHeight];
    self.navigationController.navigationBar.transform = CGAffineTransformMakeTranslation(0, -navOffsetY);
    objc_setAssociatedObject(self, &vcNavOffsetYKey, @(navOffsetY), OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

/** 获取当前导航栏高度*/
- (CGFloat)getNavgationBarHeight {
    return CGRectGetHeight(self.navigationController.navigationBar.bounds);
}

/// 透明度
- (CGFloat)navAlpha {
    if (objc_getAssociatedObject(self, vcAlphaKey) == nil) { return 1; }
    return [objc_getAssociatedObject(self, vcAlphaKey) floatValue];
}

- (void)setNavAlpha:(CGFloat)navAlpha {
    CGFloat alpha = MAX(MIN(navAlpha, 1), 0);// 0~1
    [self.navigationController setNavigationBackgroundAlpha:alpha];
    objc_setAssociatedObject(self, vcAlphaKey, @(alpha), OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

/// 背景颜色
-(UIColor *)navBackgroundColor {
    UIColor *color = objc_getAssociatedObject(self, vcBgColorKey);
    if (color == nil) { color = [UINavigationBar appearance].barTintColor; }
    return color;
}

- (void)setNavBackgroundColor:(UIColor *)navBackgroundColor {
    self.navigationController.navigationBar.barTintColor = navBackgroundColor;
    objc_setAssociatedObject(self, vcBgColorKey, navBackgroundColor, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

/// item字体颜色
- (UIColor *)navTintColor {
    UIColor *color = objc_getAssociatedObject(self, vcNavTintColorKey);
    if (color == nil) { color = [UINavigationBar appearance].tintColor; }
    return color;
}

- (void)setNavTintColor:(UIColor *)tintColor {
    self.navigationController.navigationBar.tintColor = tintColor;
    objc_setAssociatedObject(self, vcNavTintColorKey, tintColor, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

/// title颜色
- (UIColor *)navTitleColor {
    UIColor *color = objc_getAssociatedObject(self, vcTitleColorKey);
    if (color == nil) {
        color = [UINavigationBar appearance].titleTextAttributes[NSForegroundColorAttributeName];
        if (color == nil) { color = [UIColor blackColor]; }
    }
    return color;
}

- (void)setNavTitleColor:(UIColor *)navTitleColor {
    [self.navigationController.navigationBar setTitleTextAttributes:@{NSForegroundColorAttributeName: navTitleColor}];
    objc_setAssociatedObject(self, vcTitleColorKey, navTitleColor, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

@end

# MTransparentNav

Change NavigationBar's color and transparency at push pop scroll 

导航栏滑动渐变 

[![Language](https://img.shields.io/badge/language-ObjectiveC-brightgreen.svg)](https://github.com/MQZHot/MTransparentNav.git)
[![Support](https://img.shields.io/badge/support-iOS%208%2B-brightgreen.svg)](https://github.com/MQZHot/MTransparentNav.git)

![image](https://github.com/MQZHot/MTransparentNav/raw/master/gif/111.gif) 
![image](https://github.com/MQZHot/MTransparentNav/raw/master/gif/222.gif)

# TransparentNav

Package [RTRootNavigationController](https://github.com/rickytan/RTRootNavigationController) & Category of UINavigationBar & UIViewController's category

The Usage of `RTRootNavigationController`
[https://github.com/rickytan/RTRootNavigationController]

![image](https://github.com/MQZHot/MTransparentNav/raw/master/gif/333.gif)

Usage
==============

In the need to change the color of the controller

```
self.navTintColor = [UIColor redColor];
self.navBarTintColor = [UIColor greenColor];
self.navAlpha = 0;

```

You can change nav tintColor and barTintColor in UIScrollViewDelegate

```
-(void)scrollViewDidScroll:(UIScrollView *)scrollView{
    CGFloat y = scrollView.contentOffset.y;
    self.navAlpha = y / 80;
    if (y > 80) {
        self.navTintColor = [UIColor blueColor];
    } else {
        self.navTintColor = y < 0 ? [UIColor clearColor] : [UIColor redColor];
    }
}

```

Install
==============
pod 'TransparentNav'

#import "TransparentNav.h"

Related articles

[iOS导航栏滑动渐变](http://www.jianshu.com/p/1a52bb764c7e)



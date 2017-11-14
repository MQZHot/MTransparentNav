
<p align="center">
## MTransparentNav

Change NavigationBar's color and transparency

导航栏滑动渐变
</p>

<p align="center">
<img src="https://img.shields.io/badge/platform-iOS-yellow.svg">
<img src="https://img.shields.io/cocoapods/v/TransparentNav.svg?style=flat">
</p>

<p align="center">
<img src="https://github.com/MQZHot/MTransparentNav/raw/master/Picture/pic0.gif">
</p>


## Usage

In the need to change the color of the controller

```objc
self.navAlpha = 0;
self.navTintColor = [UIColor whiteColor];
self.navTitleColor = [UIColor whiteColor];
self.navBackgroundColor = [UIColor greenColor];

```

You can change nav tintColor and barTintColor in UIScrollViewDelegate

```swift
-(void)scrollViewDidScroll:(UIScrollView *)scrollView{
    CGFloat y = scrollView.contentOffset.y;
    self.navAlpha = y / 80;
    if (y > 80) {
        self.navTitleColor = self.navTintColor = [UIColor redColor];
    } else {
        self.navTitleColor = y < 0 ? [UIColor clearColor] : [UIColor whiteColor];
        self.navTintColor = y < 0 ? [UIColor clearColor] : [UIColor whiteColor];
    }
}
```

## Install

* pod 'TransparentNav'

* #import "TransparentNav.h"

## Related articles

[iOS导航栏滑动渐变](http://www.jianshu.com/p/1a52bb764c7e)

## Author

* Email: mqz1228@163.com
* 简 书 : http://www.jianshu.com/u/9e39ec4000e9

## LICENSE

MTransparentNav is released under the MIT license. See [LICENSE](https://github.com/MQZHot/MTransparentNav/blob/master/LICENSE) for details.



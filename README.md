

## MTransparentNav

Change NavigationBar's color and transparency at push pop scroll

导航栏滑动渐变

## 不足之处，欢迎纠正，欢迎star✨✨✨✨✨✨✨✨✨✨✨✨✨✨✨✨


![image](https://github.com/MQZHot/MTransparentNav/raw/master/Picture/pic1.gif) ![image](https://github.com/MQZHot/MTransparentNav/raw/master/Picture/pic2.gif)

## Usage

In the need to change the color of the controller

```
self.navTintColor = [UIColor redColor];
self.navBarTintColor = [UIColor greenColor];
self.navAlpha = 0;

```

You can change nav tintColor and barTintColor in UIScrollViewDelegate

```swift
-(void)scrollViewDidScroll:(UIScrollView *)scrollView{
    CGFloat y = scrollView.contentOffset.y;
    self.navAlpha = y / 80;
   if (y > 80) {
      self.navTintColor = [UIColor blueColor];
   } else {
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



import 'dart:ui';

class SizeFit {
  static double physicalWidth;
  static double physicalHeight;
  static double dpr;
  static double screenWidth;
  static double screenHeight;
  static double statusHeight;

  static double rpx;
  static double px;

  static void initialize({double standarSize = 750}) {
    // 1.获取屏幕分辨率
    physicalWidth = window.physicalSize.width;
    physicalHeight = window.physicalSize.height;

    // 2.获取dpr
    dpr = window.devicePixelRatio;

    // 3.屏幕宽度和高度
    screenWidth = physicalWidth / dpr;
    screenHeight = physicalHeight / dpr;

    // 4.状态栏高度
    statusHeight = window.padding.top / dpr;

    // 5.计算rpx的大小
    // rpx原理，不管什么手机什么屏幕 屏幕多大，都把屏幕分成750份。然后当前屏幕尺寸/750就能得到一份的宽度
    // 小程序例子：iphone6 375.  375/750 = 0.5  20rpx = 10px像素
    rpx = screenWidth / standarSize;

    px = screenWidth / standarSize * 2;
  }

  static double setRpx(double size) {
    return rpx * size;
  }

  static double setPx(double size) {
    return px * size;
  }
}

// 对int进行扩展
extension IntFit on int {
  double get rpx {
    return SizeFit.setRpx(this.toDouble());
  }

  double get px {
    return SizeFit.setPx(this.toDouble());
  }
}

// 对double进行扩展
extension DoubleFit on double {
  // 内置的一个方法get 访问的时候 直接通过对象.属性调用 也内置了set方法
  double get rpx {
    return SizeFit.setRpx(this);
  }

  double get px {
    return SizeFit.setPx(this);
  }
}

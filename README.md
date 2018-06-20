# ArcProgressUI

[![CI Status](https://img.shields.io/travis/huo3203@hotmail.com/ArcProgressUI.svg?style=flat)](https://travis-ci.org/huo3203@hotmail.com/ArcProgressUI)
[![Version](https://img.shields.io/cocoapods/v/ArcProgressUI.svg?style=flat)](https://cocoapods.org/pods/ArcProgressUI)
[![License](https://img.shields.io/cocoapods/l/ArcProgressUI.svg?style=flat)](https://cocoapods.org/pods/ArcProgressUI)
[![Platform](https://img.shields.io/cocoapods/p/ArcProgressUI.svg?style=flat)](https://cocoapods.org/pods/ArcProgressUI)

## Example

To run the example project, clone the repo, and run `pod install` from the Example directory first.

## Requirements

## Installation

ArcProgressUI is available through [CocoaPods](https://cocoapods.org). To install
it, simply add the following line to your Podfile:

```ruby
pod 'ArcProgressUI'
```

## 使用
```objc
#import "ArcProgressView.h"
NSArray *viewArr = [[NSBundle mainBundle] loadNibNamed:@"ArcProgressView" owner:nil options:nil];
UIView *arcView = viewArr.lastObject;
arcView.backgroundColor = [UIColor redColor];
[self.view addSubview:arcView];
```



## Author

huo3203@hotmail.com, 724987481

## License

ArcProgressUI is available under the MIT license. See the LICENSE file for more info.

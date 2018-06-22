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

## 使用说明
```objc
#import "ArcProgressView.h"
NSArray *viewArr = [[NSBundle mainBundle] loadNibNamed:@"ArcProgressView" owner:nil options:nil];
UIView *arcView = viewArr.lastObject;
arcView.backgroundColor = [UIColor redColor];
[self.view addSubview:arcView];
```

静态库开发：
设想：想通过cocoapod管理静态库的依赖关系。在项目调用静态库

1. 主工程：prj
2. 一级静态库: first.a ：组件
3. 二级静态库：组件依赖的静态库

        sec.a    : 二级静态库.a
        pod.a  ：包含二级静态库的集合

其他经验：通过pod来开发一级静态库即组件。会生成组件的工作空间：workspace 将prj主工程拖入工作空间，来协作开发。
> 坑：当再次切换主工程时，libJHPatrol.a的other linker tag 路径一定要更新。

结果：
1. 手动配置一级静态库组件，依赖的二级静态库可用
资源bundle文件直接添加到主工程资源拷贝列表中，在代码中会正常映射出IBoutlet相应的UI实例。参见 上述使用说明
2. ` -ObjC`设置
在主工程build setting 配置的`Other linker` ：` -ObjC`：表示尽可能的加载所有依赖静态库中的objc源码资源。
解决的问题：可以解决通过资源（xib/storyboard）初始化实例式
```
this class is not key value coding-compliant for the key ibReviewLabel
```
解决在storyboard中使用源码自定义UI控件时，无效果的问题。

3. 在封装静态库中，storyboard/xib中的控件不要设置model属性。

3. 使用pod来一级静态库组件，管理依赖的二级静态库libpod.a无效

## Author

huo3203@hotmail.com, 724987481

## License

ArcProgressUI is available under the MIT license. See the LICENSE file for more info.

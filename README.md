# SwpShareView



[![Version](https://img.shields.io/cocoapods/v/SwpShareView.svg?style=flat)](http://cocoapods.org/pods/SwpShareView) &nbsp; [![License](https://img.shields.io/cocoapods/l/SwpShareView.svg?style=flat)](http://cocoapods.org/pods/SwpShareView) &nbsp; [![Platform](https://img.shields.io/cocoapods/p/SwpShareView.svg?style=flat)](http://cocoapods.org/pods/SwpShareView)

-------


### SwpShareView


> * 分享弹出视图的简单封装，使用了 pop 库。
> * 之前一直在用三方的分享 UI，项目需要自定义组件，封装了一个简单的分享样式 ( 🙄🙄🙄🙄🙄 )。

-------

### 效果:
![(图片轮播效果)](https://raw.githubusercontent.com/swp-song/SwpShareView/master/Screenshot/SwpShareView.gif)
---

### 导入:

> * 手动导入：
> 
>> * **SwpShareView** 文件夹导入项目中。
>> * **`#import "SwpShareViewHeader.h"`**
>> * 依赖库 **pop** , 需要手动导入。
>> **[pop](https://github.com/facebook/pop)**

> -------

> * CocoaPods 导入:
> 
>> * **pod search SwpShareView**
>> * **pod 'SwpShareView'**
>> * **`#import <SwpShareView/SwpShareViewHeader.h>`**
>> * **pod** 导入会自动添加依赖库, 无需手动导入


-------


### 代码示例:

```Objective-C

SwpShareModel *teype = [SwpShareModel swpShareWithShareKey:@"custom" setSwpShareTitle:@"自定义" setSwpShareImageName:@"share_custom" setSwpTripartiteFrameworkShareType:@200];

NSArray *datas =  @[SwpShareToQQ, SwpShareToQzone, SwpShareToTencent, SwpShareToWechatSession, SwpShareToWechatTimeline, SwpShareToSina, SwpShareToCopyURL];

SwpShareView.swpShareViewShowInitWithDelegate(datas, self)
// 追加自定义 item
.swpShareViewCustomItems(@[teype])
// 未安装软件处理
.swpShareItemType(SwpShareItemTypeEnabled)
// Title 字体大小
.swpShareTitleSize(15)
// 文字
.swpShareTitle(@"分享")
// item 点击回调
.swpShareListViewDidSelectIndexBlockChain(^(SwpShareView *swpShareView, NSInteger didSelectIndex, SwpShareModel *swpShare){
        NSLog(@"%@", swpShare.swpShareKey);
})
// 页面关闭回调
.swpShareViewCloseBlockChain(^(SwpShareView *swpShareView, SwpShareModel *swpShare){
        NSLog(@"Block 页面关闭了");
        NSLog(@"%@", swpShare.swpShareKey);
});
....更多查看源码....

```
-------

### 注意
> * PS: 需要检索是否安装应用请在 **Info.plist**，加入 白名单，详见 Demo

-------

### 版本记录

-------

> * 版本版本：2.0.4
> * 更新时间：2018-01-23 16:39:34
> * 更新内容：
> 
> > * 更新版本号

-------

> * 版本版本：2.0.1
> * 更新时间：2017-10-26 15:57:32
> * 更新内容：
> 
> > * 更新UI样式，新增链式回调方法

-------


### 备注

> * 持续更新, 如果喜欢, 欢迎 Star

-------

### 声明

 > * **著作权归 ©swp_song，如需转载请标明出处**

-------


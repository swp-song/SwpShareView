# SwpShareView

---
##### 简单 封装 分享 View
```
UM 6.0 以后 分享的 view 难看的要死 ( 如果用了, 不保证 不被客户打死 😁😁😁😁😁😁😁😁😁 )
简单 封装 分享 view < 使用 独立 window 遮盖 >

```
---

##### 效果:
![(图片轮播效果)](https://raw.githubusercontent.com/swp-song/SwpShareView/master/Screenshot/SwpShareView.gif)
---

##### 导入:

```ruby

CocoaPods 导入:

使用  CocoaPods 会自动 pod POP

pod search SwpShareView

pod 'SwpShareView'

#import <SwpShareView/SwpShareHeader.h>

```
---

##### 代码示例:

```Objective-C

// 创建
SwpShareView *swpShareView = [SwpShareView swpShareViewShowWithData:@[SwpShareToQQ, SwpShareToQzone, SwpShareToTencent, SwpShareToWechatSession, SwpShareToWechatTimeline, SwpShareToSina, SwpShareToCopyURL]];

// 点击分享 图标 Block 回调
[swpShareView swpShareListViewDidSelectIndexBlock:^(SwpShareView * _Nonnull swpShareView, NSInteger didSelectIndex, SwpShareModel * _Nonnull swpShare) {
    NSLog(@"%@", swpShare.swpShareKey);
}];

swpShareView.delegate = self;

// 代理 回调
- (void)swpShareView:(SwpShareView *)swpShareView didSelectIndex:(NSInteger)index swpShare:(SwpShareModel *)swpShare {
    NSLog(@"%@", swpShare.swpShareKey);
}

....更多查看源码....

```

---

##### 1.1.3 更新:
```
1. 2016-11-03
2. 更新版本
```
---

##### 1.1.2 更新:
```
1. 2016-11-03
2. 新增 验证 App 是否 安装, 未安装 隐藏 或者 禁止点击
3. swpShareItemType
```
---


##### 1.1.1 更新:
```
1. 2016-10-20
2. 新增 自定义 items  
3. 方法 swpShareViewCustomItems
```
---


##### 1.1.0 更新:
```
1. 2016-10-10
2. 修改 页面 关闭之后 Block 和 代理方法
```
---

##### 1.0.9 更新:
```
1. 2016-10-10
2. 新增 隐藏 view 方法
3. 新增 点击分享 item 是否关闭页面 Block 和 Delegate
```
---
##### 1.0.8 更新:
```
1. 2016-10-09
2. 添加 Demo logo
3. 优化 分享 view 高度
4. 新增 swpShareSetTripartiteFrameworkShareTypes 方法 设置 三方框架分享 Type

```
---
##### 1.0.7 更新:
```
1. 2016-10-08
2. 新增 swpShareViewCloseBlock: 回调方法
3. 新增 swpShareViewSetTripartiteFrameworkShareType: 代理方法
4. 取消初始化 设置 三方分享 type 方法

```
---
##### 1.0.6 更新:
```
1. 2016-10-04
2. 新增, 代理方法 ---> 分享页面关闭时调用
3. 新增 初始化方法

```
---
##### 1.0.4 更新:
```
新增修改分享 title, 字体大小, 字体颜色, 文字, 字体

```
---

##### 1.0.3 更新:
```
整合代码 | 文件树，完善事件处理, 完善代码备注，
```
---
##### 1.0.2 更新:
```
解决 显示 崩溃
```
---

##### 1.0.1 更新:
```
新增 复制 URL
```
---

##### 1.0.0 更新 :
```
版本 上传 测试, 只显示 view
```
---

##### PS:
```
持续更新...
```
---

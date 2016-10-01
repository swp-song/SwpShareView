# SwpShareView

---
##### 简单 封装 分享 View
```
UM 6.0 以后 分享的 view 难看的要死 ( 如果用了, 不保证 不被客户打死 )
简单 封装 分享 view
```
---

##### 效果:
![(图片轮播效果)](https://raw.githubusercontent.com/swp-song/SwpShareView/master/Screenshot/SwpShareView.gif)
---

##### 导入:

```ruby
手动导入：

SwpShareView 文件夹 导入 项目 中, 依赖 POP

#import "SwpShareHeader.h"

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

// block 回调
[swpShareView swpShareListViewDidSelectIndex:^(SwpShareView * _Nonnull swpShareView, NSInteger didSelectIndex, NSString * _Nonnull swpShareKey) {
 	NSLog(@"%@", swpShareKey);
}];

swpShareView.delegate = self;

// 代理 回调
- (void)swpShareView:(SwpShareView *)swpShareView didSelectIndex:(NSInteger)index swpShareKey:(NSString *)swpShareKey {
    NSLog(@"%@", swpShareKey);
}

....更多查看源码....

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

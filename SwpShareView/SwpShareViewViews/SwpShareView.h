//
//  SwpShareView.h
//  PalmHeCheng
//
//  Created by swp_song on 2016/9/28.
//  Copyright © 2016年 songweipng. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "SwpShareViewDelegate.h"

NS_ASSUME_NONNULL_BEGIN

@interface SwpShareView : UIView

/*! 代理 属性 !*/
@property (nullable, nonatomic, weak) id<SwpShareViewDelegate>delegate;

/**!
 *  @ author swp_song
 *
 *  @ brief  swpShareViewShowWithData: ( 显示 控件 )
 *
 *  @ param  shareData
 *
 *  @ return SwpShareView
 */
+ (instancetype)swpShareViewShowWithData:(NSArray<NSString *> *)shareData;
/**!
 *  @ author swp_song
 *
 *  @ brief  swpShareListViewDidSelectIndex: ( 点击 每个 分下 回调 )
 *
 *  @ param  swpShareListViewDidSelectIndex
 */
- (void)swpShareListViewDidSelectIndex:(void (^)(SwpShareView *swpShareView, NSInteger didSelectIndex, NSString *swpShareKey))swpShareListViewDidSelectIndex;

@end


NS_ASSUME_NONNULL_END

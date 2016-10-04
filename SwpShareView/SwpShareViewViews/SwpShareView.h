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
 *  @ brief  swpShareViewShowWithData: ( 显示 控件 )
 *
 *  @ param  shareData
 *
 *  @ param  delegate
 *
 *  @ return SwpShareView
 */
+ (instancetype)swpShareViewShowWithData:(NSArray<NSString *> *)shareData setDelegate:(nullable id<SwpShareViewDelegate>)delegate;


/**!
 *  @ author swp_song
 *
 *  @ brief  swpShareListViewDidSelectIndex: ( 点击 每个 分下 回调 )
 *
 *  @ param  swpShareListViewDidSelectIndex
 */
- (void)swpShareListViewDidSelectIndex:(void (^)(SwpShareView *swpShareView, NSInteger didSelectIndex, NSString *swpShareKey))swpShareListViewDidSelectIndex;


/**!
 *  @ author swp_song
 *
 *  @ brief  swpShareTitleSize: ( 设置 分享 title 字体 大小 )
 */
- (SwpShareView *(^)(CGFloat swpShareTitleSize))swpShareTitleSize;

/**!
 *  @ author swp_song
 *
 *  @ brief  swpShareTitle: ( 设置 分享 title )
 */
- (SwpShareView *(^)(NSString *swpShareTitle))swpShareTitle;

/**
 *  @ author swp_song
 *
 *  @ brief  swpShareTitle: ( 设置 分享 字体 颜色 )
 */
- (SwpShareView *(^)(UIColor *swpShareTitleColor))swpShareTitleColor;

/**
 *  @ author swp_song
 *
 *  @ brief  swpShareTitleFont: ( 设置 分享 字体  )
 */
- (SwpShareView *(^)(UIFont *swpShareTitleFont))swpShareTitleFont;

@end


NS_ASSUME_NONNULL_END

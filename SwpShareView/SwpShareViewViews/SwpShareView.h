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
 *  @ brief  swpShareViewShowWithData:setDelegate:  ( 显示 控件 并 设置 代理 )
 *
 *  @ param  shareData
 *
 *  @ param  delegate
 *
 *  @ return SwpShareView
 */
+ (instancetype)swpShareViewShowWithData:(NSArray<NSString *> *)shareData setDelegate:(nullable id<SwpShareViewDelegate>)delegate;

/**
 *  @ author swp_song
 *
 *  @ brief  swpShareViewHidden:    ( 关闭 swpShareView  )
 */
- (SwpShareView *(^)())swpShareViewHidden;


/**!
 *  @ author swp_song
 *
 *  @ brief  swpShareSetTripartiteFrameworkShareTypes    ( 设置 三方分享type )
 */
- (SwpShareView *(^)(NSArray *tripartiteFrameworkShareTypes))swpShareSetTripartiteFrameworkShareTypes;

/**!
 *  @ author swp_song
 *
 *  @ brief  swpShareViewWhetherCloseBlock: ( 是否 关闭 分享 页面 )
 *
 *  @ param  swpShareViewWhetherCloseBlock
 */
- (void)swpShareViewWhetherCloseBlock:(BOOL (^)(SwpShareView *swpShareView))swpShareViewWhetherCloseBlock;

/**!
 *  @ author swp_song
 *
 *  @ brief  swpShareListViewDidSelectIndexBlock: ( 点击 每个 分享图标 回调 )
 *
 *  @ param  swpShareListViewDidSelectIndexBlock
 */
- (void)swpShareListViewDidSelectIndexBlock:(nullable void (^)(SwpShareView *swpShareView, NSInteger didSelectIndex, SwpShareModel *swpShare))swpShareListViewDidSelectIndexBlock;

/**
 *  @ author swp_song
 *
 *  @ brief  swpShareViewCloseBlock: ( swpShareView Block 分享 页面 关闭之后调用 )
 *
 *  @ param swpShareViewCloseBlock
 */
- (void)swpShareViewCloseBlock:(nullable void (^)(SwpShareView *swpShareView, SwpShareModel *swpShare))swpShareViewCloseBlock;

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

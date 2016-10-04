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

/**!
 *  @ author swp_song
 *
 *  @ brief  swpShareViewShowWithData: ( 显示 控件, 设置 代理, 设置  友盟 分享 type, umTypes 参数是个友盟分享类型的数组, 泛型 NSNumber, 例如: @[@(UMSocialPlatformType_QQ), @(UMSocialPlatformType_Qzone)]  )
 *
 *  @ param  shareData
 *
 *  @ param  delegate
 *
 *  @ param  umTypes
 *
 *  @ return SwpShareView
 */
+ (instancetype)swpShareViewShowWithData:(NSArray<NSString *> *)shareData setDelegate:(id<SwpShareViewDelegate>)delegate setUMType:(NSArray<NSNumber *> *)umTypes;


/**!
 *  @ author swp_song
 *
 *  @ brief  swpShareListViewDidSelectIndex: ( 点击 每个 分下 回调 )
 *
 *  @ param  swpShareListViewDidSelectIndex
 */
- (void)swpShareListViewDidSelectIndex:(void (^)(SwpShareView *swpShareView, NSInteger didSelectIndex, SwpShareModel *swpShare))swpShareListViewDidSelectIndex;


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

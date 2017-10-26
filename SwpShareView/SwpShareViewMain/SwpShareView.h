//
//  SwpShareView.h
//  swp_song
//
//  Created by swp_song on 2016/9/28.
//  Copyright © 2016年 songweipng. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "SwpShareViewDelegate.h"
#import "SwpShareCustomTypes.h"

NS_ASSUME_NONNULL_BEGIN

@interface SwpShareView : UIView

/*! 代理 属性 !*/
@property (nullable, nonatomic, weak) id<SwpShareViewDelegate>delegate;

/**
 *  @author swp_song
 *
 *  @brief  swpShareViewShowWithData:   ( 显示控件 )
 *
 *  @param  shareData   shareData
 *
 *  @return SwpShareView
 */
+ (instancetype)swpShareViewShowWithData:(NSArray<NSString *> *)shareData;

/**
 *  @author swp_song
 *
 *  @brief  swpShareViewShowInit    ( 显示控件 )
 */
+ (__kindof SwpShareView * _Nonnull (^)(NSArray<NSString *> * _Nonnull))swpShareViewShowInit;

/**
 *  @author swp_song
 *
 *  @brief  swpShareViewShowWithData:setDelegate:   ( 显示控件, 并设置代理 )
 *
 *  @param  shareData   shareData
 *
 *  @param  delegate    delegate
 *
 *  @return SwpShareView
 */
+ (instancetype)swpShareViewShowWithData:(NSArray<NSString *> *)shareData setDelegate:(id<SwpShareViewDelegate> _Nullable)delegate;

/**
 *  @author swp_song
 *
 *  @brief  swpShareViewShowInitWithDelegate    ( 显示控件, 并设置代理 )
 */
+ (__kindof SwpShareView * _Nonnull (^)(NSArray<NSString *> * _Nonnull, id<SwpShareViewDelegate> _Nullable))swpShareViewShowInitWithDelegate;

/**
 *  @author swp_song
 *
 *  @brief  swpShareViewCustomItems:   ( 自定义分享 items )
 */
- (__kindof SwpShareView *(^)(NSArray<SwpShareModel *> *swpShareCustomItems))swpShareViewCustomItems;

/**
 *  @author swp_song
 *
 *  @brief  swpShareViewHidden: ( 关闭 swpShareView  )
 */
- (__kindof SwpShareView *(^)(void))swpShareViewHidden;

/**
 *  @author swp_song
 *
 *  @brief  swpShareSetTripartiteFrameworkShareTypes   ( 设置三方分享 type )
 */
- (__kindof SwpShareView *(^)(NSArray *tripartiteFrameworkShareTypes))swpShareSetTripartiteFrameworkShareTypes;


/**
 *  @author swp_song
 *
 *  @brief  swpShareItemType   ( 隐藏未安装 App )
 */
- (__kindof SwpShareView *(^)(SwpShareItemType swpShareItemType))swpShareItemType;



/**
 *  @ author swp_song
 *
 *  @ brief  swpShareTitleSize: ( 设置分享 title 字体大小 )
 */
- (__kindof SwpShareView *(^)(CGFloat swpShareTitleSize))swpShareTitleSize;

/**
 *  @ author swp_song
 *
 *  @ brief  swpShareTitle: ( 设置 分享 title )
 */
- (__kindof SwpShareView *(^)(NSString *swpShareTitle))swpShareTitle;

/**
 *  @ author swp_song
 *
 *  @ brief  swpShareTitle: ( 设置 分享 字体 颜色 )
 */
- (__kindof SwpShareView *(^)(UIColor *swpShareTitleColor))swpShareTitleColor;

/**
 *  @ author swp_song
 *
 *  @ brief  swpShareTitleFont: ( 设置 分享 字体  )
 */
- (__kindof SwpShareView *(^)(UIFont *swpShareTitleFont))swpShareTitleFont;


#pragma mark - Block
/**
 *  @author swp_song
 *
 *  @brief  swpShareViewWhetherCloseBlock:  ( SwpShareView 回调，是否关闭分享页面 )
 *
 *  @param  swpShareViewWhetherCloseBlock   swpShareViewWhetherCloseBlock
 */
- (void)swpShareViewWhetherCloseBlock:(BOOL (^ _Nullable)(SwpShareView * _Nonnull swpShareView))swpShareViewWhetherCloseBlock;

/**
 *  @author swp_song
 *
 *  @brief  swpShareViewWhetherCloseBlockChain   ( SwpShareView 回调，是否关闭分享页面 )
 */
- (__kindof SwpShareView * _Nonnull (^)(BOOL (^ _Nullable)(SwpShareView * _Nonnull)))swpShareViewWhetherCloseBlockChain;


/**
 *  @author swp_song
 *
 *  @brief  swpShareListViewDidSelectIndexBlock:    ( SwpShareView 回调，点击每个分享图标调用 )
 *
 *  @param  swpShareListViewDidSelectIndexBlock swpShareListViewDidSelectIndexBlock
 */
- (void)swpShareListViewDidSelectIndexBlock:(void (^ _Nullable)(SwpShareView * _Nonnull swpShareView, NSInteger didSelectIndex, SwpShareModel * _Nonnull swpShare))swpShareListViewDidSelectIndexBlock;

/**
 *  @author swp_song
 *
 *  @brief  swpShareListViewDidSelectIndexBlockChain    ( SwpShareView 回调，点击每个分享图标调用 )
 */
- (__kindof SwpShareView * _Nonnull (^)(void (^ _Nullable)(SwpShareView * _Nonnull, NSInteger, SwpShareModel * _Nonnull)))swpShareListViewDidSelectIndexBlockChain;

/**
 *  @author swp_song
 *
 *  @brief  swpShareViewCloseBlock: ( SwpShareView 回调，分享页面关闭之后调用 )
 *
 *  @param swpShareViewCloseBlock   swpShareVswpShareViewCloseBlockiewCloseBlock
 */
- (void)swpShareViewCloseBlock:(void (^ _Nullable)(SwpShareView * _Nonnull swpShareView, SwpShareModel * _Nonnull swpShare))swpShareViewCloseBlock;

/**
 *  @author swp_song
 *
 *  @brief  swpShareViewCloseBlockChain ( SwpShareView 回调，分享页面关闭之后调用 )
 */
- (__kindof SwpShareView * _Nonnull (^)(void (^_Nullable)(SwpShareView * _Nonnull, SwpShareModel * _Nonnull)))swpShareViewCloseBlockChain;


@end


NS_ASSUME_NONNULL_END

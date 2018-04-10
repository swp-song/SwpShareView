//
//  SwpShareViewDelegate.h
//  swp_song
//
//  Created by swp_song on 2016/10/1.
//  Copyright © 2016年 swp_song. All rights reserved.
//

#import <Foundation/Foundation.h>

@class SwpShareView, SwpShareModel;

NS_ASSUME_NONNULL_BEGIN
@protocol SwpShareViewDelegate <NSObject>

@optional

/**
 *  @author swp_song
 *
 *  @brief  swpShareViewWhetherClose:   ( SwpShareView 代理方法，点击分享 item 是否关闭页面, Block 设置完成，该代理会失效 )
 *
 *  @param  swpShareView    swpShareView
 *
 *  @return BOOL
 */
- (BOOL)swpShareViewWhetherClose:(SwpShareView *)swpShareView;

/**
 *  @author swp_song
 *
 *  @brief  swpShareView:didSelectIndex:swpShare:   ( SwpShareView 代理方法， 点击分享调用 )
 *
 *  @param  swpShareView    swpShareView
 *
 *  @param  index           index
 *
 *  @param  swpShare        swpShare
 */
- (void)swpShareView:(SwpShareView *)swpShareView didSelectIndex:(NSInteger)index swpShare:(SwpShareModel *)swpShare;

/**
 *  @author swp_song
 *
 *  @brief  swpShareViewSetTripartiteFrameworkShareType:    ( SwpShareView 代理方法， 三方分享 type )
 *
 *  @param  swpShareView    swpShareView
 *  
 *  @return NSArray
 */
- (NSArray *)swpShareViewSetTripartiteFrameworkShareType:(SwpShareView *)swpShareView;


/**
 *  @author swp_song
 *
 *  @brief  swpShareView:closeSwpShareView: ( SwpShareView 代理方法， 分享页面关闭之后调用 )
 *
 *  @param  swpShareView    swpShareView
 *
 *  @param  swpShare        swpShare
 */
- (void)swpShareView:(SwpShareView *)swpShareView closeSwpShareView:(SwpShareModel *)swpShare;

@end
NS_ASSUME_NONNULL_END


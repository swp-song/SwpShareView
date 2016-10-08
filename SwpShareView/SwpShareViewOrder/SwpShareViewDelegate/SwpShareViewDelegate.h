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

/**!
 *  @ author swp_song
 *
 *  @ brief  swpShareView:didSelectIndex:swpShareKey: ( swpShareView 代理方法 点击 分享 调用 )
 *
 *  @ param  swpShareView
 *
 *  @ param  index
 *
 *  @ param  swpShare
 */
- (void)swpShareView:(SwpShareView *)swpShareView didSelectIndex:(NSInteger)index swpShare:(SwpShareModel *)swpShare;


/**!
 *  @ author swp_song
 *
 *  @ brief  swpShareViewSetTripartiteFrameworkShareType: ( swpShareView 设置 三方分享 type )
 *
 *  @ param  swpShareView
 *  
 *  @ return NSArray
 */
- (NSArray *)swpShareViewSetTripartiteFrameworkShareType:(SwpShareView *)swpShareView;


/**!
 *  @ author swp_song
 *
 *  @ brief  swpShareViewClose: ( swpShareView 代理方法  分享页面关闭之后 调用 )
 *
 *  @ param  swpShareView
 */
- (void)swpShareViewClose:(SwpShareView *)swpShareView;



@end
NS_ASSUME_NONNULL_END


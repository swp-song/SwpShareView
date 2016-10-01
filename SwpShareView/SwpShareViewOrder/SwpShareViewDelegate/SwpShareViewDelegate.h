//
//  SwpShareViewDelegate.h
//  swp_song
//
//  Created by swp_song on 2016/10/1.
//  Copyright © 2016年 swp_song. All rights reserved.
//

#import <Foundation/Foundation.h>

@class SwpShareView;

NS_ASSUME_NONNULL_BEGIN
@protocol SwpShareViewDelegate <NSObject>

@optional

/**!
 *  @ author swp_song
 *
 *  @ brief  swpShareView:didSelectIndex:swpShareKey: ( swpShareView 点击 分享 调用 )
 *
 *  @ param  swpShareView
 *
 *  @ param  index
 *
 *  @ param  swpShareKey
 */
- (void)swpShareView:(SwpShareView *)swpShareView didSelectIndex:(NSInteger)index swpShareKey:(NSString *)swpShareKey;

@end
NS_ASSUME_NONNULL_END


//
//  SwpShareListView.h
//  swp_song
//
//  Created by swp_song on 2016/10/1.
//  Copyright © 2016年 swp_song. All rights reserved.
//

#import <UIKit/UIKit.h>

@class SwpShareListView, SwpShareModel;


NS_ASSUME_NONNULL_BEGIN


@protocol SwpShareListViewDelegate <NSObject>

@optional

/**!
 *  @ author swp_song
 *
 *  @ brief  swpShareListView:didSelectItemAtIndexPath:swpShare:swpShareKey ( swpShareListView 代理方法 点击 cell 时 调用 )
 *
 *  @ param  swpShareListView
 *
 *  @ param  indexPath
 *
 *  @ param  swpShare
 *
 *  @ param  swpShareKey
 */
- (void)swpShareListView:(SwpShareListView *)swpShareListView didSelectItemAtIndexPath:(NSIndexPath *)indexPath swpShare:(SwpShareModel *)swpShare swpShareKey:(NSString *)swpShareKey;

@end

@interface SwpShareListView : UICollectionView

/**!
 *  @ author swp_song
 *
 *  @ brief  initSwpShareListViewWithFrame: ( 初始化 数据 )
 *
 *  @ param  frame
 *
 *  @ return SwpShareListView
 */
- (instancetype)initSwpShareListViewWithFrame:(CGRect)frame;

/**!
 *  @ author swp_song
 *
 *  @ brief  swpShares: ( 设置 数据  )
 */
- (SwpShareListView *(^)(NSArray<SwpShareModel *> *))swpShares;

/*! 代理属性 !*/
@property (nullable, nonatomic, weak) id<SwpShareListViewDelegate>swpShareListViewDelegate;


@end
NS_ASSUME_NONNULL_END

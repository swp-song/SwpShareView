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

/**!
 *  @ author swp_song
 *
 *  @ brief  swpShareListView:tripartiteFrameworkShareType: ( swpShareListView 代理方法 获取 三方框架 分享类型 )
 *
 *  @ param  swpShareListView
 *
 *  @ param  index
 *
 *  @ return id
 */
- (id)swpShareListView:(SwpShareListView *)swpShareListView tripartiteFrameworkShareType:(NSInteger)index;

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

/**!
 *  @ author swp_song
 *
 *  @ brief  swpShareCustomItems: (  设置 追加 自定义 数据  )
 */
- (SwpShareListView *(^)(NSArray<SwpShareModel *> *swpShareCustomItems))swpShareCustomItems;

/*! 代理属性 !*/
@property (nullable, nonatomic, weak) id<SwpShareListViewDelegate>swpShareListViewDelegate;


@end
NS_ASSUME_NONNULL_END

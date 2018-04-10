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

/**
 *  @author swp_song
 *
 *  @brief  swpShareListView:didSelectItemAtIndexPath:swpShare:swpShareKey: ( SwpShareListView 代理方法，点击 Cell 时调用 )
 *
 *  @param  swpShareListView    swpShareListView
 *
 *  @param  indexPath           indexPath
 *
 *  @param  swpShare            swpShare
 *
 *  @param  swpShareKey         swpShareKey
 */
- (void)swpShareListView:(SwpShareListView *)swpShareListView didSelectItemAtIndexPath:(NSIndexPath *)indexPath swpShare:(SwpShareModel *)swpShare swpShareKey:(NSString *)swpShareKey;

/**
 *  @author swp_song
 *
 *  @brief  swpShareListView:tripartiteFrameworkShareType: ( SwpShareListView 代理方法，获取三方框架分享类型 )
 *
 *  @param  swpShareListView    swpShareListView
 *
 *  @param  index               index
 *
 *  @return id                  id
 */
- (id)swpShareListView:(SwpShareListView *)swpShareListView tripartiteFrameworkShareType:(NSInteger)index;

@end

@interface SwpShareListView : UICollectionView

/**
 *  @author swp_song
 *
 *  @brief  initSwpShareListViewWithFrame:  ( 快速初始化 )
 *
 *  @param  frame   frame
 *
 *  @return SwpShareListView
 */
- (instancetype)initSwpShareListViewWithFrame:(CGRect)frame;

/**
 *  @author swp_song
 *
 *  @brief  swpShares:  ( 设置数据 )
 */
- (SwpShareListView *(^)(NSArray<SwpShareModel *> *))swpShares;

/* 代理属性 */
@property (nullable, nonatomic, weak) id<SwpShareListViewDelegate>swpShareListViewDelegate;


@end
NS_ASSUME_NONNULL_END

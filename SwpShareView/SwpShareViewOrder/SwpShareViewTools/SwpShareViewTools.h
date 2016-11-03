//
//  SwpShareViewTools.h
//  swp_song
//
//  Created by swp_song on 2016/9/28.
//  Copyright © 2016年 swp_song. All rights reserved.
//

#import <Foundation/Foundation.h>

#import <UIKit/UIKit.h>

#import "SwpShareCustomTypes.h"

@class SwpShareModel;

NS_ASSUME_NONNULL_BEGIN

@interface SwpShareViewTools : NSObject

/**!
 *  @ author swp_song
 *
 *  @ brief  swpShareViewToolsMainScreen    ( 取出 设备 实际 frame )
 *
 *  @ return CGRect
 */
+ (CGRect)swpShareViewToolsMainScreen;


/**!
 *  @ author swp_song
 *
 *  @ brief  swpShareViewToolsCheckFrame:    ( 验证 frame 大小 )
 *
 *  @ param  frame
 *
 *  @ return CGRect
 */
+ (CGRect)swpShareViewToolsCheckFrame:(CGRect)frame;

/**!
 *  @ author swp_song
 *
 *  @ brief  swpShareViewToolsDataProcessing: ( 数据 处理 )
 *
 *  @ param  data
 *
 *  @ return NSArray<NSDictionary *>
 */
+ (NSArray<NSDictionary *> *)swpShareViewToolsDataProcessing:(NSArray<NSString *> *)data;

/**!
 *
 *  @ author swp_song
 *
 *  @ brief  swpShareViewToolsSetLabelWith:setTitle:setFontSize:setTitleColor:  ( 设置 label 公共 属性 )
 *
 *  @ param  label
 *
 *  @ param  title
 *
 *  @ param  fontSize
 *
 *  @ param  titleColor
 */
+ (void)swpShareViewToolsSetLabelWith:(UILabel *)label setTitle:(nullable NSString *)title setFontSize:(CGFloat)fontSize  setTitleColor:(nullable UIColor *)titleColor;

/**!
 *  @ author swp_song
 *
 *  @ brief  swpShareViewToolsCenterAnimation:setFromValue:setToValue:animationCompletionBlock: ( View Center 动画 效果 )
 *
 *  @ param  addAnimationView
 *
 *  @ param  fromValue
 *
 *  @ param  toValue
 *
 *  @ param  animationCompletionBlock
 */
+ (void)swpShareViewToolsCenterAnimation:(UIView *)addAnimationView setFromValue:(CGPoint)fromValue setToValue:(CGPoint)toValue animationCompletionBlock:(nullable void(^)(BOOL finished))animationCompletionBlock;

/**!
 *  @ author swp_song
 *
 *  @ brief  swpShareViewToolsAlphaAnimation:setFromValue:setToValue:animationCompletionBlock: ( View Alpha 动画 效果 )
 *
 *  @ param  addAnimationView
 *
 *  @ param  fromValue
 *
 *  @ param  toValue
 *
 *  @ param  animationCompletionBlock
 */
+ (void)swpShareViewToolsAlphaAnimation:(UIView *)addAnimationView setFromValue:(CGFloat)fromValue setToValue:(CGFloat)toValue animationCompletionBlock:(nullable void(^)(BOOL finished))animationCompletionBlock;

/**!
 *  @ author swp_song
 *
 *  @ brief  swpShareViewToolsDataAppend:appendData: ( 数据追加 )
 *
 *  @ param  originalData
 *
 *  @ param  appendData
 *
 *  @ return NSArray<SwpShareModel *> *
 */
+ (NSArray<SwpShareModel *> *)swpShareViewToolsDataAppend:(NSArray<SwpShareModel *> *)originalData appendData:(NSArray<SwpShareModel *> *)appendData;

/**
 *  @ author swp_song
 *
 *  @ brief  swpShareViewToolsCalculateFrame:viewWidth: ( 计算 view frame )
 *
 *  @ param  dataCount
 *
 *  @ param  width
 *
 *  @ return CGRect
 */
+ (CGRect)swpShareViewToolsCalculateFrame:(NSInteger)dataCount viewWidth:(CGFloat)width;


/**!
 *  @ author swp_song
 *
 *  @ brief  swpShareViewToolsSwpShareItemTypeDataProcessing:   ( 数据追加 )
 *
 *  @ param  swpShares
 *
 *  @ param  swpShareItemType
 *
 *  @ return NSArray<SwpShareModel *>
 */
+ (NSArray<SwpShareModel *> *)swpShareViewToolsSwpShareItemTypeDataProcessing:(NSArray<SwpShareModel *> *)swpShares swpShareItemType:(SwpShareItemType)swpShareItemType;

@end

NS_ASSUME_NONNULL_END

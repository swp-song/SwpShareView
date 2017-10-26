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

/**
 *  @author swp_song
 *
 *  @brief  swpShareViewToolsMainScreen ( 获取设备 bounds )
 *
 *  @return CGRect
 */
+ (CGRect)swpShareViewToolsMainScreen;

/**
 *  @author swp_song
 *
 *  @brief  swpShareViewToolsCheckFrame:    ( 验证 frame 大小 )
 *
 *  @param  frame   frame
 *
 *  @return CGRect
 */
+ (CGRect)swpShareViewToolsCheckFrame:(CGRect)frame;

/**
 *  @author swp_song
 *
 *  @brief  swpShareViewToolsDataProcessing:    ( 数据处理 )
 *
 *  @param  data    data
 *
 *  @return NSArray
 */
+ (NSArray<NSDictionary *> *)swpShareViewToolsDataProcessing:(NSArray<NSString *> *)data;

/**
 *  @author swp_song
 *
 *  @brief  swpShareViewToolsSetLabelWith:setTitle:setFontSize:setTitleColor:   ( 设置 label 公共属性 )
 *
 *  @param  label       label
 *
 *  @param  title       title
 *
 *  @param  fontSize    fontSize
 *
 *  @param  titleColor  titleColor
 */
+ (void)swpShareViewToolsSetLabelWith:(UILabel *)label setTitle:(nullable NSString *)title setFontSize:(CGFloat)fontSize  setTitleColor:(nullable UIColor *)titleColor;

/**
 *  @author swp_song
 *
 *  @brief  swpShareViewToolsCenterAnimation:setFromValue:setToValue:animationCompletionBlock:  ( View Center 动画 效果 )
 *
 *  @param  addAnimationView            addAnimationView
 *
 *  @param  fromValue                   fromValue
 *
 *  @param  toValue                     toValue
 *
 *  @param  animationCompletionBlock    animationCompletionBlock
 */
+ (void)swpShareViewToolsCenterAnimation:(UIView *)addAnimationView setFromValue:(CGPoint)fromValue setToValue:(CGPoint)toValue animationCompletionBlock:(nullable void(^)(BOOL finished))animationCompletionBlock;

/**
 *  @author swp_song
 *
 *  @brief  swpShareViewToolsAlphaAnimation:setFromValue:setToValue:animationCompletionBlock:   ( View Alpha 动画 效果 )
 *
 *  @param  addAnimationView            addAnimationView
 *
 *  @param  fromValue                   fromValue
 *
 *  @param  toValue                     toValue
 *
 *  @param  animationCompletionBlock    animationCompletionBlock
 */
+ (void)swpShareViewToolsAlphaAnimation:(UIView *)addAnimationView setFromValue:(CGFloat)fromValue setToValue:(CGFloat)toValue animationCompletionBlock:(void(^ _Nullable)(BOOL finished))animationCompletionBlock;

/**
 *  @author swp_song
 *
 *  @brief  swpShareViewToolsCalculateFrame:viewWidth:  ( 计算 View Frame )
 *
 *  @param  dataCount   dataCount
 *
 *  @param  width       width
 *
 *  @return CGRect
 */
+ (CGRect)swpShareViewToolsCalculateFrame:(NSInteger)dataCount viewWidth:(CGFloat)width;


/**
 *  @author swp_song
 *
 *  @brief  swpShareViewToolsDataAppend:appendData: ( 数据追加 )
 *
 *  @param  originalData    originalData
 *
 *  @param  appendData      appendData
 *
 *  @return NSArray
 */
+ (NSArray<SwpShareModel *> *)swpShareViewToolsDataAppend:(NSArray<SwpShareModel *> *)originalData appendData:(NSArray<SwpShareModel *> *)appendData;


/**
 *  @author swp_song
 *
 *  @brief  swpShareViewToolsSwpShareItemTypeDataProcessing:   ( 数据追加 )
 *
 *  @param  swpShares           swpShares
 *
 *  @param  swpShareItemType    swpShareItemType
 *
 *  @return NSArray
 */
+ (NSArray<SwpShareModel *> *)swpShareViewToolsSwpShareItemTypeDataProcessing:(NSArray<SwpShareModel *> *)swpShares swpShareItemType:(SwpShareItemType)swpShareItemType;

/**
 *  @author swp_song
 *
 *  @brief  swpShareViewToolsSetTapGestureRecognizer:setViewTag:setClickCount:setTarget:setAction:setCancelsTouchesInView:    ( 绑定 一个 点击事件 给一个 view )
 *
 *  @param  view        view
 *
 *  @param  tag         tag
 *
 *  @param  count       count
 *
 *  @param  target      target
 *
 *  @param  action      action
 *
 *  @param  cancels     cancels
 *
 *  @return UITapGestureRecognizer
 */
+ (UITapGestureRecognizer *)swpShareViewToolsSetTapGestureRecognizer:(UIView *)view setViewTag:(NSInteger)tag setClickCount:(NSInteger)count setTarget:(id _Nullable)target setAction:(SEL _Nullable)action setCancelsTouchesInView:(BOOL)cancels;

/**
 *  @author swp_song
 *
 *  @brief  swpShareViewToolsCreateToolbarCover:    ( 创建遮罩 )
 *
 *  @param  frame   frame
 *
 *  @return UIToolbar
 */
+ (UIToolbar *)swpShareViewToolsCreateToolbarCover:(CGRect)frame;

@end

NS_ASSUME_NONNULL_END

//
//  SwpShareViewTools.h
//  swp_song
//
//  Created by swp_song on 2016/9/28.
//  Copyright © 2016年 swp_song. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN
@interface SwpShareViewTools : NSObject


/*!
 *  @author swp_song
 *
 *  @brief  swpShareViewToolsScreenWidth ( 取出 设备 实际的宽度值 )
 *
 *  @return CGFloat
 */
+ (CGFloat)swpShareViewToolsScreenWidth;

/*!
 *  @author swp_song
 *
 *  @brief  swpShareViewToolsScreenHeight     ( 取出 设备 实际的高度值 )
 *
 *  @return CGFloat
 */
+ (CGFloat)swpShareViewToolsScreenHeight;

+ (CGRect)swpShareViewToolsMainScreen;

+ (UIColor *)swpShareViewToolsWithHexadecimal:(NSInteger)hexadecimalValue;

+ (CGRect)swpShareViewToolsCheckFrame:(CGRect)frame;

+ (void)swpShareViewToolsCenterAnimation:(UIView *)addAnimationView setFromValue:(CGPoint)fromValue setToValue:(CGPoint)toValue animationCompletionBlock:(nullable void(^)(BOOL finished))animationCompletionBlock;

+ (void)swpShareViewToolsAlphaAnimation:(UIView *)addAnimationView setFromValue:(CGFloat)fromValue setToValue:(CGFloat)toValue animationCompletionBlock:(nullable void(^)(BOOL finished))animationCompletionBlock;

+ (void)swpShareViewToolsSetLabelWith:(UILabel *)label setTitle:(nullable NSString *)title setFontSize:(CGFloat)fontSize  setTitleColor:(nullable UIColor *)titleColor;

+ (NSArray<NSDictionary *> *)swpShareViewToolsDataProcessing:(NSArray<NSString *> *)data;

#pragma mark - Set View UITapGestureRecognizer Method
/*!
 *  @ author swp_song
 *
 *  @ brief  swpShareViewToolsSetTapGestureRecognizer:setViewTag:setClickCount:setTarget:setAction:setCancelsTouchesInView:    ( 绑定 一个 点击事件 给一个 view )
 *
 *  @ param  view
 *
 *  @ param  tag
 *
 *  @ param  count
 *
 *  @ param  target
 *
 *  @ param  action
 *
 *  @ param  cancels
 *
 *  @ return UITapGestureRecognizer
 */
+ (UITapGestureRecognizer *)swpShareViewToolsSetTapGestureRecognizer:(UIView *)view setViewTag:(NSInteger)tag setClickCount:(NSInteger)count setTarget:(id)target setAction:(SEL)action setCancelsTouchesInView:(BOOL)cancels;
@end
NS_ASSUME_NONNULL_END

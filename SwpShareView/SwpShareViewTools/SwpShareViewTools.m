//
//  SwpShareViewTools.m
//  swp_song
//
//  Created by swp_song on 2016/9/28.
//  Copyright © 2016年 songweipng. All rights reserved.
//

#import "SwpShareViewTools.h"

#import <POP/POP.h>

@implementation SwpShareViewTools



/*!
 *  @ author swp_song
 *
 *  @ brief  swpShareViewToolsScreenWidth ( 取出 设备 实际的宽度值 )
 *
 *  @ return CGFloat
 */
+ (CGFloat)swpShareViewToolsScreenWidth {
    return [[UIScreen mainScreen] bounds].size.width;
}

/*!
 *  @ author swp_song
 *
 *  @ brief  swpShareViewToolsScreenHeight     ( 取出 设备 实际的高度值 )
 *
 *  @ return CGFloat
 */
+ (CGFloat)swpShareViewToolsScreenHeight {
    return [[UIScreen mainScreen] bounds].size.height;
}

+ (CGRect)swpShareViewToolsMainScreen {
    return UIScreen.mainScreen.bounds;
}



+ (UIColor *)swpShareViewToolsWithHexadecimal:(NSInteger)hexadecimalValue {
    return [[self class] swpShareViewToolsWithHexadecimal:hexadecimalValue alpha:1];
}
/*!
 *  @ author swp_song
 *
 *  @ brief  swpColorWithHexadecimal:alpha: ( 使用 十六进制值 设置 颜色 )
 *
 *  @ param  hexadecimalValue
 *
 *  @ param  alpha
 *
 *  @ return UIColor
 */
+ (UIColor *)swpShareViewToolsWithHexadecimal:(NSInteger)hexadecimalValue alpha:(CGFloat)alpha {
    return [UIColor colorWithRed:((float)((hexadecimalValue & 0xFF0000) >> 16)) / 255.0 green:((float)((hexadecimalValue & 0xFF00) >> 8)) / 255.0 blue:((float)(hexadecimalValue & 0xFF)) / 255.0 alpha:alpha];
}


+ (void)swpShareViewToolsCenterAnimation:(UIView *)addAnimationView setFromValue:(CGPoint)fromValue setToValue:(CGPoint)toValue animationCompletionBlock:(void(^)(BOOL finished))animationCompletionBlock {
    
    POPSpringAnimation *springAnimation = [POPSpringAnimation animationWithPropertyNamed:kPOPViewCenter];
    springAnimation.fromValue           = [NSValue valueWithCGPoint:fromValue];
    springAnimation.toValue             = [NSValue valueWithCGPoint:toValue];
    springAnimation.springBounciness    = 10.0f;
    springAnimation.springSpeed         = 5.0f;
    [springAnimation setCompletionBlock:^(POPAnimation *animation, BOOL finished) {
        if (animationCompletionBlock) animationCompletionBlock(finished);
    }];
    [addAnimationView pop_addAnimation:springAnimation forKey:nil];
}

+ (void)swpShareViewToolsAlphaAnimation:(UIView *)addAnimationView setFromValue:(CGFloat)fromValue setToValue:(CGFloat)toValue animationCompletionBlock:(void(^)(BOOL finished))animationCompletionBlock {
    
    POPBasicAnimation *positionAnimation = [POPBasicAnimation animationWithPropertyNamed:kPOPViewAlpha];
    positionAnimation.fromValue           = @(fromValue);
    positionAnimation.toValue             = @(toValue);
    [positionAnimation setCompletionBlock:^(POPAnimation *animation, BOOL finished) {
        if (animationCompletionBlock) animationCompletionBlock (finished);
    }];
    [addAnimationView pop_addAnimation:positionAnimation forKey:nil];
}


+ (void)swpShareViewToolsSetLabelWith:(UILabel *)label setTitle:(NSString *)title setFontSize:(CGFloat)fontSize  setTitleColor:(UIColor *)titleColor {
    
    label.font      = [UIFont fontWithName:@"GillSans-Italic" size:fontSize];
    label.text      = title ? title : @"Title";
    label.textColor = titleColor ? titleColor : [UIColor blackColor];
}


+ (NSArray<NSDictionary *> *)swpShareViewToolsDataProcessing:(NSArray<NSString *> *)data {

   
    NSMutableArray *dictionarys = [NSMutableArray array];
    [data enumerateObjectsUsingBlock:^(NSString * _Nonnull shareKey, NSUInteger index, BOOL * _Nonnull stop) {
        NSArray<NSString *> *array      = [shareKey componentsSeparatedByString:@"-"];
        NSMutableDictionary *dictionary = [NSMutableDictionary dictionary];
        
        [array enumerateObjectsUsingBlock:^(NSString * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
            if (idx) [dictionary setObject:array[idx] forKey:[NSString stringWithFormat:@"%@_%ld", array.firstObject, (long)idx]];
        }];
        [dictionarys addObject:dictionary];
    }];
    return dictionarys.copy;
}



+ (CGRect)swpShareViewToolsCheckFrame:(CGRect)frame {
    
    
    if ([SwpShareViewTools swpShareViewToolsScreenHeight] < frame.size.height) {
        frame.origin.y    = 30;
        frame.size.height = [SwpShareViewTools swpShareViewToolsScreenHeight] - frame.origin.y * 2;
    }
    
    if ([SwpShareViewTools swpShareViewToolsScreenWidth] < frame.size.width) {
        frame.origin.x    = 30;
        frame.size.width  = [SwpShareViewTools swpShareViewToolsScreenWidth]  - frame.origin.x * 2;
    }
    
    return frame;
}

#pragma mark - Set View UITapGestureRecognizer Method
/*!
 *  @author swp_song
 *
 *  @brief  swpShareViewToolsSetTapGestureRecognizer:setViewTag:setClickCount:setTarget:setAction:setCancelsTouchesInView:    ( 绑定 一个 点击事件 给一个 view )
 *
 *  @param  view
 *
 *  @param  tag
 *
 *  @param  count
 *
 *  @param  target
 *
 *  @param  action
 *
 *  @param  cancels
 *
 *  @return UITapGestureRecognizer
 */
+ (UITapGestureRecognizer *)swpShareViewToolsSetTapGestureRecognizer:(UIView *)view setViewTag:(NSInteger)tag setClickCount:(NSInteger)count setTarget:(id)target setAction:(SEL)action setCancelsTouchesInView:(BOOL)cancels {
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] init];
    tap.numberOfTapsRequired    = count;
    tap.cancelsTouchesInView    = cancels;
    view.tag                    = tag;
    [tap addTarget:target action:action];
    view.userInteractionEnabled = YES;
    [view addGestureRecognizer:tap];
    return tap;
}

@end

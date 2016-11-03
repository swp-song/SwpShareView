//
//  SwpShareViewTools.m
//  swp_song
//
//  Created by swp_song on 2016/9/28.
//  Copyright © 2016年 swp_song. All rights reserved.
//

#import "SwpShareViewTools.h"


/*! ---------------------- Tool       ---------------------- !*/
#import "POP.h"                       // POP
/*! ---------------------- Tool       ---------------------- !*/

/*! ---------------------- Controller ---------------------- !*/
/*! ---------------------- Controller ---------------------- !*/

/*! ---------------------- View       ---------------------- !*/
/*! ---------------------- View       ---------------------- !*/

/*! ---------------------- Model      ---------------------- !*/
#import "SwpShareModel.h"
#import "SwpShareConstants.h"
/*! ---------------------- Model      ---------------------- !*/

@implementation SwpShareViewTools

/**!
 *  @ author swp_song
 *
 *  @ brief  swpShareViewToolsScreenWidth ( 取出 设备 实际的宽度值 )
 *
 *  @ return CGFloat
 */
+ (CGFloat)swpShareViewToolsScreenWidth {
    return [[UIScreen mainScreen] bounds].size.width;
}

/**!
 *  @ author swp_song
 *
 *  @ brief  swpShareViewToolsScreenHeight     ( 取出 设备 实际的高度值 )
 *
 *  @ return CGFloat
 */
+ (CGFloat)swpShareViewToolsScreenHeight {
    return [[UIScreen mainScreen] bounds].size.height;
}


/**!
 *  @ author swp_song
 *
 *  @ brief  swpShareViewToolsMainScreen    ( 取出 设备 实际 frame )
 *
 *  @ return CGRect
 */
+ (CGRect)swpShareViewToolsMainScreen {
    return UIScreen.mainScreen.bounds;
}

/**!
 *  @ author swp_song
 *
 *  @ brief  swpShareViewToolsCheckFrame:    ( 验证 frame 大小 )
 *
 *  @ param  frame
 *
 *  @ return CGRect
 */
+ (CGRect)swpShareViewToolsCheckFrame:(CGRect)frame {
    if ([SwpShareViewTools swpShareViewToolsScreenHeight] < frame.size.height) {
        frame.origin.y    = 30;
        frame.size.height = [SwpShareViewTools swpShareViewToolsScreenHeight] - frame.origin.y * 2;
    }
    if ([SwpShareViewTools swpShareViewToolsScreenWidth]  < frame.size.width) {
        frame.origin.x    = 30;
        frame.size.width  = [SwpShareViewTools swpShareViewToolsScreenWidth]  - frame.origin.x * 2;
    }
    return frame;
}

/**!
 *  @ author swp_song
 *
 *  @ brief  swpShareViewToolsDataProcessing: ( 数据 处理 )
 *
 *  @ param  data
 *
 *  @ return NSArray<NSDictionary *>
 */
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

/**!
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
+ (void)swpShareViewToolsSetLabelWith:(UILabel *)label setTitle:(NSString *)title setFontSize:(CGFloat)fontSize  setTitleColor:(UIColor *)titleColor {
    label.font      = [UIFont fontWithName:@"GillSans-Italic" size:fontSize];
    label.text      = title ? title : @"Title";
    label.textColor = titleColor ? titleColor : [UIColor blackColor];
}


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
+ (void)swpShareViewToolsAlphaAnimation:(UIView *)addAnimationView setFromValue:(CGFloat)fromValue setToValue:(CGFloat)toValue animationCompletionBlock:(void(^)(BOOL finished))animationCompletionBlock {
    
    POPBasicAnimation *positionAnimation  = [POPBasicAnimation animationWithPropertyNamed:kPOPViewAlpha];
    positionAnimation.fromValue           = @(fromValue);
    positionAnimation.toValue             = @(toValue);
    [positionAnimation setCompletionBlock:^(POPAnimation *animation, BOOL finished) {
        if (animationCompletionBlock) animationCompletionBlock (finished);
    }];
    [addAnimationView pop_addAnimation:positionAnimation forKey:nil];
}

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
+ (NSArray<SwpShareModel *> *)swpShareViewToolsDataAppend:(NSArray<SwpShareModel *> *)originalData appendData:(NSArray<SwpShareModel *> *)appendData {
    
    NSMutableArray<SwpShareModel *> *models = [NSMutableArray arrayWithArray:originalData];
    [appendData enumerateObjectsUsingBlock:^(SwpShareModel * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        [models addObject:obj];
    }];
    return models.copy;
}


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
+ (NSArray<SwpShareModel *> *)swpShareViewToolsSwpShareItemTypeDataProcessing:(NSArray<SwpShareModel *> *)swpShares swpShareItemType:(SwpShareItemType)swpShareItemType {
    
    if (!swpShares) {
        NSAssert(nil, @"SwpShares data is empty");
    }
    
    NSMutableArray<SwpShareModel *> *models = [NSMutableArray array];
    
    
    switch (swpShareItemType) {
            
        case SwpShareItemTypeNormal: {
            models = [NSMutableArray arrayWithArray:swpShares];
        }
            break;
            
        case SwpShareItemTypeHide: {
            models = [[self class] swpShareViewToolsHideShareItem:swpShares];
        }
        
            break;
        case SwpShareItemTypeEnabled: {
            
            models = [[self class] swpShareViewToolsEnabledShareItem:swpShares];
        }
            break;
    }

    return models.copy;
}





/**!
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
+ (CGRect)swpShareViewToolsCalculateFrame:(NSInteger)dataCount viewWidth:(CGFloat)width {
    NSInteger column        = dataCount % 4 ? dataCount / 4 + 1 : dataCount / 4;
    CGRect    frame         = [self swpShareViewToolsCheckFrame:CGRectMake(0, 0, width, 0)];
    CGFloat   cellHeight    = frame.size.width / 4.0f;
    CGFloat   buttonHeight  = 30;
    CGFloat   labelHeight   = 40;
    CGFloat   cellClearance = 30 + 10 * column;   // cell 间隙
    return CGRectMake(0, 0, frame.size.width, cellHeight * column + buttonHeight + labelHeight + cellClearance);
}

#pragma mark - Private 

/**!
 *  @ author swp_song
 *
 *  @ brief  swpShareViewToolsCanOpenURL:   ( 验证 是否 安装 App )
 *
 *  @ param  canOpenURL
 *
 *  @ return BOOL
 */
+ (BOOL)swpShareViewToolsCanOpenURL:(NSString *)canOpenURL {
    return [[UIApplication sharedApplication] canOpenURL:[NSURL URLWithString:canOpenURL]];
}


/**!
 *  @ author swp_song
 *
 *  @ brief  swpShareViewToolsHideShareItem:    ( 隐藏 未安装 App图标 )
 *
 *  @ param  swpShares
 */
+ (NSMutableArray<SwpShareModel *> *)swpShareViewToolsHideShareItem:(NSArray<SwpShareModel *> *)swpShares {
    
    NSMutableArray<SwpShareModel *> *models = [NSMutableArray array];
    
    [swpShares enumerateObjectsUsingBlock:^(SwpShareModel * _Nonnull swpShare, NSUInteger idx, BOOL * _Nonnull stop) {
        
        if ([swpShare.swpShareKey isEqualToString:SwpShareToSinaKey] ||
            [swpShare.swpShareKey isEqualToString:SwpShareToCopyURLKey] ||
            swpShare.swpShareCanOpenURLString == nil) {
            //  新浪微博 自定义item 分享链接 item 不用隐藏
            [models addObject:swpShare];
        } else {
            if ([[self class] swpShareViewToolsCanOpenURL:swpShare.swpShareCanOpenURLString]) {
                // 安装 App 安装 不用 隐藏
                [models addObject:swpShare];
            }
        }
    }];
    return models;
}

/**!
 *  @ author swp_song
 *
 *  @ brief  swpShareViewToolsEnabledShareItem:    ( 设置 是否 开启 item  )
 *
 *  @ param  swpShares
 */
+ (NSMutableArray<SwpShareModel *> *)swpShareViewToolsEnabledShareItem:(NSArray<SwpShareModel *> *)swpShares {
    
    NSMutableArray<SwpShareModel *> *models = [NSMutableArray array];
    
    [swpShares enumerateObjectsUsingBlock:^(SwpShareModel * _Nonnull swpShare, NSUInteger idx, BOOL * _Nonnull stop) {
        
        if ([swpShare.swpShareKey isEqualToString:SwpShareToSinaKey] ||
            [swpShare.swpShareKey isEqualToString:SwpShareToCopyURLKey] ||
            swpShare.swpShareCanOpenURLString == nil) {
            // 开启
            [models addObject:[SwpShareModel swpShareWithSwpShare:swpShare setSwpShareEnabled:YES]];
            
        } else {
            if ([[self class] swpShareViewToolsCanOpenURL:swpShare.swpShareCanOpenURLString]) {
                // 安装 App 安装 开启
                [models addObject:[SwpShareModel swpShareWithSwpShare:swpShare setSwpShareEnabled:YES]];
                
            } else {
                // 关闭
                [models addObject:[SwpShareModel swpShareWithSwpShare:swpShare setSwpShareEnabled:NO]];
            }
        }
        
    }];
    
    return models;
}





@end

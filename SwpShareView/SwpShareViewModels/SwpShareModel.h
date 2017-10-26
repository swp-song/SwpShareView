//
//  SwpShareModel.h
//  swp_song
//
//  Created by swp_song on 2016/9/30.
//  Copyright © 2016年 swp_song. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN
@interface SwpShareModel : NSObject

/* 分享 key               */
@property (nonatomic, copy, readonly) NSString *swpShareKey;
/* 分享 title             */
@property (nonatomic, copy, readonly) NSString *swpShareTitle;
/* 分享 ImageView         */
@property (nonatomic, copy, readonly) NSString *swpShareImageName;
/* 分享 可以打开url       */
@property (nonatomic, copy, readonly) NSString *swpShareCanOpenURLString;
/* 分享 item 是否启用     */
@property (nonatomic, assign, readonly, getter=isSwpShareEnabled) BOOL swpShareEnabled;
/* 友盟分享 type          */
@property (nonatomic, readonly) id swpTripartiteFrameworkShareType;

/**
 *  @author swp_song
 *
 *  @brief  swpShareWihtDictionary: ( 数据处理 )
 *
 *  @param  dictionary  dictionary
 *
 *  @return SwpShareModel
 */
+ (instancetype)swpShareWihtDictionary:(NSDictionary *)dictionary;

/**
 *  @author swp_song
 *
 *  @brief  initWithDictionary: ( 数据处理 )
 *
 *  @param  dictionary  dictionary
 *
 *  @return SwpShareModel
 */
- (instancetype)initWithDictionary:(NSDictionary *)dictionary;

/**
 *  @author swp_song
 *
 *  @brief  swpShareWithShareKey:setSwpShareTitle:setSwpShareImageName:setSwpTripartiteFrameworkShareType:  ( 快速初始化 )
 *
 *  @param  swpShareKey                         swpShareKey
 *
 *  @param  swpShareTitle                       swpShareTitle
 *
 *  @param  swpShareImageName                   swpShareImageName
 *
 *  @param  swpTripartiteFrameworkShareType     swpTripartiteFrameworkShareType
 *
 *  @return SwpShareModel                       SwpShareModel
 */
+ (instancetype)swpShareWithShareKey:(NSString *)swpShareKey setSwpShareTitle:(NSString * _Nullable)swpShareTitle setSwpShareImageName:(nullable NSString *)swpShareImageName setSwpTripartiteFrameworkShareType:(id _Nullable)swpTripartiteFrameworkShareType;


/**
 *  @brief  swpShareWithSwpShare:setSwpTripartiteFrameworkShareType:    ( 数据处理，设置三方分享 key )
 *
 *  @param  swpShare                            swpShare
 *
 *  @param  swpTripartiteFrameworkShareType     swpTripartiteFrameworkShareType
 *
 *  @return SwpShareModel                       SwpShareModel
 */

+ (instancetype)swpShareWithSwpShare:(SwpShareModel *)swpShare setSwpTripartiteFrameworkShareType:(id _Nullable)swpTripartiteFrameworkShareType;


/**
 *  @brief  swpShareWithSwpShare:setSwpShareEnabled:    ( 数据处理，设置是否启用 item )
 *
 *  @param  swpShare        swpShare
 *
 *  @param  swpShareEnabled swpShareEnabled
 *
 *  @return SwpShareModel   SwpShareModel
 */
+ (instancetype)swpShareWithSwpShare:(SwpShareModel *)swpShare setSwpShareEnabled:(BOOL)swpShareEnabled;

/**
 *  @author swp_song
 *
 *  @brief  swpShareWihtGroup:  ( 数据处理 < 一组 > )
 *
 *  @param  dictionarys     dictionarys
 *
 *  @return NSArray<SwpShareModel *>
 */
+ (NSArray<SwpShareModel *> *)swpShareWihtGroup:(NSArray<NSDictionary *> *)dictionarys;

/**
 *  @author swp_song
 *
 *  @brief  swpShareWihtGroup:setTripartiteFrameworkShareTypes: ( 数据处理 < 一组 > )
 *
 *  @param  dictionarys                     dictionarys
 *
 *  @param  tripartiteFrameworkShareTypes   tripartiteFrameworkShareTypes
 *
 *  @return NSArray<SwpShareModel *>
 */
+ (NSArray<SwpShareModel *> *)swpShareWihtGroup:(NSArray<NSDictionary *> *)dictionarys setTripartiteFrameworkShareTypes:(NSArray * _Nullable)tripartiteFrameworkShareTypes;

/**
 *  @author swp_song
 *
 *  @brief  swpShareSetShareType:setTripartiteFrameworkShareTypes:  ( 三方分享 Type 数据处理 )
 *
 *  @param  swpShares                       swpShares
 *
 *  @param  tripartiteFrameworkShareTypes   tripartiteFrameworkShareTypes
 *
 *  @return NSArray
 */
+ (NSArray<SwpShareModel *> *)swpShareSetShareType:(NSArray<SwpShareModel *> *)swpShares setTripartiteFrameworkShareTypes:(nullable NSArray *)tripartiteFrameworkShareTypes;

@end
NS_ASSUME_NONNULL_END

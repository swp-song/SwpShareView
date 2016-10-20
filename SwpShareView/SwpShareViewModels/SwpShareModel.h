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

/*! 分享 key        !*/
@property (nonatomic, copy, readonly) NSString *swpShareKey;
/*! 分享 title      !*/
@property (nonatomic, copy, readonly) NSString *swpShareTitle;
/*! 分享 ImageView  !*/
@property (nonatomic, copy, readonly) NSString *swpShareImageName;
/*! 友盟分享 type   !*/
@property (nonatomic, readonly) id swpTripartiteFrameworkShareType;

/**!
 *  @ author swp_song
 *
 *  @ brief  swpShareWihtDictionary:    ( 数据处理 )
 *
 *  @ param  dictionary
 *
 *  @ return SwpShareModel
 */
+ (instancetype)swpShareWihtDictionary:(NSDictionary *)dictionary;

/**!
 *  @ author swp_song
 *
 *  @ brief  initWithDictionary:    ( 数据处理 )
 *
 *  @ param  dictionary
 *
 *  @ return SwpShareModel
 */
- (instancetype)initWithDictionary:(NSDictionary *)dictionary;

/**!
 *  @ author swp_song
 *
 *  @ brief  swpShareWithShareKey:setSwpShareTitle:setSwpShareImageName:setSwpTripartiteFrameworkShareType:    ( 数据处理 )
 *
 *  @ param  swpShareKey
 *
 *  @ param  swpShareTitle
 *
 *  @ param  swpShareImageName
 *
 *  @ param  swpTripartiteFrameworkShareType
 *
 *  @ return SwpShareModel
 */
+ (instancetype)swpShareWithShareKey:(NSString *)swpShareKey setSwpShareTitle:(nullable NSString *)swpShareTitle setSwpShareImageName:(nullable NSString *)swpShareImageName setSwpTripartiteFrameworkShareType:(nullable id)swpTripartiteFrameworkShareType;

/**!
 *  @ brief  swpShareWithSwpShare:setSwpTripartiteFrameworkShareType:    ( 数据处理 )
 *
 *  @ param  swpShare
 *
 *  @ param  swpTripartiteFrameworkShareType
 *
 *  @ return SwpShareModel
 */
+ (instancetype)swpShareWithSwpShare:(SwpShareModel *)swpShare setSwpTripartiteFrameworkShareType:(nullable id)swpTripartiteFrameworkShareType;

/**
 *  @ author swp_song
 *
 *  @ brief  swpShareWihtGroup: ( 数据处理 < 一组 > )
 *
 *  @ param  dictionary
 *
 *  @ return NSArray<SwpShareModel *>
 */
+ (NSArray<SwpShareModel *> *)swpShareWihtGroup:(NSArray<NSDictionary *> *)dictionarys;

/**!
 *  @ author swp_song
 *
 *  @ brief  swpShareWihtGroup:setTripartiteFrameworkShareTypes: ( 数据处理 < 一组 > )
 *
 *  @ param  dictionarys
 *
 *  @ param  tripartiteFrameworkShareTypes
 *
 *  @ return NSArray<SwpShareModel *>
 */
+ (NSArray<SwpShareModel *> *)swpShareWihtGroup:(NSArray<NSDictionary *> *)dictionarys setTripartiteFrameworkShareTypes:(nullable NSArray *)tripartiteFrameworkShareTypes;

/**!
 *  @ author swp_song
 *
 *  @ brief  swpShareSetShareType:setTripartiteFrameworkShareTypes: ( 三方分享 Type 数据 处理 )
 *
 *  @ param  swpShares
 *
 *  @ param  tripartiteFrameworkShareTypes
 *
 *  @ return NSArray<SwpShareModel *> *
 */
+ (NSArray<SwpShareModel *> *)swpShareSetShareType:(NSArray<SwpShareModel *> *)swpShares setTripartiteFrameworkShareTypes:(nullable NSArray *)tripartiteFrameworkShareTypes;

@end
NS_ASSUME_NONNULL_END

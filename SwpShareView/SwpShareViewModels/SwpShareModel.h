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

/**!
 *  @ author swp_song
 *
 *  @ brief  swpShareWithShareKey:setSwpShareTitle:setSwpShareImageName:    ( 数据处理 )
 *
 *  @ param  swpShareKey
 *
 *  @ param  swpShareTitle
 *
 *  @ param  swpShareImageName
 *
 *  @ return SwpShareModel
 */
+ (instancetype)swpShareWithShareKey:(NSString *)swpShareKey setSwpShareTitle:(NSString *)swpShareTitle setSwpShareImageName:(NSString *)swpShareImageName;
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

@end
NS_ASSUME_NONNULL_END

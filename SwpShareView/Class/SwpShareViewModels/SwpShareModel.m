//
//  SwpShareModel.m
//  swp_song
//
//  Created by swp_song on 2016/9/30.
//  Copyright © 2016年 swp_song. All rights reserved.
//

#import "SwpShareModel.h"

@implementation SwpShareModel

/**
 *  @author swp_song
 *
 *  @brief  swpShareWihtDictionary: ( 数据处理 )
 *
 *  @param  dictionary  dictionary
 *
 *  @return SwpShareModel
 */
+ (instancetype)swpShareWihtDictionary:(NSDictionary *)dictionary {
    return [[self alloc] initWithDictionary:dictionary];
}

/**
 *  @author swp_song
 *
 *  @brief  initWithDictionary: ( 数据处理 )
 *
 *  @param  dictionary  dictionary
 *
 *  @return SwpShareModel
 */
- (instancetype)initWithDictionary:(NSDictionary *)dictionary {
    
    if (self = [super init]) {
        _swpShareKey              = dictionary[@"SwpShare_1"];
        _swpShareTitle            = dictionary[@"SwpShare_2"];
        _swpShareImageName        = dictionary[@"SwpShare_3"];
        _swpShareCanOpenURLString = dictionary[@"SwpShare_4"];
        _swpShareEnabled          = YES;
    }
    return self;
}


/**
 *  @author swp_song
 *
 *  @brief  swpShareWithShareKey:setSwpShareTitle:setSwpShareTitle:setSwpShareImageName:setSwpTripartiteFrameworkShareType:setSwpShareCanOpenURLString:setSwpShareEnabled:    ( 快速初始化 )
 *
 *  @param swpShareKey                      swpShareKey
 *
 *  @param swpShareTitle                    swpShareTitle
 *
 *  @param swpShareImageName                swpShareImageName
 *
 *  @param swpTripartiteFrameworkShareType  swpTripartiteFrameworkShareType
 *
 *  @param swpShareCanOpenURLString         swpShareCanOpenURLString
 *
 *  @param swpShareEnabled                  swpShareEnabled
 *
 *  @return                                 SwpShareModel
 */
+ (instancetype)swpShareWithShareKey:(NSString *)swpShareKey setSwpShareTitle:(NSString *)swpShareTitle setSwpShareImageName:(NSString *)swpShareImageName setSwpTripartiteFrameworkShareType:(id)swpTripartiteFrameworkShareType setSwpShareCanOpenURLString:(NSString *)swpShareCanOpenURLString setSwpShareEnabled:(BOOL)swpShareEnabled {
    swpShareTitle     = swpShareTitle     || swpShareTitle.length     ? swpShareTitle     : @"标题";
    swpShareImageName = swpShareImageName || swpShareImageName.length ? swpShareImageName : @"SwpShareView.bundle/share_default";
    return [[SwpShareModel alloc] initWithShareKey:swpShareKey setSwpShareTitle:swpShareTitle setSwpShareImageName:swpShareImageName setSwpTripartiteFrameworkShareType:swpTripartiteFrameworkShareType setSwpShareCanOpenURLString:swpShareCanOpenURLString setSwpShareEnabled:swpShareEnabled];
}

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
+ (instancetype)swpShareWithShareKey:(NSString *)swpShareKey setSwpShareTitle:(NSString *)swpShareTitle setSwpShareImageName:(NSString *)swpShareImageName setSwpTripartiteFrameworkShareType:(id)swpTripartiteFrameworkShareType {
    return [[self class] swpShareWithShareKey:swpShareKey setSwpShareTitle:swpShareTitle setSwpShareImageName:swpShareImageName setSwpTripartiteFrameworkShareType:swpTripartiteFrameworkShareType setSwpShareCanOpenURLString:nil setSwpShareEnabled:YES];
}

/**
 *  @brief  swpShareWithSwpShare:setSwpTripartiteFrameworkShareType:    ( 数据处理，设置三方分享 key )
 *
 *  @param  swpShare                            swpShare
 *
 *  @param  swpTripartiteFrameworkShareType     swpTripartiteFrameworkShareType
 *
 *  @return SwpShareModel                       SwpShareModel
 */
+ (instancetype)swpShareWithSwpShare:(SwpShareModel *)swpShare setSwpTripartiteFrameworkShareType:(id)swpTripartiteFrameworkShareType {
    return [[self class] swpShareWithShareKey:swpShare.swpShareKey setSwpShareTitle:swpShare.swpShareTitle setSwpShareImageName:swpShare.swpShareImageName setSwpTripartiteFrameworkShareType:swpTripartiteFrameworkShareType setSwpShareCanOpenURLString:swpShare.swpShareCanOpenURLString setSwpShareEnabled:swpShare.swpShareEnabled];
}

/**
 *  @brief  swpShareWithSwpShare:setSwpShareEnabled:    ( 数据处理，设置是否启用 item )
 *
 *  @param  swpShare        swpShare
 *
 *  @param  swpShareEnabled swpShareEnabled
 *
 *  @return SwpShareModel 
 */
+ (instancetype)swpShareWithSwpShare:(SwpShareModel *)swpShare setSwpShareEnabled:(BOOL)swpShareEnabled {
    return [[self class] swpShareWithShareKey:swpShare.swpShareKey setSwpShareTitle:swpShare.swpShareTitle setSwpShareImageName:swpShare.swpShareImageName setSwpTripartiteFrameworkShareType:swpShare.swpTripartiteFrameworkShareType setSwpShareCanOpenURLString:nil setSwpShareEnabled:swpShareEnabled];
}

/**
 *  @author swp_song
 *
 *  @brief  initWithShareKey:setSwpShareTitle:setSwpShareImageName:setSwpTripartiteFrameworkShareType:  ( 数据处理 )
 *
 *  @param  swpShareKey                     swpShareKey
 *
 *  @param  swpShareTitle                   swpShareTitle
 *
 *  @param  swpShareImageName               swpShareImageName
 *
 *  @param  swpTripartiteFrameworkShareType swpTripartiteFrameworkShareType
 *
 *  @param  swpShareCanOpenURLString        swpShareCanOpenURLString
 *
 *  @param  swpShareEnabled                 swpShareEnabled
 *
 *  @return SwpShareModel
 */
- (instancetype)initWithShareKey:(NSString *)swpShareKey setSwpShareTitle:(NSString *)swpShareTitle setSwpShareImageName:(NSString *)swpShareImageName setSwpTripartiteFrameworkShareType:(id)swpTripartiteFrameworkShareType setSwpShareCanOpenURLString:(NSString *)swpShareCanOpenURLString setSwpShareEnabled:(BOOL)swpShareEnabled {
    
    if (self = [super init]) {
        _swpShareKey                      = swpShareKey;
        _swpShareTitle                    = swpShareTitle;
        _swpShareImageName                = swpShareImageName;
        _swpTripartiteFrameworkShareType  = swpTripartiteFrameworkShareType;
        _swpShareCanOpenURLString         = swpShareCanOpenURLString;
        _swpShareEnabled                  = swpShareEnabled;
    }
    return self;
}


/**
 *  @author swp_song
 *
 *  @brief  swpShareWihtGroup:  ( 数据处理 < 一组 > )
 *
 *  @param  dictionarys     dictionarys
 *
 *  @return NSArray<SwpShareModel *>
 */
+ (NSArray<SwpShareModel *> *)swpShareWihtGroup:(NSArray<NSDictionary *> *)dictionarys {
    return [[self class] swpShareWihtGroup:dictionarys setTripartiteFrameworkShareTypes:nil];
}


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
+ (NSArray<SwpShareModel *> *)swpShareWihtGroup:(NSArray<NSDictionary *> *)dictionarys setTripartiteFrameworkShareTypes:(NSArray *)tripartiteFrameworkShareTypes {
    NSMutableArray *models = [NSMutableArray array];
    [dictionarys enumerateObjectsUsingBlock:^(NSDictionary * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        [models addObject:[[self class] swpShareWihtDictionary:obj]];
    }];
    return [[self class] swpShareSetShareType:models setTripartiteFrameworkShareTypes:tripartiteFrameworkShareTypes].copy;
}


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
+ (NSArray<SwpShareModel *> *)swpShareSetShareType:(NSArray<SwpShareModel *> *)swpShares setTripartiteFrameworkShareTypes:(NSArray *)tripartiteFrameworkShareTypes {
    if (swpShares.count != tripartiteFrameworkShareTypes.count || !tripartiteFrameworkShareTypes) return swpShares;
    NSMutableArray *models = [NSMutableArray array];
    [swpShares enumerateObjectsUsingBlock:^(SwpShareModel * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        id tripartiteFrameworkShareType = tripartiteFrameworkShareTypes[idx];
        [models addObject:[[self class] swpShareWithSwpShare:obj setSwpTripartiteFrameworkShareType:tripartiteFrameworkShareType]];
    }];
    return models;
}

@end

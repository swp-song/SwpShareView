//
//  SwpShareModel.m
//  swp_song
//
//  Created by swp_song on 2016/9/30.
//  Copyright © 2016年 swp_song. All rights reserved.
//

#import "SwpShareModel.h"

@implementation SwpShareModel


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
 *  @ param  swpUMShareType
 *
 *  @ return SwpShareModel
 */
+ (instancetype)swpShareWithShareKey:(NSString *)swpShareKey setSwpShareTitle:(NSString *)swpShareTitle setSwpShareImageName:(NSString *)swpShareImageName setSwpUMShareType:(NSInteger)swpUMShareType {
    return [[SwpShareModel alloc] initWithShareKey:swpShareKey setSwpShareTitle:swpShareTitle setSwpShareImageName:swpShareImageName setSwpUMShareType:swpUMShareType];
}

/**!
 *  @ author swp_song
 *
 *  @ brief  initWithShareKey:setSwpShareTitle:setSwpShareImageName:    ( 数据处理 )
 *
 *  @ param  swpShareKey
 *
 *  @ param  swpShareTitle
 *
 *  @ param  swpShareImageName
 *
 *  @ param  swpUMShareType
 *
 *  @ return SwpShareModel
 */
- (instancetype)initWithShareKey:(NSString *)swpShareKey setSwpShareTitle:(NSString *)swpShareTitle setSwpShareImageName:(NSString *)swpShareImageName setSwpUMShareType:(NSInteger)swpUMShareType {

    if (self = [super init]) {
        _swpShareKey       = swpShareKey;
        _swpShareTitle     = swpShareTitle;
        _swpShareImageName = swpShareImageName;
        _swpUMShareType    = swpUMShareType;
    }
    return self;
}

/**!
 *  @ author swp_song
 *
 *  @ brief  swpShareWihtDictionary:    ( 数据处理 )
 *
 *  @ param  dictionary
 *
 *  @ return SwpShareModel
 */
+ (instancetype)swpShareWihtDictionary:(NSDictionary *)dictionary {
    return [[self alloc] initWithDictionary:dictionary];
}

/**!
 *  @ author swp_song
 *
 *  @ brief  initWithDictionary:    ( 数据处理 )
 *
 *  @ param  dictionary
 *
 *  @ return SwpShareModel
 */
- (instancetype)initWithDictionary:(NSDictionary *)dictionary {
    
    if (self = [super init]) {
        _swpShareKey       = dictionary[@"SwpShare_1"];
        _swpShareTitle     = dictionary[@"SwpShare_2"];
        _swpShareImageName = dictionary[@"SwpShare_3"];
    }
    return self;
}

/**!
 *  @ author swp_song
 *
 *  @ brief  swpShareWihtGroup: ( 数据处理 < 一组 > )
 *
 *  @ param  dictionary
 *
 *  @ return NSArray<SwpShareModel *>
 */
+ (NSArray<SwpShareModel *> *)swpShareWihtGroup:(NSArray<NSDictionary *> *)dictionarys {
    return [[self class] swpShareWihtGroup:dictionarys setUMType:@[]];
}



/**!
 *  @ author swp_song
 *
 *  @ brief  swpShareWihtGroup:setUMType:   ( 数据处理 < 一组 > )
 *
 *  @ param  dictionary
 *
 *  @ param  umTypes
 *
 *  @ return NSArray<SwpShareModel *> *
 */
+ (NSArray<SwpShareModel *> *)swpShareWihtGroup:(NSArray<NSDictionary *> *)dictionarys setUMType:(NSArray<NSNumber *> *)umTypes {
    NSMutableArray *models = [NSMutableArray array];
    [dictionarys enumerateObjectsUsingBlock:^(NSDictionary * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        [models addObject:[[self class] swpShareWihtDictionary:obj]];
    }];
    return [[self class] swpShareSetUMType:models setUMType:umTypes];
}


/**!
 *  @ author swp_song
 *
 *  @ brief  swpShareSetUMType:setUMType:   ( 设置 UM 分享 type )
 *
 *  @ param  swpShares
 *
 *  @ param  umTypes
 *
 *  @ return NSArray<SwpShareModel *> *
 */
+ (NSArray<SwpShareModel *> *)swpShareSetUMType:(NSArray<SwpShareModel *> *)swpShares setUMType:(NSArray<NSNumber *> *)umTypes {
    if (swpShares.count != umTypes.count) return swpShares;
    NSMutableArray<SwpShareModel *> *models = [NSMutableArray array];
    [swpShares enumerateObjectsUsingBlock:^(SwpShareModel * _Nonnull swpShare, NSUInteger idx, BOOL * _Nonnull stop) {
        [models addObject:[SwpShareModel swpShareWithShareKey:swpShare.swpShareKey setSwpShareTitle:swpShare.swpShareTitle setSwpShareImageName:swpShare.swpShareImageName setSwpUMShareType:umTypes[idx].integerValue]];
    }];
    return models.copy;
}

@end

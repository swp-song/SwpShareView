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

@property (nonatomic, copy) NSString *swpShareKey;

@property (nonatomic, copy) NSString *swpShareTitle;

@property (nonatomic, copy) NSString *swpShareImageName;

+ (instancetype)swpShareWihtDictionary:(NSDictionary *)dictionary;
- (instancetype)initWithDictionary:(NSDictionary *)dictionary;
+ (NSArray<SwpShareModel *> *)swpShareWihtGroup:(NSArray<NSDictionary *> *)dictionarys;

@end
NS_ASSUME_NONNULL_END

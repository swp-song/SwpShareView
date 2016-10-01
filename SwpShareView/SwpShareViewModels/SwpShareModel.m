//
//  SwpShareModel.m
//  swp_song
//
//  Created by swp_song on 2016/9/30.
//  Copyright © 2016年 swp_song. All rights reserved.
//

#import "SwpShareModel.h"

@implementation SwpShareModel


+ (instancetype)swpShareWihtDictionary:(NSDictionary *)dictionary {
    return [[self alloc] initWithDictionary:dictionary];
}
- (instancetype)initWithDictionary:(NSDictionary *)dictionary {
    
    if (self = [super init]) {
        _swpShareKey       = dictionary[@"SwpShare_1"];
        _swpShareTitle     = dictionary[@"SwpShare_2"];
        _swpShareImageName = dictionary[@"SwpShare_3"];
    }
    return self;
}
+ (NSArray<SwpShareModel *> *)swpShareWihtGroup:(NSArray<NSDictionary *> *)dictionarys {
    
    NSMutableArray *models = [NSMutableArray array];
    
    [dictionarys enumerateObjectsUsingBlock:^(NSDictionary * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        [models addObject:[[self class] swpShareWihtDictionary:obj]];
    }];
    return models.copy;
}

@end

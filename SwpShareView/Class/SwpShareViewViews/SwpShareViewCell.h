//
//  SwpShareViewCell.h
//  swp_song
//
//  Created by swp_song on 2016/10/1.
//  Copyright © 2016年 swp_song. All rights reserved.
//

#import <UIKit/UIKit.h>

@class SwpShareModel;

NS_ASSUME_NONNULL_BEGIN

@interface SwpShareViewCell : UICollectionViewCell

/* 分享数据模型 */
@property (nonatomic, strong) SwpShareModel *swpShare;

@end
NS_ASSUME_NONNULL_END

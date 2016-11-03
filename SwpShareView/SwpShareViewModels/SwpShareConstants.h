//
//  SwpShareConstants.h
//  swp_song
//
//  Created by swp_song on 2016/10/1.
//  Copyright © 2016年 swp_song. All rights reserved.
//

#import <Foundation/Foundation.h>

#ifdef __cplusplus
    #define SWPKIT_EXTERN   extern "C" __attribute__((visibility ("default")))
#else
    #define SWPKIT_EXTERN   extern __attribute__((visibility ("default")))
#endif

NS_ASSUME_NONNULL_BEGIN

@interface SwpShareConstants : NSObject


/*! 分享到 QQ            !*/
SWPKIT_EXTERN NSString * const SwpShareToQQ;
/*! 分享到 QQ key        !*/
SWPKIT_EXTERN NSString * const SwpShareToQQKey;

/*! 分享到 QQ空间         !*/
SWPKIT_EXTERN NSString * const SwpShareToQzone;
/*! 分享到 QQ空间 key     !*/
SWPKIT_EXTERN NSString * const SwpShareToQzoneKey;

/*! 分享到 腾讯微博        !*/
SWPKIT_EXTERN NSString * const SwpShareToTencent;
/*! 分享到 腾讯微博 key    !*/
SWPKIT_EXTERN NSString * const SwpShareToTencentKey;

/*! 分享到 微信好友        !*/
SWPKIT_EXTERN NSString * const SwpShareToWechatSession;
/*! 分享到 微信好友 key    !*/
SWPKIT_EXTERN NSString * const SwpShareToWechatSessionKey;

/*! 分享到 微信朋友圈       !*/
SWPKIT_EXTERN NSString * const SwpShareToWechatTimeline;
/*! 分享到 微信朋友圈 key   !*/
SWPKIT_EXTERN NSString * const SwpShareToWechatTimelineKey;

/*! 分享到 新浪微博         !*/
SWPKIT_EXTERN NSString * const SwpShareToSina;
/*! 分享到 新浪微博 key     !*/
SWPKIT_EXTERN NSString * const SwpShareToSinaKey;

/*! 分享到 复制链接         !*/
SWPKIT_EXTERN NSString * const SwpShareToCopyURL;
/*! 分享到 复制链接 key     !*/
SWPKIT_EXTERN NSString * const SwpShareToCopyURLKey;

@end
NS_ASSUME_NONNULL_END

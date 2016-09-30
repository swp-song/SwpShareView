//
//  SwpShareView.h
//  PalmHeCheng
//
//  Created by swp_song on 2016/9/28.
//  Copyright © 2016年 songweipng. All rights reserved.
//

#import <UIKit/UIKit.h>

//UIKIT_EXTERN NSString * const SwpShareQQ;
NS_ASSUME_NONNULL_BEGIN

@interface SwpShareView : UIView

+ (void)swpShareViewShowWithData:(NSArray *)shareData;

@end

UIKIT_EXTERN NSString * const SwpShareToQQ;
UIKIT_EXTERN NSString * const SwpShareToQzone;
UIKIT_EXTERN NSString * const SwpShareToTencent;
UIKIT_EXTERN NSString * const SwpShareToWechatSession;
UIKIT_EXTERN NSString * const SwpShareToWechatTimeline;
UIKIT_EXTERN NSString * const SwpShareToToSina;



NS_ASSUME_NONNULL_END

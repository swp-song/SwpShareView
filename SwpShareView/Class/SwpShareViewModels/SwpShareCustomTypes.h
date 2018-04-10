//
//  SwpShareCustomTypes.h
//  SwpShareViewDemo
//
//  Created by swp_song on 2016/11/3.
//  Copyright © 2016年 swp_song. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN


/**
 - SwpShareItemTypeNormal:      全部显示
 - SwpShareItemTypeHide:        未安装 App 隐藏
 - SwpShareItemTypeEnabled:     未安装 App 禁止点击
 */
typedef NS_ENUM(NSInteger, SwpShareItemType) {
    
    SwpShareItemTypeNormal = 0,
    SwpShareItemTypeHide,
    SwpShareItemTypeEnabled,
};

NS_ASSUME_NONNULL_END

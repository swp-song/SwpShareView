//
//  SwpShareViewCell.m
//  SwpShareViewDemo
//
//  Created by swp_song on 2016/10/1.
//  Copyright © 2016年 swp_song. All rights reserved.
//

#import "SwpShareViewCell.h"

/*! ---------------------- Tool       ---------------------- !*/
#import "SwpShareViewTools.h"               //  工具
#import "UIView+SwpShareView.h"             //  View 分类
/*! ---------------------- Tool       ---------------------- !*/

/*! ---------------------- Controller ---------------------- !*/
/*! ---------------------- Controller ---------------------- !*/

/*! ---------------------- View       ---------------------- !*/
/*! ---------------------- View       ---------------------- !*/

/*! ---------------------- Model      ---------------------- !*/
#import "SwpShareModel.h"                   //  分享 数据模型
/*! ---------------------- Model      ---------------------- !*/

@interface SwpShareViewCell ()

#pragma mark - UI   Propertys
/*! ---------------------- UI   Property  ---------------------- !*/
/*! 显示 分享 图片 view !*/
@property (nonatomic, strong) UILabel     *swpShareTitleView;
/*! 显示 分享 文字 view !*/
@property (nonatomic, strong) UIImageView *swpShareImageView;
/*! ---------------------- UI   Property  ---------------------- !*/

#pragma mark - Data Propertys
/*! ---------------------- Data Property  ---------------------- !*/

/*! ---------------------- Data Property  ---------------------- !*/

@end

@implementation SwpShareViewCell

/**!
 *  @ author swp_song
 *
 *  @ brief  initWithFrame:  ( Override Init )
 *
 *  @ param  frame
 *
 *  @ return SwpShareViewCell
 */
- (instancetype)initWithFrame:(CGRect)frame {
    
    if (self = [super initWithFrame:frame]) {
        [self setUpUI];
        [self setUIFrame:frame];
    }
    return self;
}


/**!
 *  @ author swp_song
 *
 *  @ brief  setUpUI ( 添加控件 )
 */
- (void)setUpUI {
    
    [self.contentView addSubview:self.swpShareTitleView];
    [self.contentView addSubview:self.swpShareImageView];
}

/**!
 *  @ author swp_song
 *
 *  @ brief  setUIFrame ( 设置控件的自动布局 )
 */
- (void)setUIFrame:(CGRect)frame {
    _swpShareImageView.frame = CGRectMake(5, 5, self.contentView.width - 10, self.contentView.width - 10);
    _swpShareTitleView.frame = CGRectMake(0, self.contentView.height - 20, self.contentView.width, 20);
    
}

#pragma mark - Public Methods

/**!
 *  @ author swp_song
 *
 *  @ brief  setSwpShare:   ( Override Setter )
 *
 *  @ param  swpShare
 */
- (void)setSwpShare:(SwpShareModel *)swpShare {
    _swpShare               = swpShare;
    _swpShareTitleView.text = swpShare.swpShareTitle;
    [self setSetStyles:swpShare];
    
}


/**!
 *  @ author swp_song
 *
 *  @ brief  setSetStyles:  ( 设置 文字 和 图片 样式 )
 *
 *  @ param  swpShare
 */
- (void)setSetStyles:(SwpShareModel *)swpShare {
 
    if (swpShare.isSwpShareEnabled) {
        _swpShareTitleView.textColor = [UIColor blackColor];
        _swpShareImageView.image     = [UIImage imageNamed:swpShare.swpShareImageName];
    } else {
        _swpShareTitleView.textColor = [UIColor lightGrayColor];
        _swpShareImageView.image     = [UIImage imageNamed:[NSString stringWithFormat:@"%@_no", swpShare.swpShareImageName]];
    }
}


#pragma mark - Init UI Methods
- (UILabel *)swpShareTitleView {
    
    return !_swpShareTitleView ? _swpShareTitleView = ({
        UILabel *label      = [UILabel new];
        label.textAlignment = NSTextAlignmentCenter;
        [SwpShareViewTools swpShareViewToolsSetLabelWith:label setTitle:nil setFontSize:12 setTitleColor:nil];
        label;
    }) : _swpShareTitleView;
}

- (UIImageView *)swpShareImageView {
    return !_swpShareImageView ? _swpShareImageView = ({
        UIImageView *imageView = [UIImageView new];
        imageView;
    }) : _swpShareImageView;
}

@end


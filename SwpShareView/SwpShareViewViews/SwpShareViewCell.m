//
//  SwpShareViewCell.m
//  SwpShareViewDemo
//
//  Created by swp_song on 2016/10/1.
//  Copyright © 2016年 swp_song. All rights reserved.
//

#import "SwpShareViewCell.h"

#import "UIView+SwpShareView.h"
#import "SwpShareViewTools.h"

#import "SwpShareModel.h"


@interface SwpShareViewCell ()
@property (nonatomic, strong) UILabel     *swpShareTitleView;
@property (nonatomic, strong) UIImageView *swpShareImageView;

@end


@implementation SwpShareViewCell



- (instancetype)initWithFrame:(CGRect)frame {
    
    if (self = [super initWithFrame:frame]) {
        [self setUpUI];
        [self setUIFrame:frame];
    }
    return self;
}



/*!
 *  @ author swp_song
 *
 *  @ brief  setUpUI ( 添加控件 )
 */
- (void)setUpUI {
    
    [self.contentView addSubview:self.swpShareTitleView];
    [self.contentView addSubview:self.swpShareImageView];
}

/*!
 *  @ author swp_song
 *
 *  @ brief  setUIAutoLayout ( 设置控件的自动布局 )
 */
- (void)setUIFrame:(CGRect)frame {
    
    _swpShareImageView.frame = CGRectMake(5, 5, self.contentView.width - 10, self.contentView.width - 10);
    _swpShareTitleView.frame = CGRectMake(0, self.contentView.height - 20, self.contentView.width, 20);
    
}

- (void)setSwpShare:(SwpShareModel *)swpShare {
    _swpShare                    = swpShare;
    self.swpShareTitleView.text  = swpShare.swpShareTitle;
    self.swpShareImageView.image = [UIImage imageNamed:swpShare.swpShareImageName];
}


- (UILabel *)swpShareTitleView {
    
    return !_swpShareTitleView ? _swpShareTitleView = ({
        UILabel *label = [UILabel new];
        [SwpShareViewTools swpShareViewToolsSetLabelWith:label setTitle:nil setFontSize:12 setTitleColor:nil];
        label.layer.borderWidth = 1;
        label.textAlignment     = NSTextAlignmentCenter;
        label;
    }) : _swpShareTitleView;
}

- (UIImageView *)swpShareImageView {
    
    return !_swpShareImageView ? _swpShareImageView = ({
        UIImageView *imageView      = [UIImageView new];
        imageView.layer.borderWidth = 1;
        imageView;
    }) : _swpShareImageView;
}

@end


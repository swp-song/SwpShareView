//
//  SwpShareViewCell.m
//  PalmHeCheng
//
//  Created by swp_song on 2016/9/28.
//  Copyright © 2016年 songweipng. All rights reserved.
//

#import "SwpShareViewCell.h"


#import "SwpShareViewTools.h"

#import "SwpShareModel.h"



@interface SwpShareViewCell ()

@property (nonatomic, weak) IBOutlet UIImageView *swpShareImageView;
@property (nonatomic, weak) IBOutlet UILabel     *swpShareTitleView;


@end

@implementation SwpShareViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (instancetype)initWithFrame:(CGRect)frame {
    
    if (self = [super initWithFrame:frame]) {
    
        self.layer.borderWidth = 0.5;
        self.layer.borderColor = [UIColor lightGrayColor].CGColor;
        self                   = [[NSBundle mainBundle] loadNibNamed:NSStringFromClass([SwpShareViewCell class]) owner:nil options:nil].lastObject;
        [SwpShareViewTools swpShareViewToolsSetLabelWith:self.swpShareTitleView setTitle:nil setFontSize:12 setTitleColor:nil];
        
    }
    return self;
}

- (void)setSwpShare:(SwpShareModel *)swpShare {
    _swpShare                    = swpShare;
    self.swpShareTitleView.text  = swpShare.swpShareTitle;
    self.swpShareImageView.image = [UIImage imageNamed:swpShare.swpShareImageName];
}

@end

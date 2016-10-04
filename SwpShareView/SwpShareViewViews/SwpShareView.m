//
//  SwpShareView.m
//  swp_song
//
//  Created by swp_song on 2016/9/28.
//  Copyright © 2016年 swp_song. All rights reserved.
//

#import "SwpShareView.h"


/*! ---------------------- Tool       ---------------------- !*/
#import "SwpShareViewTools.h"               //  工具
#import "UIView+SwpShareView.h"             //  View 分类
/*! ---------------------- Tool       ---------------------- !*/

/*! ---------------------- Controller ---------------------- !*/
/*! ---------------------- Controller ---------------------- !*/

/*! ---------------------- View       ---------------------- !*/
#import "SwpShareListView.h"
#import "SwpShareViewCell.h"                //  显示分享cell
/*! ---------------------- View       ---------------------- !*/

/*! ---------------------- Model      ---------------------- !*/
#import "SwpShareModel.h"                   //  分享 数据模型
/*! ---------------------- Model      ---------------------- !*/


static NSString * const kSwpShareViewCellID = @"swpShareViewCellID";

@interface SwpShareView () <SwpShareListViewDelegate>

#pragma mark - UI   Propertys
/*! ---------------------- UI   Property  ---------------------- !*/
/*! 显示 分享 titleView !*/
@property (nonatomic, strong) UILabel                    *swpShareTitleView;
/*! 显示 分享 view      !*/
@property (nonatomic, strong) SwpShareListView           *swpShareListView;
/*! 显示 关闭 页面 按钮 !*/
@property (nonatomic, strong) UIButton                   *swpShareCloseButton;
/*! ---------------------- UI   Property  ---------------------- !*/

#pragma mark - Data Propertys
/*! ---------------------- Data Property  ---------------------- !*/
/*! 显示 分享 数据源    !*/
@property (nonatomic, copy )  NSArray<SwpShareModel *>     *swpShares;
@property (nonatomic, copy, setter = swpShareListViewDidSelectIndex:) void(^swpShareListViewDidSelectIndex)(SwpShareView *swpShareView, NSInteger didSelectIndex, NSString *swpShareKey);
/*! ---------------------- Data Property  ---------------------- !*/

@end

@implementation SwpShareView

/**!
 *  @ author swp_song
 *
 *  @ brief  initWithFrame:  ( Override Init )
 *
 *  @ param  frame
 *
 *  @ return SwpShareView
 */
- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        self.backgroundColor = [[UIColor whiteColor] colorWithAlphaComponent:1];
        
        [self setUpUI];
    }
    return self;
}

/**!
 *  @ author swp_song
 *
 *  @ brief  setFrame:  ( Override setFrame )
 *
 *  @ param  frame
 */
- (void)setFrame:(CGRect)frame {
    [super setFrame:[SwpShareViewTools swpShareViewToolsCheckFrame:frame]];
}

- (void)dealloc {
    NSLog(@"%s", __FUNCTION__);
}

#pragma mark - Public Methods

/**!
 *  @ author swp_song
 *
 *  @ brief  swpShareViewShowWithData: ( 显示 控件 )
 *
 *  @ param  shareData
 *
 *  @ return SwpShareView
 */
+ (instancetype)swpShareViewShowWithData:(NSArray<NSString *> *)shareData {
    return [[self class] swpShareViewShowWithData:shareData setDelegate:nil];
}

/**!
 *  @ author swp_song
 *
 *  @ brief  swpShareViewShowWithData: ( 显示 控件 )
 *
 *  @ param  shareData
 *
 *  @ param  delegate
 *
 *  @ return SwpShareView
 */
+ (instancetype)swpShareViewShowWithData:(NSArray<NSString *> *)shareData setDelegate:(id<SwpShareViewDelegate>)delegate {
    SwpShareView *swpShareView = [SwpShareView initWithData:shareData];
    swpShareView.delegate      = delegate;
    return swpShareView;
}

/**!
 *  @ author swp_song
 *
 *  @ brief  swpShareListViewDidSelectIndex: ( 点击 每个 分下 回调 )
 *
 *  @ param  swpShareListViewDidSelectIndex
 */
- (void)swpShareListViewDidSelectIndex:(void (^)(SwpShareView *swpShareView, NSInteger didSelectIndex, NSString *swpShareKey))swpShareListViewDidSelectIndex {
    _swpShareListViewDidSelectIndex = swpShareListViewDidSelectIndex;
}

/**!
 *  @ author swp_song
 *
 *  @ brief  swpShareTitleSize: ( 设置 分享 title 字体 大小 )
 */
- (SwpShareView *(^)(CGFloat swpShareTitleSize))swpShareTitleSize {

    return ^SwpShareView *(CGFloat swpShareTitleSize) {
        _swpShareTitleView.font = [UIFont fontWithName:@"GillSans-Italic" size:swpShareTitleSize];
        return self;
    };
}

/**!
 *  @ author swp_song
 *
 *  @ brief  swpShareTitle: ( 设置 分享 title )
 */
- (SwpShareView *(^)(NSString *swpShareTitle))swpShareTitle {
    return ^SwpShareView *(NSString *swpShareTitle) {
        _swpShareTitleView.text = swpShareTitle;
        return self;
    };
}

/**
 *  @ author swp_song
 *
 *  @ brief  swpShareTitle: ( 设置 分享 字体 颜色 )
 */
- (SwpShareView *(^)(UIColor *swpShareTitleColor))swpShareTitleColor {
    return ^SwpShareView *(UIColor *swpShareTitleColor){
        _swpShareTitleView.textColor = swpShareTitleColor;
        return self;
    };
}

/**
 *  @ author swp_song
 *
 *  @ brief  swpShareTitleFont: ( 设置 分享 字体  )
 */
- (SwpShareView *(^)(UIFont *swpShareTitleFont))swpShareTitleFont {
    
    return ^SwpShareView *(UIFont *swpShareTitleFont) {
        _swpShareTitleView.font = swpShareTitleFont;
        return self;
    };
}


#pragma mark - Private Methods
/**!
 *  @ author swp_song
 *
 *  @ brief  setUpUI ( 添加控件 )
 */
- (void)setUpUI {

    [self addSubview:self.swpShareTitleView];
    [self addSubview:self.swpShareCloseButton];
    [self addSubview:self.swpShareListView];
}

static UIWindow *swpShareWindow_;

/**!
 *
 *  @ author swp_song
 *
 *  @ brief  initWithData: ( 显示 控件 )
 *
 *  @ param  shareData
 *
 *  @ return SwpShareView
 */
+ (instancetype)initWithData:(NSArray<NSString *> *)shareData {
    swpShareWindow_                 = [[UIWindow alloc] initWithFrame:[SwpShareViewTools swpShareViewToolsMainScreen]];
    swpShareWindow_.hidden          = NO;
    swpShareWindow_.backgroundColor = [[UIColor blackColor] colorWithAlphaComponent:0.6];
    
    SwpShareView *swpShareView      = [[SwpShareView alloc] initWithFrame:CGRectMake(0, 0, 1000, 300)];
    swpShareView.swpShares          = [SwpShareModel swpShareWihtGroup:[SwpShareViewTools swpShareViewToolsDataProcessing:shareData]];
    [swpShareView swpShareViewShowAnimation];
    [swpShareWindow_ addSubview:swpShareView];
    return swpShareView;
}

/**!
 *  @ author swp_song
 *
 *  @ brief  didButton:   ( 按钮 点击 事件 )
 *
 *  @ param  button
 */
- (void)didButton:(UIButton *)button {
    [self swpShareViewHiddenAnimation];
}

/**!
 *  @ author swp_song
 *
 *  @ brief  swpShareViewShowAnimation: ( swpShareView 动画显示 )
 */
- (void)swpShareViewShowAnimation {
    [SwpShareViewTools swpShareViewToolsCenterAnimation:self setFromValue:CGPointMake(swpShareWindow_.centerX, swpShareWindow_.centerY - 1000) setToValue:swpShareWindow_.center animationCompletionBlock:nil];
}

/**!
 *  @ author swp_song
 *
 *  @ brief  swpShareViewHiddenAnimation: ( swpShareView 动画关闭 )
 */
- (void)swpShareViewHiddenAnimation {
    
    [SwpShareViewTools swpShareViewToolsAlphaAnimation:swpShareWindow_ setFromValue:1 setToValue:0 animationCompletionBlock:^(BOOL finished) {
        swpShareWindow_.hidden = YES;
        swpShareWindow_        = nil;
    }];
}

/**!
 *  @ author swp_song
 *
 *  @ brief  setSwpShares:  ( Override Setter )
 *
 *  @ param  swpShares
 */
- (void)setSwpShares:(NSArray<SwpShareModel *> *)swpShares {
    _swpShares = swpShares;
    _swpShareListView.swpShares(_swpShares);
}


#pragma mark - SwpShareListView Delegate Methods
/**!
 *  @ author swp_song
 *
 *  @ brief  swpShareListView:didSelectItemAtIndexPath:swpShare:swpShareKey ( swpShareListView 代理方法 点击 cell 时 调用 )
 *
 *  @ param  swpShareListView
 *
 *  @ param  indexPath
 *
 *  @ param  swpShare
 *
 *  @ param  swpShareKey
 */
- (void)swpShareListView:(SwpShareListView *)swpShareListView didSelectItemAtIndexPath:(NSIndexPath *)indexPath swpShare:(SwpShareModel *)swpShare swpShareKey:(NSString *)swpShareKey {

    if (self.swpShareListViewDidSelectIndex) self.swpShareListViewDidSelectIndex(self, indexPath.item, swpShareKey);
    
    if ([self.delegate respondsToSelector:@selector(swpShareView:didSelectIndex:swpShareKey:)]) {
        [self.delegate swpShareView:self didSelectIndex:indexPath.item swpShareKey:swpShareKey];
        
    }
    
    [self swpShareViewHiddenAnimation];
}


#pragma mark - Init UI Methods
- (UILabel *)swpShareTitleView {
    
    return !_swpShareTitleView ? _swpShareTitleView = ({
        UILabel *label        = [[UILabel alloc] initWithFrame:CGRectMake(20, 0, self.width, 40)];
        label.backgroundColor = [UIColor clearColor];

        [SwpShareViewTools swpShareViewToolsSetLabelWith:label setTitle:@"分享平台" setFontSize:14 setTitleColor:[UIColor redColor]];
        label;
    }) : _swpShareTitleView;
}

- (SwpShareListView *)swpShareListView {
    
    return !_swpShareListView ? _swpShareListView = ({
        SwpShareListView *swpShareListView        = [[SwpShareListView alloc] initSwpShareListViewWithFrame:CGRectMake(0, CGRectGetMaxY(self.swpShareTitleView.frame), self.width, self.height - self.swpShareCloseButton.height - self.swpShareTitleView.height - 20)];
        swpShareListView.swpShareListViewDelegate = self;
        swpShareListView;
    }) : _swpShareListView;
}

- (UIButton *)swpShareCloseButton {
    return !_swpShareCloseButton ? _swpShareCloseButton = ({
        UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
        button.frame     = CGRectMake((self.width / 2.0f) - (30.0 / 2.0), self.height - 30 - 10, 30, 30);
        [button addTarget:self action:@selector(didButton:) forControlEvents:UIControlEventTouchUpInside];
        [button setImage:[UIImage imageNamed:@"SwpShareView.bundle/share_close"] forState:UIControlStateNormal];
        [button setImage:[UIImage imageNamed:@"SwpShareView.bundle/share_close"] forState:UIControlStateHighlighted];
        button;
    }) : _swpShareCloseButton;
}


/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end

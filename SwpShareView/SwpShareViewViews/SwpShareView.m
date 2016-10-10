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
#import "SwpShareListView.h"                //  显示分享列表view
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

/*! cell 点击 回调     !*/
@property (nonatomic, copy, setter = swpShareListViewDidSelectIndexBlock:) void(^swpShareListViewDidSelectIndexBlock)(SwpShareView *swpShareView, NSInteger didSelectIndex, SwpShareModel *swpShare);

/*! SwpShareView 页面关闭回调   !*/
@property (nonatomic, copy, setter = swpShareViewCloseBlock:) void(^swpShareViewCloseBlock)(SwpShareView *swpShareView);

/*! 是否关闭分享view 回调        !*/
@property (nonatomic, copy, setter = swpShareViewWhetherCloseBlock:) BOOL(^swpShareViewWhetherCloseBlock)(SwpShareView *swpShareView);
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
 *  @ brief  swpShareViewShowWithData:setDelegate:  ( 显示 控件 并 设置 代理 )
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


/**
 *  @ author swp_song
 *
 *  @ brief  swpShareViewHidden:    ( 关闭 swpShareView  )
 */
- (SwpShareView *(^)())swpShareViewHidden {
    
    return ^SwpShareView *(){
        [self swpShareViewHiddenAnimation];
        return self;
    };
}

/**!
 *  @ author swp_song
 *
 *  @ brief  swpShareSetTripartiteFrameworkShareTypes    ( 设置 三方分享type )
 */
- (SwpShareView *(^)(NSArray *tripartiteFrameworkShareTypes))swpShareSetTripartiteFrameworkShareTypes {
    
    return ^SwpShareView *(NSArray *tripartiteFrameworkShareTypes) {
        
        self.swpShares = [SwpShareModel swpShareSetShareType:self.swpShares setTripartiteFrameworkShareTypes:tripartiteFrameworkShareTypes];
        self.swpShareListView.swpShares(self.swpShares);
        return self;
    };
}


/**!
 *  @ author swp_song
 *
 *  @ brief  swpShareViewWhetherCloseBlock: ( 是否 关闭 分享 页面 )
 *
 *  @ param  swpShareViewWhetherCloseBlock
 */
- (void)swpShareViewWhetherCloseBlock:(BOOL (^)(SwpShareView *swpShareView))swpShareViewWhetherCloseBlock {
    _swpShareViewWhetherCloseBlock = swpShareViewWhetherCloseBlock;
}

/**!
 *  @ author swp_song
 *
 *  @ brief  swpShareListViewDidSelectIndexBlock: ( swpShareView Block 点击 每个 分享图标 回调 )
 *
 *  @ param  swpShareListViewDidSelectIndexBlock
 */
- (void)swpShareListViewDidSelectIndexBlock:(void (^)(SwpShareView *swpShareView, NSInteger didSelectIndex, SwpShareModel *swpShare))swpShareListViewDidSelectIndexBlock {
    _swpShareListViewDidSelectIndexBlock = swpShareListViewDidSelectIndexBlock;
}

/**
 *  @ author swp_song
 *
 *  @ brief  swpShareViewCloseBlock: ( swpShareView Block 分享 页面 关闭之后调用 )
 *
 *  @ param swpShareViewCloseBlock
 */
- (void)swpShareViewCloseBlock:(void (^)(SwpShareView *swpShareView))swpShareViewCloseBlock {
    _swpShareViewCloseBlock = swpShareViewCloseBlock;
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
 *  @ param  umTypes
 *
 *  @ return SwpShareView
 */
+ (instancetype)initWithData:(NSArray<NSString *> *)shareData {
    swpShareWindow_                 = [[UIWindow alloc] initWithFrame:[SwpShareViewTools swpShareViewToolsMainScreen]];
    swpShareWindow_.hidden          = NO;
    swpShareWindow_.backgroundColor = [[UIColor blackColor] colorWithAlphaComponent:0.6];
    
    SwpShareView *swpShareView      = [[SwpShareView alloc] initWithFrame:[SwpShareViewTools swpShareViewToolsCalculateFrame:shareData.count viewWidth:1000]];
    
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
    
    __weak typeof(self)weakSelf = self;
    [SwpShareViewTools swpShareViewToolsAlphaAnimation:swpShareWindow_ setFromValue:1 setToValue:0 animationCompletionBlock:^(BOOL finished) {
        swpShareWindow_.hidden = YES;
        
        if (weakSelf.swpShareViewCloseBlock) weakSelf.swpShareViewCloseBlock(weakSelf);
        
        if ([weakSelf.delegate respondsToSelector:@selector(swpShareViewClose:)]) {
            [weakSelf.delegate swpShareViewClose:weakSelf];
        }
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


/**!
 *  @ author swp_song
 *
 *  @ brief  setSwpShareListViewDidSelectDelegateOrBlock:swpShare:  ( 设置 代理 和 Block )
 *
 *  @ param  indexPath
 *
 *  @ param  swpShare
 */
- (void)setSwpShareListViewDidSelectDelegateOrBlock:(NSIndexPath *)indexPath swpShare:(SwpShareModel *)swpShare {
    
    if (self.swpShareListViewDidSelectIndexBlock) self.swpShareListViewDidSelectIndexBlock(self, indexPath.item, swpShare);
    if ([self.delegate respondsToSelector:@selector(swpShareView:didSelectIndex:swpShare:)]) {
        [self.delegate swpShareView:self didSelectIndex:indexPath.item swpShare:swpShare];
    }
}

/**!
 *  @ author swp_song
 *
 *  @ brief  setSwpShareListViewWhetherCloseDelegateOrBlock  ( 设置 代理 和 Block )
 *
 *  @ return BOOL
 */
- (BOOL)setSwpShareListViewWhetherCloseDelegateOrBlock {
    
    if (self.swpShareViewWhetherCloseBlock) {
       return self.swpShareViewWhetherCloseBlock(self);
    }
    
    if ([self.delegate respondsToSelector:@selector(swpShareViewWhetherClose:)]) {
        return [self.delegate swpShareViewWhetherClose:self];
    }
    
    return YES;
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

    // 设置 点击 事件 代理 和 Block
    [self setSwpShareListViewDidSelectDelegateOrBlock:indexPath swpShare:swpShare];
    
    if ([self setSwpShareListViewWhetherCloseDelegateOrBlock]) {
        [self swpShareViewHiddenAnimation];
    }
}

/**!
 *  @ author swp_song
 *
 *  @ brief  swpShareListView:tripartiteFrameworkShareType: ( swpShareListView 代理方法 获取 三方框架 分享类型 )
 *
 *  @ param  swpShareListView
 *
 *  @ param  index
 *
 *  @ return id
 */
- (id)swpShareListView:(SwpShareListView *)swpShareListView tripartiteFrameworkShareType:(NSInteger)index {
    if ([self.delegate respondsToSelector:@selector(swpShareViewSetTripartiteFrameworkShareType:)]) {
        NSArray *array = [self.delegate swpShareViewSetTripartiteFrameworkShareType:self];
        return array && array.count == self.swpShares.count ? array[index] : nil;
    }
    return nil;
}


#pragma mark - Init UI Methods
- (UILabel *)swpShareTitleView {
    
    return !_swpShareTitleView ? _swpShareTitleView = ({
        UILabel *label        = [[UILabel alloc] initWithFrame:CGRectMake(20, 0, self.width - 20, 40)];
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

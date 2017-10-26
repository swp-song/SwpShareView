//
//  SwpShareView.m
//  swp_song
//
//  Created by swp_song on 2016/9/28.
//  Copyright © 2016年 swp_song. All rights reserved.
//

#import "SwpShareView.h"


/* ---------------------- Tool       ---------------------- */
#import "SwpShareViewTools.h"               //  工具
#import "UIView+SwpShareView.h"             //  View 分类
/* ---------------------- Tool       ---------------------- */

/* ---------------------- Controller ---------------------- */
/* ---------------------- Controller ---------------------- */

/* ---------------------- View       ---------------------- */
#import "SwpShareListView.h"                //  显示分享列表view
#import "SwpShareViewCell.h"                //  显示分享cell
/* ---------------------- View       ---------------------- */

/* ---------------------- Model      ---------------------- */
#import "SwpShareModel.h"                   //  分享 数据模型
/* ---------------------- Model      ---------------------- */


static NSString * const kSwpShareViewCellID = @"swpShareViewCellID";

@interface SwpShareView () <SwpShareListViewDelegate>

#pragma mark - UI   Propertys
/* ---------------------- UI   Property  ---------------------- */
/* 显示 分享 titleView */
@property (nonatomic, strong) UILabel                    *swpShareTitleView;
/* 显示 分享 view      */
@property (nonatomic, strong) SwpShareListView           *swpShareListView;
/* 显示 关闭 页面 按钮 */
@property (nonatomic, strong) UIButton                   *swpShareCloseButton;
/* ---------------------- UI   Property  ---------------------- */

#pragma mark - Data Propertys
/* ---------------------- Data Property  ---------------------- */
/* 显示 分享 数据源               */
@property (nonatomic, copy  ) NSArray<SwpShareModel *>     *swpShares;

/* 点击 cell 记录点击的数据模型    */
@property (nonatomic, strong) SwpShareModel                *swpShare;

/* 点击 cell 记录点击的数据模型    */
@property (nonatomic, assign) SwpShareItemType             shareItemType;

/* SwpShareView 回调，是否关闭分享页面  */
@property (nonatomic, copy, setter = swpShareViewWhetherCloseBlock:) BOOL(^swpShareViewWhetherCloseBlock)(SwpShareView *swpShareView);

/* SwpShareView 回调，点击每个分享图标调用 */
@property (nonatomic, copy, setter = swpShareListViewDidSelectIndexBlock:) void(^swpShareListViewDidSelectIndexBlock)(SwpShareView *swpShareView, NSInteger didSelectIndex, SwpShareModel *swpShare);
/* SwpShareView 回调，分享页面关闭之后调用  */
@property (nonatomic, copy, setter = swpShareViewCloseBlock:) void(^swpShareViewCloseBlock)(SwpShareView *swpShareView, SwpShareModel *swpShare);


/* ---------------------- Data Property  ---------------------- */

@end

@implementation SwpShareView

/**
 *  @author swp_song
 *
 *  @brief  initWithFrame:  ( Override Init )
 *
 *  @param  frame   frame
 *
 *  @return SwpShareView
 */
- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        
        [SwpShareViewTools swpShareViewToolsSetTapGestureRecognizer:self setViewTag:0 setClickCount:1 setTarget:self setAction:nil setCancelsTouchesInView:NO];
        
        [self setUpUI];
    }
    return self;
}



/**
 *  @author swp_song
 *
 *  @brief  setFrame:   ( Override setFrame )
 *
 *  @param  frame   frame
 */
- (void)setFrame:(CGRect)frame {
    [super setFrame:[SwpShareViewTools swpShareViewToolsCheckFrame:frame]];
}

- (void)dealloc {
    NSLog(@"%s", __FUNCTION__);
}

#pragma mark - Public Methods
/**
 *  @author swp_song
 *
 *  @brief  swpShareViewShowWithData:   ( 显示控件 )
 *
 *  @param  shareData   shareData
 *
 *  @return SwpShareView
 */
+ (instancetype)swpShareViewShowWithData:(NSArray<NSString *> *)shareData {
    return [[self class] swpShareViewShowWithData:shareData setDelegate:nil];
}


/**
 *  @author swp_song
 *
 *  @brief  swpShareViewShowInit    ( 显示控件 )
 */
+ (__kindof SwpShareView * _Nonnull (^)(NSArray<NSString *> * _Nonnull))swpShareViewShowInit {
    
    return ^(NSArray<NSString *> *shareData) {
        return [self.class swpShareViewShowWithData:shareData];
    };
}

/**
 *  @author swp_song
 *
 *  @brief  swpShareViewShowWithData:setDelegate:   ( 显示控件, 并设置代理 )
 *
 *  @param  shareData   shareData
 *
 *  @param  delegate    delegate
 *
 *  @return SwpShareView
 */
+ (instancetype)swpShareViewShowWithData:(NSArray<NSString *> *)shareData setDelegate:(id<SwpShareViewDelegate>)delegate {
    SwpShareView *swpShareView = [SwpShareView initWithData:shareData];
    swpShareView.delegate      = delegate;
    return swpShareView;
}


/**
 *  @author swp_song
 *
 *  @brief  swpShareViewShowInitWithDelegate    ( 显示控件, 并设置代理 )
 */
+ (__kindof SwpShareView * _Nonnull (^)(NSArray<NSString *> * _Nonnull, id<SwpShareViewDelegate> _Nullable))swpShareViewShowInitWithDelegate {
    
    return ^(NSArray<NSString *> *shareData, id<SwpShareViewDelegate>delegate) {
        return [self.class swpShareViewShowWithData:shareData setDelegate:delegate];
    };
}

/**
 *  @author swp_song
 *
 *  @brief  swpShareViewCustomItems:   ( 自定义分享 items )
 */
- (__kindof SwpShareView *(^)(NSArray<SwpShareModel *> *swpShareCustomItems))swpShareViewCustomItems {
    return ^SwpShareView *(NSArray<SwpShareModel *> *swpShareCustomItems) {
        self.swpShares = [SwpShareViewTools swpShareViewToolsDataAppend:self.swpShares appendData:swpShareCustomItems];
        self.swpShareListView.swpShares(self.swpShares);
        return self;
    };
}

/**
 *  @author swp_song
 *
 *  @brief  swpShareViewHidden: ( 关闭 swpShareView  )
 */
- (__kindof SwpShareView *(^)(void))swpShareViewHidden {
    
    return ^SwpShareView *(){
        [self swpShareViewHiddenAnimation];
        return self;
    };
}

/**
 *  @author swp_song
 *
 *  @brief  swpShareSetTripartiteFrameworkShareTypes   ( 设置三方分享 type )
 */
- (__kindof SwpShareView *(^)(NSArray *tripartiteFrameworkShareTypes))swpShareSetTripartiteFrameworkShareTypes {
    
    return ^SwpShareView *(NSArray *tripartiteFrameworkShareTypes) {
        
        self.swpShares = [SwpShareModel swpShareSetShareType:self.swpShares setTripartiteFrameworkShareTypes:tripartiteFrameworkShareTypes];
        self.swpShareListView.swpShares(self.swpShares);
        
        return self;
    };
}


/**
 *  @author swp_song
 *
 *  @brief  swpShareItemType   ( 隐藏未安装 App )
 */
- (__kindof SwpShareView *(^)(SwpShareItemType swpShareItemType))swpShareItemType {
    
    return ^SwpShareView *(SwpShareItemType swpShareItemType) {
        _shareItemType = swpShareItemType;
    
        self.swpShares = [SwpShareViewTools swpShareViewToolsSwpShareItemTypeDataProcessing:self.swpShares swpShareItemType:swpShareItemType];
        self.swpShareListView.swpShares(self.swpShares);
        return self;
    };
}

/**
 *  @author swp_song
 *
 *  @brief  swpShareTitleSize: ( 设置 分享 title 字体 大小 )
 */
- (__kindof SwpShareView *(^)(CGFloat swpShareTitleSize))swpShareTitleSize {

    return ^SwpShareView *(CGFloat swpShareTitleSize) {
        _swpShareTitleView.font = [UIFont fontWithName:@"GillSans-Italic" size:swpShareTitleSize];
        return self;
    };
}

/**
 *  @author swp_song
 *
 *  @brief  swpShareTitle: ( 设置 分享 title )
 */
- (__kindof SwpShareView *(^)(NSString *swpShareTitle))swpShareTitle {
    return ^SwpShareView *(NSString *swpShareTitle) {
        _swpShareTitleView.text = swpShareTitle;
        return self;
    };
}

/**
 *  @author swp_song
 *
 *  @brief  swpShareTitle: ( 设置 分享 字体 颜色 )
 */
- (__kindof SwpShareView *(^)(UIColor *swpShareTitleColor))swpShareTitleColor {
    return ^SwpShareView *(UIColor *swpShareTitleColor){
        _swpShareTitleView.textColor = swpShareTitleColor;
        return self;
    };
}

/**
 *  @author swp_song
 *
 *  @brief  swpShareTitleFont: ( 设置 分享 字体  )
 */
- (__kindof SwpShareView *(^)(UIFont *swpShareTitleFont))swpShareTitleFont {
    
    return ^SwpShareView *(UIFont *swpShareTitleFont) {
        _swpShareTitleView.font = swpShareTitleFont;
        return self;
    };
}

/**
 *  @author swp_song
 *
 *  @brief  swpShareViewWhetherCloseBlock:  ( SwpShareView 回调，是否关闭分享页面 )
 *
 *  @param  swpShareViewWhetherCloseBlock   swpShareViewWhetherCloseBlock
 */
- (void)swpShareViewWhetherCloseBlock:(BOOL (^)(SwpShareView * _Nonnull))swpShareViewWhetherCloseBlock {
    _swpShareViewWhetherCloseBlock = swpShareViewWhetherCloseBlock;
}


/**
 *  @author swp_song
 *
 *  @brief  swpShareViewWhetherCloseBlockChain   ( SwpShareView 回调，是否关闭分享页面 )
 */
- (__kindof SwpShareView * _Nonnull (^)(BOOL (^)(SwpShareView * _Nonnull)))swpShareViewWhetherCloseBlockChain {
    
    return ^(BOOL (^swpShareViewWhetherCloseBlock)(SwpShareView *swpShareView)){
        _swpShareViewWhetherCloseBlock = swpShareViewWhetherCloseBlock;
        return self;
    };
    
}


/**
 *  @author swp_song
 *
 *  @brief  swpShareListViewDidSelectIndexBlock:    ( SwpShareView 回调，点击每个分享图标调用 )
 *
 *  @param  swpShareListViewDidSelectIndexBlock swpShareListViewDidSelectIndexBlock
 */
- (void)swpShareListViewDidSelectIndexBlock:(void (^)(SwpShareView * _Nonnull, NSInteger, SwpShareModel * _Nonnull))swpShareListViewDidSelectIndexBlock {
    _swpShareListViewDidSelectIndexBlock = swpShareListViewDidSelectIndexBlock;
}



/**
 *  @author swp_song
 *
 *  @brief  swpShareListViewDidSelectIndexBlockChain    ( SwpShareView 回调，点击每个分享图标调用 )
 */
- (__kindof SwpShareView * _Nonnull (^)(void (^)(SwpShareView * _Nonnull, NSInteger, SwpShareModel * _Nonnull)))swpShareListViewDidSelectIndexBlockChain {
    
    return ^(void (^swpShareListViewDidSelectIndexBlock)(SwpShareView *swpShareView, NSInteger didSelectIndex, SwpShareModel *swpShare)) {
        _swpShareListViewDidSelectIndexBlock = swpShareListViewDidSelectIndexBlock;
        return self;
    };
}


/**
 *  @author swp_song
 *
 *  @brief  swpShareViewCloseBlock: ( SwpShareView 回调，分享页面关闭之后调用 )
 *
 *  @param swpShareViewCloseBlock   swpShareVswpShareViewCloseBlockiewCloseBlock
 */
- (void)swpShareViewCloseBlock:(void (^)(SwpShareView * _Nonnull, SwpShareModel * _Nonnull))swpShareViewCloseBlock {
    _swpShareViewCloseBlock = swpShareViewCloseBlock;
}

/**
 *  @author swp_song
 *
 *  @brief  swpShareViewCloseBlockChain ( SwpShareView 回调，分享页面关闭之后调用 )
 */
- (__kindof SwpShareView * _Nonnull (^)(void (^)(SwpShareView * _Nonnull, SwpShareModel * _Nonnull)))swpShareViewCloseBlockChain {
    
    return ^(void (^swpShareViewCloseBlock)(SwpShareView *swpShareView, SwpShareModel *swpShare)) {
        _swpShareViewCloseBlock = swpShareViewCloseBlock;
        return self;
    };
}



#pragma mark - Private Methods
/**
 *  @author swp_song
 *
 *  @brief  setUpUI ( 添加控件 )
 */
- (void)setUpUI {

    [self addSubview:self.swpShareTitleView];
    [self addSubview:self.swpShareCloseButton];
    [self addSubview:self.swpShareListView];
}

static UIWindow *swpShareWindow_;

/**
 *
 *  @author swp_song
 *
 *  @brief  initWithData:   ( 快速初始化 )
 *
 *  @param  shareData   shareData
 *
 *  @return SwpShareView
 */
+ (instancetype)initWithData:(NSArray<NSString *> *)shareData {
    swpShareWindow_                 = [[UIWindow alloc] initWithFrame:[SwpShareViewTools swpShareViewToolsMainScreen]];
    swpShareWindow_.hidden          = NO;

    
    swpShareWindow_.backgroundColor = [UIColor clearColor];
    
    //  计算 view 高度
    SwpShareView *swpShareView      = [[SwpShareView alloc] initWithFrame:[SwpShareViewTools swpShareViewToolsCalculateFrame:shareData.count viewWidth:1000]];
    
    //  设置数据
    swpShareView.swpShares          = [SwpShareModel swpShareWihtGroup:[SwpShareViewTools swpShareViewToolsDataProcessing:shareData]];
    
    // 添加遮罩
    [swpShareWindow_ addSubview:[SwpShareViewTools swpShareViewToolsCreateToolbarCover:swpShareWindow_.frame]];
    
    [swpShareView swpShareViewShowAnimation];
    
    [swpShareWindow_ addSubview:swpShareView];
    return swpShareView;
}

/**
 *  @author swp_song
 *
 *  @brief  clickCloseButtonEvent:  ( 关闭按钮绑定方法 )
 *
 *  @param  button  button
 */
- (void)clickCloseButtonEvent:(UIButton *)button {
    [self swpShareViewHiddenAnimation];
}


/**
 *  @author swp_song
 *
 *  @brief  clickViewEvent: ( view 绑定方法 )
 *
 *  @param  tapGestureRecognizer    tapGestureRecognizer
 */
- (void)clickViewEvent:(UITapGestureRecognizer *)tapGestureRecognizer {
    
    [self swpShareViewHiddenAnimation];
}

/**
 *  @author swp_song
 *
 *  @brief  swpShareViewShowAnimation: ( SwpShareView 动画显示 )
 */
- (void)swpShareViewShowAnimation {
    
    [SwpShareViewTools swpShareViewToolsSetTapGestureRecognizer:swpShareWindow_ setViewTag:0 setClickCount:1 setTarget:self setAction:@selector(clickViewEvent:) setCancelsTouchesInView:YES];
    
    [SwpShareViewTools swpShareViewToolsCenterAnimation:self setFromValue:CGPointMake(swpShareWindow_.centerX, swpShareWindow_.centerY - 1000) setToValue:swpShareWindow_.center animationCompletionBlock:nil];
}

/**
 *  @author swp_song
 *
 *  @brief  swpShareViewHiddenAnimation: ( swpShareView 动画关闭 )
 */
- (void)swpShareViewHiddenAnimation {
    
    
    __weak typeof(self)weakSelf = self;
    [SwpShareViewTools swpShareViewToolsAlphaAnimation:swpShareWindow_ setFromValue:1 setToValue:0 animationCompletionBlock:^(BOOL finished) {
        swpShareWindow_.hidden = YES;
        [weakSelf setSwpShareListViewCloseDelegateOrBlock:weakSelf.swpShare];
        swpShareWindow_        = nil;
    }];
}

/**
 *  @author swp_song
 *
 *  @brief  setSwpShares    ( Override Setter )
 *
 *  @param  swpShares   swpShares
 */
- (void)setSwpShares:(NSArray<SwpShareModel *> *)swpShares {
    _swpShares = swpShares;
    _swpShareListView.swpShares(_swpShares);
}


/**
 *  @author swp_song
 *
 *  @brief  setSwpShareListViewWhetherCloseDelegateOrBlock  ( 设置 SwpShareView 是否关闭分享页面，代理和 Block )
 *
 *  @return BOOL
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

/**
 *  @author swp_song
 *
 *  @brief  setSwpShareListViewDidSelectDelegateOrBlock:swpShare:  ( 设置 SwpShareView，点击每个分享图标，代理和 Block )
 *
 *  @param  indexPath   indexPath
 *
 *  @param  swpShare    swpShare
 */
- (void)setSwpShareListViewDidSelectDelegateOrBlock:(NSIndexPath *)indexPath swpShare:(SwpShareModel *)swpShare {
    
    if (self.swpShareListViewDidSelectIndexBlock) self.swpShareListViewDidSelectIndexBlock(self, indexPath.item, swpShare);
    if ([self.delegate respondsToSelector:@selector(swpShareView:didSelectIndex:swpShare:)]) {
        [self.delegate swpShareView:self didSelectIndex:indexPath.item swpShare:swpShare];
    }
}




/**
 *  @author swp_song
 *
 *  @brief  setSwpShareListViewCloseDelegateOrBlock  ( 设置 SwpShareView  关闭之后，代理和 Block )
 *
 *  @param  swpShare    swpShare
 */
- (void)setSwpShareListViewCloseDelegateOrBlock:(SwpShareModel *)swpShare {
    if (self.swpShareViewCloseBlock) self.swpShareViewCloseBlock(self, swpShare);
    if ([self.delegate respondsToSelector:@selector(swpShareView:closeSwpShareView:)]) {
        [self.delegate swpShareView:self closeSwpShareView:swpShare];
    }
}


#pragma mark - SwpShareListView Delegate Methods
/**
 *  @author swp_song
 *
 *  @brief  swpShareListView:didSelectItemAtIndexPath:swpShare:swpShareKey: ( SwpShareListView 代理方法，点击 Cell 时调用 )
 *
 *  @param  swpShareListView    swpShareListView
 *
 *  @param  indexPath           indexPath
 *
 *  @param  swpShare            swpShare
 *
 *  @param  swpShareKey         swpShareKey
 */
- (void)swpShareListView:(SwpShareListView *)swpShareListView didSelectItemAtIndexPath:(NSIndexPath *)indexPath swpShare:(SwpShareModel *)swpShare swpShareKey:(NSString *)swpShareKey {
    
    self.swpShare = swpShare;
    
    // 是否 被禁用
    if (!self.swpShare.isSwpShareEnabled) return;
    
    // 设置 点击 事件 代理 和 Block
    [self setSwpShareListViewDidSelectDelegateOrBlock:indexPath swpShare:self.swpShare];
    
    if ([self setSwpShareListViewWhetherCloseDelegateOrBlock]) {
        [self swpShareViewHiddenAnimation];
    }
}

/**
 *  @author swp_song
 *
 *  @brief  swpShareListView:tripartiteFrameworkShareType: ( SwpShareListView 代理方法，获取三方框架分享类型 )
 *
 *  @param  swpShareListView    swpShareListView
 *
 *  @param  index               index
 *
 *  @return id                  id
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
        [SwpShareViewTools swpShareViewToolsSetLabelWith:label setTitle:@"分享平台" setFontSize:14 setTitleColor:[UIColor whiteColor]];
        label.textAlignment = NSTextAlignmentCenter;
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
        
        button.frame = CGRectMake((self.width / 2.0f) - (30.0 / 2.0), self.height - 30 - 10, 30, 30);
        [button addTarget:self action:@selector(clickCloseButtonEvent:) forControlEvents:UIControlEventTouchUpInside];
        [button setImage:[UIImage imageNamed:@"SwpShareView.bundle/share_close"] forState:UIControlStateNormal];
        [button setImage:[UIImage imageNamed:@"SwpShareView.bundle/share_close"] forState:UIControlStateHighlighted];
        button.layer.borderWidth    = 1;
        button.layer.borderColor    = [UIColor whiteColor].CGColor;
        button.layer.cornerRadius   = button.frame.size.width / 2;
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

//
//  SwpShareView.m
//  PalmHeCheng
//
//  Created by swp_song on 2016/9/28.
//  Copyright © 2016年 songweipng. All rights reserved.
//

#import "SwpShareView.h"

#import <POP/POP.h>
#import "SwpShareViewTools.h"
#import "UIView+SwpShareView.h"



#import "SwpShareViewCell.h"


#import "SwpShareModel.h"




static NSString * const kSwpShareViewCellID = @"swpShareViewCellID";

@interface SwpShareView () <UICollectionViewDelegateFlowLayout, UICollectionViewDataSource, UICollectionViewDelegate>

@property (nonatomic, strong) UICollectionView           *swpShareCollectionView;
@property (nonatomic, strong) UICollectionViewFlowLayout *flowLayout;

@property (nonatomic, strong) UILabel                    *swpShareTitleView;
@property (nonatomic, strong) UIButton                   *swpShareCloseButton;

@property (nonatomic, copy) NSArray<SwpShareModel *>     *swpShares;


@end

@implementation SwpShareView


- (instancetype)initWithFrame:(CGRect)frame {
    
    if (self = [super initWithFrame:frame]) {
    
        self.backgroundColor = [[UIColor whiteColor] colorWithAlphaComponent:1];
        [self addSubview:self.swpShareTitleView];
        [self addSubview:self.swpShareCloseButton];
        [self addSubview:self.swpShareCollectionView];
    }
    
    return self;
}


- (void)setFrame:(CGRect)frame {
    
    [super setFrame:[SwpShareViewTools swpShareViewToolsCheckFrame:frame]];
}


+ (void)swpShareViewShowWithData:(NSArray<NSString *> *)shareData {
    
    [SwpShareView showViewWithData:shareData];
}



static UIWindow * swpShareWindow_;

+ (void)showViewWithData:(NSArray<NSString *> *)shareData {


    

    swpShareWindow_                 = [[UIWindow alloc] initWithFrame:[SwpShareViewTools swpShareViewToolsMainScreen]];
    swpShareWindow_.hidden          = NO;
    swpShareWindow_.backgroundColor = [[UIColor blackColor] colorWithAlphaComponent:0.6];
    
    
    SwpShareView *swpShareView      = [[SwpShareView alloc] initWithFrame:CGRectMake(0, 0, 1000, 300)];
    swpShareView.swpShares          = [SwpShareModel swpShareWihtGroup:[SwpShareViewTools swpShareViewToolsDataProcessing:shareData]];
    [swpShareView swpShareViewShowAnimation];
    [swpShareWindow_ addSubview:swpShareView];
    
}




#pragma mark - UICollectionView DataSoure Methods
/*!
 *  @ author swp_song
 *
 *  @brief  collectionView DataSource ( collectionView 数据源方法 设置 collectionView 分组个数 )
 *
 *  @ param  collectionView
 *
 *  @ return NSInteger
 */
- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    return 1;
}


- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    
    return self.swpShares.count;
}

/*!
 *  @ author swp_song
 *
 *  @brief  collectionView DataSource ( collectionView 数据源方法 设置 collectionView 分组中cell显示的数据 | 样式 )
 *
 *  @ param  collectionView
 *
 *  @ param  indexPath
 *
 *  @return UICollectionViewCell
 */
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    
    SwpShareViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:kSwpShareViewCellID forIndexPath:indexPath];
    cell.swpShare          = self.swpShares[indexPath.item];
    return cell;
}




#pragma mark - UICollectionView Delegate Methods
/*!
 *  @ author swp_song
 *
 *  @brief  collectionView Delegate ( collectionView 代理方法 设置 collectionView  每个cell的宽高 )
 *
 *  @ param  collectionView
 *
 *  @ param  collectionViewLayout
 *
 *  @ param  indexPath
 *
 *  @ return CGSize
 */
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath {
    return CGSizeMake(self.swpShareCollectionView.width / 4.0f - 15 , self.swpShareCollectionView.width / 4.0f);
}

- (UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout insetForSectionAtIndex:(NSInteger)section {
    
    return UIEdgeInsetsMake(0, 10, 0, 10);
}



- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    NSLog(@"123");
}

- (void)didButton:(UIButton *)button {
    
    [self swpShareViewHiddenAnimation];
}


#pragma mark - Private 

- (void)swpShareViewShowAnimation {
    [SwpShareViewTools swpShareViewToolsCenterAnimation:self setFromValue:CGPointMake(swpShareWindow_.centerX, swpShareWindow_.centerY - 1000) setToValue:swpShareWindow_.center animationCompletionBlock:nil];
}

- (void)swpShareViewHiddenAnimation {
    
    [SwpShareViewTools swpShareViewToolsAlphaAnimation:swpShareWindow_ setFromValue:1 setToValue:0 animationCompletionBlock:^(BOOL finished) {
        swpShareWindow_.hidden = YES;
        swpShareWindow_        = nil;
    }];
}



- (void)dealloc {
    
    NSLog(@"%s", __FUNCTION__);
}


#pragma mark -
- (UILabel *)swpShareTitleView {
    
    return !_swpShareTitleView ? _swpShareTitleView = ({
        UILabel *label        = [[UILabel alloc] initWithFrame:CGRectMake(20, 0, self.width, 40)];
        label.backgroundColor = [UIColor clearColor];
        [SwpShareViewTools swpShareViewToolsSetLabelWith:label setTitle:@"分享平台" setFontSize:14 setTitleColor:[UIColor redColor]];
        label;
    }) : _swpShareTitleView;
}

- (UICollectionViewFlowLayout *)flowLayout {
    
    return !_flowLayout ? _flowLayout = ({
        UICollectionViewFlowLayout *flowLayout = [[UICollectionViewFlowLayout alloc] init];
        flowLayout.scrollDirection             = UICollectionViewScrollDirectionVertical;
        flowLayout;
    }) : _flowLayout;
}

- (UICollectionView *)swpShareCollectionView {
    
    return !_swpShareCollectionView ? _swpShareCollectionView = ({
        UICollectionView *collectionView = [[UICollectionView alloc] initWithFrame:CGRectMake(0, CGRectGetMaxY(self.swpShareTitleView.frame), self.width, self.height - self.swpShareCloseButton.height - self.swpShareTitleView.height - 20) collectionViewLayout:self.flowLayout];
        collectionView.backgroundColor   = [UIColor clearColor];
        collectionView.dataSource        = self;
        collectionView.delegate          = self;
        [collectionView registerClass:[SwpShareViewCell class] forCellWithReuseIdentifier:kSwpShareViewCellID];
        collectionView;
    }) : _swpShareCollectionView;
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

NSString * const SwpShareToQQ               = @"SwpShare-SwpShareToQQ-QQ好友-SwpShareView.bundle/share_qq";
NSString * const SwpShareToQzone            = @"SwpShare-SwpShareToQzone-QQ空间-SwpShareView.bundle/share_qzone";
NSString * const SwpShareToTencent          = @"SwpShare-SwpShareToTencent-腾讯微博-SwpShareView.bundle/share_tencent";
NSString * const SwpShareToWechatSession    = @"SwpShare-SwpShareToWechatSession-微信好友-SwpShareView.bundle/share_wechat";
NSString * const SwpShareToWechatTimeline   = @"SwpShare-SwpShareToWechatTimeline-朋友圈-SwpShareView.bundle/share_wechattimeline";
NSString * const SwpShareToSina             = @"SwpShare-SwpShareToSina-新浪微博-SwpShareView.bundle/share_sina";
NSString * const SwpShareToCopyURL          = @"SwpShare-SwpShareToCopyURL-复制链接-SwpShareView.bundle/share_copy_url";


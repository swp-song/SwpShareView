//
//  SwpShareListView.m
//  swp_song
//
//  Created by swp_song on 2016/10/1.
//  Copyright © 2016年 swp_song. All rights reserved.
//

#import "SwpShareListView.h"

/*! ---------------------- Tool       ---------------------- !*/
#import "UIView+SwpShareView.h"             //  View 分类
/*! ---------------------- Tool       ---------------------- !*/

/*! ---------------------- Controller ---------------------- !*/
/*! ---------------------- Controller ---------------------- !*/

/*! ---------------------- View       ---------------------- !*/
#import "SwpShareViewCell.h"                //  显示分享cell
/*! ---------------------- View       ---------------------- !*/

/*! ---------------------- Model      ---------------------- !*/
#import "SwpShareModel.h"                   //  分享 数据模型
/*! ---------------------- Model      ---------------------- !*/


static NSString * const kSwpShareViewCellID = @"swpShareViewCellID";

@interface SwpShareListView () <UICollectionViewDelegateFlowLayout, UICollectionViewDataSource, UICollectionViewDelegate>

#pragma mark - UI   Propertys
/*! ---------------------- UI   Property  ---------------------- !*/
/*! SwpShareListView 布局 文件 !*/
@property (nonatomic, strong) UICollectionViewFlowLayout *swpShareListFlowLayout;
/*! ---------------------- UI   Property  ---------------------- !*/

#pragma mark - Data Propertys
/*! ---------------------- Data Property  ---------------------- !*/
/*! SwpShareListView 数据源     !*/
@property (nonatomic, copy  ) NSArray<SwpShareModel *> *swpShareListDatas;
/*! ---------------------- Data Property  ---------------------- !*/

@end

@implementation SwpShareListView

/**!
 *  @ author swp_song
 *
 *  @ brief  initWithFrame:  ( Override Init )
 *
 *  @ param  frame
 *
 *  @ param  layout
 *
 *  @ return SwpShareListView
 */
- (instancetype)initWithFrame:(CGRect)frame collectionViewLayout:(UICollectionViewLayout *)layout {
    
    if (self = [super initWithFrame:frame collectionViewLayout:layout]) {
     
        [self registerClass:[SwpShareViewCell class] forCellWithReuseIdentifier:kSwpShareViewCellID];
        self.backgroundColor   = [UIColor clearColor];
        self.dataSource        = self;
        self.delegate          = self;
    }
    return self;
}

#pragma mark - UICollectionView DataSoure Methods

/**!
 *  @ author swp_song
 *
 *  @ brief  numberOfSectionsInCollectionView: ( collectionView 数据源方法 设置 collectionView 分组个数 )
 *
 *  @ param  collectionView
 *
 *  @ return NSInteger
 */
- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    return 1;
}

/**!
 *  @ author swp_song
 *
 *  @ brief  collectionView:numberOfItemsInSection: ( collectionView 数据源方法 每组 cell 个数 )
 *
 *  @ param  collectionView
 *
 *  @ param  section
 *
 *  @ return NSInteger
 */
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return self.swpShareListDatas.count;
}

/**!
 *  @ author swp_song
 *
 *  @ brief  collectionView:cellForItemAtIndexPath: ( collectionView 数据源方法 设置 cell 显示的数据 | 样式 )
 *
 *  @ param  collectionView
 *
 *  @ param  indexPath
 *
 *  @ return UICollectionViewCell
 */
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    SwpShareViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:kSwpShareViewCellID forIndexPath:indexPath];
    cell.swpShare          = [self swpShareDataProcessing:self.swpShareListDatas[indexPath.item] setTripartiteFrameworkShareType:indexPath.item];
    return cell;
}




#pragma mark - UICollectionView Delegate Methods
/**!
 *  @ author swp_song
 *
 *  @ brief  collectionView:layout:sizeForItemAtIndexPath: ( collectionView 代理方法 设置每个 cell size )
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
    return CGSizeMake(self.width / 4.0f - 15 , self.width / 4.0f);
}

/**!
 *  @ author swp_song
 *
 *  @ brief  collectionView:layout:insetForSectionAtIndex: ( collectionView 代理方法 设置 cell 上左下右 边距 )
 *
 *  @ param  collectionView
 *
 *  @ param  collectionViewLayout
 *
 *  @ param  section
 *
 *  @ return UIEdgeInsets
 */
- (UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout insetForSectionAtIndex:(NSInteger)section {
    return UIEdgeInsetsMake(10, 10, 10, 10);
}

/**!
 *  @ author swp_song
 *
 *  @ brief  collectionView:didSelectItemAtIndexPath:   ( collectionView 代理方法 cell 点击 回调  )
 *
 *  @ param  collectionView
 *
 *  @ param  indexPath
 */
- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    
    if ([self.swpShareListViewDelegate respondsToSelector:@selector(swpShareListView:didSelectItemAtIndexPath:swpShare:swpShareKey:)]) {
        SwpShareViewCell *cell = (SwpShareViewCell *)[collectionView cellForItemAtIndexPath:indexPath];
        [self.swpShareListViewDelegate swpShareListView:self didSelectItemAtIndexPath:indexPath swpShare:cell.swpShare swpShareKey:cell.swpShare.swpShareKey];
    }
}

#pragma mark - Private Methods

/**!
 *  @ author swp_song
 *
 *  @ brief  swpShareDataProcessing:setTripartiteFrameworkShareType:    ( SwpShareModel 数据 处理 )
 *
 *  @ param  swpShare
 *
 *  @ param  index
 *
 *  @ return SwpShareModel
 */
- (SwpShareModel *)swpShareDataProcessing:(SwpShareModel *)swpShare setTripartiteFrameworkShareType:(NSInteger)index {
    id tripartiteFrameworkShareType = [self.swpShareListViewDelegate swpShareListView:self tripartiteFrameworkShareType:index];
    if (tripartiteFrameworkShareType) {
        return [SwpShareModel swpShareWithSwpShare:swpShare setSwpTripartiteFrameworkShareType:tripartiteFrameworkShareType];
    }
    return swpShare;
}

#pragma mark - Public Methods

/**!
 *  @ author swp_song
 *
 *  @ brief  initSwpShareListViewWithFrame: ( 初始化 数据 )
 *
 *  @ param  frame
 *
 *  @ return SwpShareListView
 */
- (instancetype)initSwpShareListViewWithFrame:(CGRect)frame {
    SwpShareListView *swpShareListView = [[SwpShareListView alloc] initWithFrame:frame collectionViewLayout:self.swpShareListFlowLayout];
    return swpShareListView;
}


/**!
 *  @ author swp_song
 *
 *  @ brief  swpShares: ( 设置 数据  )
 */
- (SwpShareListView *(^)(NSArray<SwpShareModel *> *))swpShares {

    return ^SwpShareListView *(NSArray<SwpShareModel *> * swpShares) {
        _swpShareListDatas = swpShares;
        [self reloadData];
        return self;
    };
}

#pragma mark - Init UI Methods
- (UICollectionViewFlowLayout *)swpShareListFlowLayout {
    
    return !_swpShareListFlowLayout ? _swpShareListFlowLayout = ({
        UICollectionViewFlowLayout *flowLayout = [[UICollectionViewFlowLayout alloc] init];
        flowLayout.scrollDirection             = UICollectionViewScrollDirectionVertical;
        flowLayout;
    }) : _swpShareListFlowLayout;
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end

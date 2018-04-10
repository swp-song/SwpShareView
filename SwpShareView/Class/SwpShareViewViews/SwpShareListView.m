//
//  SwpShareListView.m
//  swp_song
//
//  Created by swp_song on 2016/10/1.
//  Copyright © 2016年 swp_song. All rights reserved.
//

#import "SwpShareListView.h"

/* ---------------------- Tool       ---------------------- */
#import "UIView+SwpShareView.h"             //  View 分类
/* ---------------------- Tool       ---------------------- */

/* ---------------------- Controller ---------------------- */
/* ---------------------- Controller ---------------------- */

/* ---------------------- View       ---------------------- */
#import "SwpShareViewCell.h"                //  显示分享cell
/* ---------------------- View       ---------------------- */

/* ---------------------- Model      ---------------------- */
#import "SwpShareModel.h"                   //  分享 数据模型
/* ---------------------- Model      ---------------------- */


static NSString * const kSwpShareViewCellID = @"swpShareViewCellID";

@interface SwpShareListView () <UICollectionViewDelegateFlowLayout, UICollectionViewDataSource, UICollectionViewDelegate>

#pragma mark - UI   Propertys
/* ---------------------- UI   Property  ---------------------- */
/* SwpShareListView 布局 文件 */
@property (nonatomic, strong) UICollectionViewFlowLayout *swpShareListFlowLayout;
/* ---------------------- UI   Property  ---------------------- */

#pragma mark - Data Propertys
/* ---------------------- Data Property  ---------------------- */
/* SwpShareListView 数据源     */
@property (nonatomic, copy  ) NSArray<SwpShareModel *> *swpShareListDatas;
/* ---------------------- Data Property  ---------------------- */

@end

@implementation SwpShareListView

/**
 *  @author swp_song
 *
 *  @brief  initWithFrame:collectionViewLayout: ( Override Init )
 *
 *  @param  frame   frame
 *
 *  @param  layout  layout
 *
 *  @return SwpShareListView
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
/**
 *  @author swp_song
 *
 *  @brief  numberOfSectionsInCollectionView:   ( CollectionView 数据源方法，设置 CollectionView 分组个数 )
 *
 *  @param  collectionView  collectionView
 *
 *  @return NSInteger       NSInteger
 */
- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    return 1;
}


/**
 *  @author swp_song
 *
 *  @brief  collectionView:numberOfItemsInSection:  ( CollectionView 数据源方法，设置 CollectionView 分组中 cell 显示的个数 )
 *
 *  @param  collectionView  collectionView
 *
 *  @param  section         section
 *
 *  @return NSInteger       NSInteger
 */
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return self.swpShareListDatas.count;
}

/**
 *  @author swp_song
 *
 *  @brief  collectionView:cellForItemAtIndexPath:  ( CollectionView 数据源方法，设置 CollectionView 分组中 Cell 显示的数据 | 样式 )
 *
 *  @param  collectionView          collectionView
 *
 *  @param  indexPath               indexPath
 *
 *  @return UICollectionViewCell    UICollectionViewCell
 */
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    SwpShareViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:kSwpShareViewCellID forIndexPath:indexPath];
    cell.swpShare          = [self swpShareDataProcessing:self.swpShareListDatas[indexPath.item] setTripartiteFrameworkShareType:indexPath.item];
    return cell;
}




#pragma mark - UICollectionView Delegate Methods
/**
 *  @author swp_song
 *
 *  @brief  collectionView:layout:insetForSectionAtIndex:   ( CollectionView 代理方法，设置 CollectionView 每个 cell 上-左-下-右边距 )
 *
 *  @param  collectionView          collectionView
 *
 *  @param  collectionViewLayout    collectionViewLayout
 *
 *  @param  section                 section
 *
 *  @return UIEdgeInsets            UIEdgeInsets
 */
- (UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout insetForSectionAtIndex:(NSInteger)section {
    return UIEdgeInsetsMake(10, 10, 10, 10);
}

/**
 *  @author swp_song
 *
 *  @brief  collectionView:layout:sizeForItemAtIndexPath:   ( CollectionView 代理方法，设置 CollectionView  每个cell的宽高 )
 *
 *  @param  collectionView          collectionView
 *
 *  @param  collectionViewLayout    collectionViewLayout
 *
 *  @param  indexPath               indexPath
 *
 *  @return CGSize
 */
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath {
    return CGSizeMake(self.width / 4.0f - 15 , self.width / 4.0f);
}


/**
 *  @author swp_song
 *
 *  @brief  collectionView:didSelectItemAtIndexPath:    ( CollectionView 代理方法 cell 点击调用  )
 *
 *  @param  collectionView  collectionView
 *
 *  @param  indexPath       indexPath
 */
- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    
    if ([self.swpShareListViewDelegate respondsToSelector:@selector(swpShareListView:didSelectItemAtIndexPath:swpShare:swpShareKey:)]) {
        SwpShareViewCell *cell = (SwpShareViewCell *)[collectionView cellForItemAtIndexPath:indexPath];
        [self.swpShareListViewDelegate swpShareListView:self didSelectItemAtIndexPath:indexPath swpShare:cell.swpShare swpShareKey:cell.swpShare.swpShareKey];
    }
}

#pragma mark - Private Methods

/**
 *  @author swp_song
 *
 *  @brief  swpShareDataProcessing:setTripartiteFrameworkShareType:    ( SwpShareModel 数据 处理 )
 *
 *  @param  swpShare        swpShare
 *
 *  @param  index           index
 *
 *  @return SwpShareModel   SwpShareModel
 */
- (SwpShareModel *)swpShareDataProcessing:(SwpShareModel *)swpShare setTripartiteFrameworkShareType:(NSInteger)index {
    id tripartiteFrameworkShareType = [self.swpShareListViewDelegate swpShareListView:self tripartiteFrameworkShareType:index];
    if (tripartiteFrameworkShareType) {
        return [SwpShareModel swpShareWithSwpShare:swpShare setSwpTripartiteFrameworkShareType:tripartiteFrameworkShareType];
    }
    return swpShare;
}

/**
 *  @author swp_song
 *
 *  @brief  swpShareDataAppend:appendData: ( 数据追加 )
 *
 *  @param  originalData    originalData
 *
 *  @param  appendData      appendData
 *
 *  @return NSArray
 */
- (NSArray<SwpShareModel *> *)swpShareDataAppend:(NSArray<SwpShareModel *> *)originalData appendData:(NSArray<SwpShareModel *> *)appendData {
    
    NSMutableArray<SwpShareModel *> *models = [NSMutableArray arrayWithArray:originalData];
    [appendData enumerateObjectsUsingBlock:^(SwpShareModel * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        [models addObject:obj];
    }];
    return models.copy;
}

#pragma mark - Public Methods
/**
 *  @author swp_song
 *
 *  @brief  initSwpShareListViewWithFrame:  ( 快速初始化 )
 *
 *  @param  frame   frame
 *
 *  @return SwpShareListView
 */
- (instancetype)initSwpShareListViewWithFrame:(CGRect)frame {
    SwpShareListView *swpShareListView = [[SwpShareListView alloc] initWithFrame:frame collectionViewLayout:self.swpShareListFlowLayout];
    return swpShareListView;
}


/**
 *  @author swp_song
 *
 *  @brief  swpShares:  ( 设置数据 )
 */
- (SwpShareListView *(^)(NSArray<SwpShareModel *> *))swpShares {

    return ^SwpShareListView *(NSArray<SwpShareModel *> * swpShares) {
        self.swpShareListDatas = swpShares;
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
